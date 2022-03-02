package com.nyanner.govii.elementary.controller.user;


import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.common.UserConstants;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.user.SysMenu;
import com.nyanner.govii.elementary.service.user.SysMenuService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/system/menu")
@AllArgsConstructor
public class SysMenuController {

    private final SysMenuService menuService;

    private final SecurityAuditorAware securityAuditorAware;

    @GetMapping("/list")
    public RestResponse list(SysMenu menu) {
        Long userId = securityAuditorAware.getCurrentAuditor()
            .orElseThrow(() -> new AccessDeniedException("403 Forbidden"));
        return RestResponse.ok(menuService.selectMenuList(menu, userId));
    }

    /**
     * @param menuId
     * @return
     * @Description 根据菜单ID查询信息
     **/
    @GetMapping(value = "/{menuId}")
    public RestResponse getInfo(@PathVariable Long menuId) {

        return RestResponse.ok(menuService.selectMenuById(menuId));
    }

    /**
     * @Description 获取菜单下拉树列表
     * @param menu
     * @return
     **/
    @GetMapping("/treeselect")
    public RestResponse treeSelect(SysMenu menu){
        Long userId = securityAuditorAware.getCurrentAuditor()
                .orElseThrow(() -> new AccessDeniedException("403 Forbidden"));
        List<SysMenu> menus = menuService.selectMenuList(menu, userId);
        return RestResponse.ok(menuService.bulidMenuTree(menus));
    }

    /**
     * @param menu
     * @return
     * @Description 添加菜单
     **/
    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public RestResponse add(@Validated @RequestBody SysMenu menu) {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return RestResponse.fail("新增菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        }

        menu.setCreateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return menuService.insertMenu(menu) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /*
        修改菜单
     */

    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public RestResponse edit(@Validated @RequestBody SysMenu menu) {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return RestResponse.fail("修改菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        } else if (menu.getMenuId().equals(menu.getParentId())) {
            return RestResponse.fail("修改菜单'" + menu.getMenuName() + "'失败，上级菜单不能选择自己");
        }
        menu.setUpdateBy(securityAuditorAware.getCurrentAuditorName().orElseThrow());
        return menuService.updateMenu(menu) > 0 ? RestResponse.ok() : RestResponse.fail();
    }

    /**
     * 删除菜单
     */
    @Log(title = "菜单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{menuId}")
    public RestResponse remove(@PathVariable("menuId") Long menuId) {
        if (menuService.hasChildByMenuId(menuId)) {
            return RestResponse.fail("存在子菜单,不允许删除");
        }
        if (menuService.checkMenuExistRole(menuId)) {
            return RestResponse.fail("菜单已分配,不允许删除");
        }
        return menuService.deleteMenuById(menuId) > 0 ? RestResponse.ok() : RestResponse.fail();
    }
}












