package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.common.UserConstants;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.service.user.UserService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

@RestController
@RequestMapping("/api/user")
@AllArgsConstructor
public class UserController {
    private final UserService userService;
    private final SecurityAuditorAware securityAuditorAware;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/list")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public RestResponse getUsers(SysUser sysUser) {
        return RestResponse.ok(userService.getUsers(sysUser));
    }


    @GetMapping("/getUser")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public SysUser getUser() {
        return userService.getUserById(securityAuditorAware.getCurrentAuditor().orElseThrow());
    }


    /**
     * 新增用户
     */
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/addUser")
    public RestResponse add(@Validated @RequestBody SysUser user) {
        if (userService.existsByUsername(user.getUserName())) {
            return RestResponse.fail().msg("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return RestResponse.fail().msg("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return RestResponse.fail().msg("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setCreateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userService.insertUser(user) > 0 ? RestResponse.ok() : RestResponse.fail();
    }


    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    public RestResponse edit(@Validated @RequestBody SysUser user) {
        user.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        user.setUserName(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        user.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        userService.checkUserAllowed(user);
        if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return RestResponse.fail().msg("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        return userService.updateUser(user) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param userIds
     * @return
     * @Description 删除用户
     **/
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public RestResponse remove(@PathVariable Long[] userIds) {
        return userService.deleteUserByIds(userIds) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/delete")
    public RestResponse remove(@NotNull Long userId) {
        return userService.deleteUser(userId) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param user
     * @return
     * @Description 重置密码 userId,password
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public RestResponse resetPwd(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return userService.resetPwd(user) > 0 ? RestResponse.ok() : RestResponse.fail();
    }


    /**
     * @param user
     * @return
     * @Description 修改用户状态
     * 要求传入userId,status("0"正常、"1"停用)
     **/
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public RestResponse changeStatus(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);

        user.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return userService.updateUserStatus(user) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    @GetMapping("/randomSetting")
    public RestResponse queryUserRankSetting(){
        return RestResponse.ok(userService.queryUserSetting());

    }

}
















