package com.nyanner.govii.elementary.controller.user;


import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.common.UserConstants;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.user.SysRole;
import com.nyanner.govii.elementary.service.user.SysRoleService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

@RestController
@RequestMapping("/api/system/role")
@AllArgsConstructor
public class SysRoleController {

    private final SysRoleService roleService;

    private final SecurityAuditorAware securityAuditorAware;

    @GetMapping("/list")
    public RestResponse list(SysRole role) {
        return RestResponse.ok(roleService.selectRoleList(role));
    }

    @GetMapping(value = "/{roleId}")
    public RestResponse getInfo(@PathVariable Long roleId) {
        return RestResponse.ok(roleService.selectRoleById(roleId));
    }

    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PostMapping
    public RestResponse add(@Validated @RequestBody SysRole role) {

        if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleNameUnique(role))) {
            return RestResponse.fail().msg("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(roleService.checkRoleKeyUnique(role))) {
            return RestResponse.fail().msg("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setCreateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return roleService.insertRole(role) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param role
     * @return
     * @Description 修改角色
     **/
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public RestResponse changeStatus(@RequestBody SysRole role) {
        roleService.checkRoleAllowed(role);
        role.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return roleService.updateRoleStatus(role) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param role
     * @return
     * @Description 修改角色
     **/
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public RestResponse udpate(@RequestBody SysRole role) {
        roleService.checkRoleAllowed(role);
        role.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return roleService.updateRole(role) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param roleIds
     * @return
     * @Description 删除角色
     **/
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    public RestResponse remove(@PathVariable Long[] roleIds) {
        return roleService.deleteRoleByIds(roleIds) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * @param roleId
     * @return
     * @Description 删除角色
     **/
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/delete")
    public RestResponse remove(@NotNull Long roleId) {
        return roleService.deleteRoleById(roleId) > 0 ? RestResponse.ok() : RestResponse.fail();
    }


    /**
     * 获取角色选择框列表
     */
    @GetMapping("/optionselect")
    public RestResponse optionselect() {
        return RestResponse.ok(roleService.selectRoleAll());
    }

}

























