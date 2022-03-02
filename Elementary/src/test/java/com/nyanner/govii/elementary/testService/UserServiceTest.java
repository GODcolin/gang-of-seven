package com.nyanner.govii.elementary.testService;

import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.service.user.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class UserServiceTest {
    @Autowired
    UserService userService;

    @Test
    public void selectUserListTest() {
        List<SysUser> sysUsers = userService.selectUserList(new SysUser());
        sysUsers.forEach(e -> log.info("打印用户信息:{}", e));

    }

    @Test
    public void updateUserStatusTest() {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(10L);
        sysUser.setStatus("1");
        int i = userService.updateUserStatus(sysUser);
        log.info("修改用户状态测试{}", i);
    }

    @Test
    public void deleteUserByIdsTest() {
        Long[] ids = new Long[2];
        ids[0] = 103L;
        ids[1] = 104L;

        int i = userService.deleteUserByIds(ids);
        log.info("测试用户删除{}", i);

    }


}


/*

//获取登录账号
securityAuditorAware.getCurrentAuditorName().orElseThrow()


//获取用户id
securityAuditorAware.getCurrentAuditor()
                .orElseThrow(() -> new AccessDeniedException("403 Forbidden"))

    private final PasswordEncoder passwordEncoder;

 */








