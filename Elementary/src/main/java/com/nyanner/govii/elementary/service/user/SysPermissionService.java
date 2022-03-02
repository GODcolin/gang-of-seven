package com.nyanner.govii.elementary.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class SysPermissionService {
    @Autowired
    SysMenuService menuService;

    @Autowired
    SysRoleService roleService;

    /**
     * @Description     根据用户id获取用户角色
     * @param userId
     * @return
     **/
    public Set<String> getRolePermission(Long userId){
        Set<String> roles =  new HashSet<>();

        if(userId != null && userId == 1L){
            roles.add("admin");
        }else{
            roles.addAll(roleService.selectRolePermissionByUserId(userId));
        }
        return roles;
    }

    public Set<String> getMenuPermission(Long userId){
        Set<String> perms = new HashSet<>();
        //管理员权限
        if(userId != null && userId == 1L){
            perms.add("*:*:*");
        }else{
            perms.addAll(menuService.selectMenuPermsByUserId(userId));
        }
        return perms;
    }

}


























