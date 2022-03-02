package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.entity.user.SysUserRole;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.common.UserConstants;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.exception.CustomException;
import com.nyanner.govii.elementary.mapper.RankSettingMapper;
import com.nyanner.govii.elementary.mapper.SysUserMapper;
import com.nyanner.govii.elementary.mapper.SysUserRoleMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import com.nyanner.govii.elementary.utils.StringUtils;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.utility.RandomString;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.sql.Timestamp;
import java.util.*;

@Service
@AllArgsConstructor
@Slf4j
public class UserService {
    private final SysUserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JavaMailSenderImpl mailSender;
    private final SysUserRoleMapper userRoleMapper;
    private SecurityAuditorAware securityAuditorAware;
    private final RankSettingMapper rankSettingMapper;

    public PageMode<SysUser> getUsers(SysUser sysUser) {
        if (sysUser.getLimit() == null) {
            sysUser.setLimit(10);
        }
        if (sysUser.getPage() == null) {
            sysUser.setPage(1);
        }
        return PageUtil.query(sysUser.getPage(), sysUser.getLimit(),
            () -> userMapper.selectUserList(sysUser));
    }

    public SysUser getUserById(Long id) {
        return userMapper.selectUserById(id);
    }

    public SysUser registerUser(SysUser user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userMapper.insertUser(user);
        return user;
    }

    public Boolean existsByUsername(String username) {
        return userMapper.checkUserNameUnique(username) != 0;
    }

    public Boolean existsByEmail(String email) {
        return userMapper.checkEmailUnique(email) != null;
    }


    public RestResponse sentCode(String userName) {
        SysUser user = userMapper.selectUserByUserName(userName);
        if (user == null)
            return RestResponse.fail("用户名不存在");
        String email = user.getEmail();

        String codeNum = ""; //验证码

        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(mimeMessage, true);

            int[] code = new int[3];
            Random random = new Random();
            //自动生成验证码
            for (int i = 0; i < 6; i++) {
                int num = random.nextInt(10) + 48;
                int uppercase = random.nextInt(26) + 65;
                int lowercase = random.nextInt(26) + 97;
                code[0] = num;
                code[1] = uppercase;
                code[2] = lowercase;
                codeNum += (char) code[random.nextInt(3)];
            }
            //标题
            helper.setSubject("电信知识库忘记密码验证");


            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.append("<html><head><title></title></head><body>");
            stringBuilder.append("您好<br/>");
            stringBuilder.append("您的验证码是：<h2>").append(codeNum).append("</h2><br/>");
            stringBuilder.append("您可以复制此验证码并返回至XXX，以验证您的邮箱。<br/>");
            stringBuilder.append("此验证码只能使用一次，在5分钟内有效。验证成功则自动失效。<br/>");
            stringBuilder.append("如果您没有进行上述操作，请忽略此邮件。");

            //内容
            helper.setText(stringBuilder.toString(), true);
            //邮件接收者
            helper.setTo(email);
            //邮件发送者，必须和配置文件里的一样，不然授权码匹配不上
            helper.setFrom("2033279818@qq.com");
            mailSender.send(mimeMessage);
            log.info("邮件发送成功！");

        } catch (MessagingException e) {
            RestResponse.fail("邮箱错误!");
        }

        Timestamp outDate = new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000);//5分钟过期
        user.setRemark(codeNum);    //数据库的用户表中原本remark（备注）字段现在作为验证码存储
        user.setUpdateTime(outDate);//原本update_time字段作为有效期
        userMapper.updateUserVerify(user);


        return RestResponse.ok().msg("验证码成功发送");
    }

    public RestResponse resetPassword(Map<String, Object> map) {
        String username = map.get("username").toString();//用户名
        SysUser user = userMapper.selectUserByUserName(username);
        if (user == null)
            return RestResponse.fail("用户名不存在");
        if (user.getRemark() == null || "".equals(user.getRemark())) {
            return RestResponse.fail("未发送验证码");
        }
        //判断验证码是否有效
        Date codeExpiredTime = user.getUpdateTime();
        Date date = new Date();
        if (date.getTime() > codeExpiredTime.getTime())
            return RestResponse.fail("验证码过期");
        //判断验证码是否正确
        String verificationCode = map.get("verificationCode").toString();
        if (!verificationCode.equals(user.getRemark()))
            return RestResponse.fail("验证码不正确");

        String newPassword = map.get("newPassword").toString();//新密码

        user.setUpdateTime(date);
        user.setPassword(newPassword);  //要经过加密算法加密
        user.setRemark("");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userMapper.updateUser(user);
        return RestResponse.ok().msg("修改密码成功，请重新登录");
    }


    /**
     * @param user
     * @return
     * @Description 根据用户条件查询用户
     **/
    public List<SysUser> selectUserList(SysUser user) {
        return userMapper.selectUserList(user);
    }


    @Transactional
    public int insertUser(SysUser user) {
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows;
    }

    public int updateUser(SysUser user) {
        return userMapper.updateUser(user);
    }

    public int deleteUserByIds(Long[] userIds) {
        for (Long userId : userIds) {
            checkUserAllowed(new SysUser(userId));
        }
        return userMapper.deleteUserByIds(userIds);
    }

    public int deleteUser(Long userId) {
        return userMapper.deleteUserById(userId);
    }

    /**
     * @param user
     * @return
     * @Description 修改用户状态
     **/
    public int updateUserStatus(SysUser user) {
        return userMapper.updateUser(user);
    }


    /**
     * @param user
     * @return
     * @Description 重置密码
     **/
    public int resetPwd(SysUser user) {
        return userMapper.updateUser(user);
    }


    /**
     * @param user
     * @return
     * @Description 校验用户是否允许操作
     **/
    public void checkUserAllowed(SysUser user) {
        if (StringUtils.isNotNull(user.getUserId()) && user.isAdmin()) {
            throw new CustomException("不允许操作超级管理员用户");
        }
    }

    /**
     * 校验用户手机号是否唯一
     *
     * @param user 用户信息
     * @return
     */
    public String checkPhoneUnique(SysUser user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkPhoneUnique(user.getPhonenumber());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验email是否唯一
     *
     * @param user 用户信息
     * @return
     */
    public String checkEmailUnique(SysUser user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUser info = userMapper.checkEmailUnique(user.getEmail());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(SysUser user) {
        Long[] roles = user.getRoleIds();
        if (StringUtils.isNotNull(roles)) {
            // 新增用户与角色管理
            List<SysUserRole> list = new ArrayList<SysUserRole>();
            for (Long roleId : roles) {
                SysUserRole ur = new SysUserRole();
                ur.setUserId(user.getUserId());
                ur.setRoleId(roleId);
                list.add(ur);
            }
            if (list.size() > 0) {
                userRoleMapper.batchUserRole(list);
            }
        }
    }

    public RankSetting queryUserSetting(){
        Long userId = securityAuditorAware.getCurrentAuditor().orElseThrow();
        RankSetting rankSetting = rankSettingMapper.selectRankSetting(userId);
        return rankSetting;
    }


}


































