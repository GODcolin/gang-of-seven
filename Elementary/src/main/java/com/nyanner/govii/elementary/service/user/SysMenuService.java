package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.user.SysMenu;
import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.common.UserConstants;
import com.nyanner.govii.elementary.mapper.SysMenuMapper;
import com.nyanner.govii.elementary.mapper.SysRoleMenuMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import com.nyanner.govii.elementary.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SysMenuService {
    @Autowired
    SysRoleMenuMapper roleMenuMapper;
    @Autowired
    private SysMenuMapper menuMapper;

    public List<SysMenu> selectMenuList(SysMenu menu, Long userId) {
        List<SysMenu> menuList;
        //管理员显示所有菜单信息
        if (SysUser.isAdmin(userId)) {
            menuList = menuMapper.selectMenuList(menu);
        } else {
            menuList = menuMapper.selectMenuListByUserId(menu);
        }
        return menuList;
//        return PageUtil.query(menu.getLimit(), menu.getPage(), () -> menuList);
    }

    /**
     * @param menuId
     * @return
     * @Description 根据菜单ID查询信息
     **/
    public SysMenu selectMenuById(Long menuId) {
        return menuMapper.selectMenuById(menuId);
    }


    /**
     * @param menus 菜单列表
     * @return 树结构列表
     * @Description 构建前端所需要树结构
     **/
    public List<SysMenu> bulidMenuTree(List<SysMenu> menus) {

        List<SysMenu> returnList = new ArrayList<>();
        List<Long> tempList = new ArrayList<>();

        for (SysMenu dept : menus) {
            tempList.add(dept.getMenuId());
        }
        for (Iterator<SysMenu> iterator = menus.iterator(); iterator.hasNext(); ) {
            SysMenu menu = (SysMenu) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(menu.getParentId())) {
                recursionFn(menus, menu);
                returnList.add(menu);
            }
        }
        if (returnList.isEmpty()) {
            returnList = menus;
        }
        return returnList;

    }


    /**
     * 校验菜单名称是否唯一
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public String checkMenuNameUnique(SysMenu menu) {
        Long menuId = StringUtils.isNull(menu.getMenuId()) ? -1L : menu.getMenuId();
        SysMenu info = menuMapper.checkMenuNameUnique(menu.getMenuName(), menu.getParentId());
        if (StringUtils.isNotNull(info) && info.getMenuId().longValue() != menuId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private void recursionFn(List<SysMenu> list, SysMenu t) {
        // 得到子节点列表
        List<SysMenu> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenu tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }


    /**
     * 得到子节点列表
     */
    private List<SysMenu> getChildList(List<SysMenu> list, SysMenu t) {
        List<SysMenu> tlist = new ArrayList<SysMenu>();
        Iterator<SysMenu> it = list.iterator();
        while (it.hasNext()) {
            SysMenu n = (SysMenu) it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenu> list, SysMenu t) {
        return getChildList(list, t).size() > 0 ? true : false;
    }


    /**
     * 新增保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public int insertMenu(SysMenu menu) {
        return menuMapper.insertMenu(menu);
    }


    /**
     * 修改保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public int updateMenu(SysMenu menu) {
        return menuMapper.updateMenu(menu);
    }

    /**
     * 删除菜单管理信息
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public int deleteMenuById(Long menuId) {
        return menuMapper.deleteMenuById(menuId);
    }


    /**
     * 查询菜单使用数量
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public boolean checkMenuExistRole(Long menuId) {
        int result = roleMenuMapper.checkMenuExistRole(menuId);
        return result > 0 ? true : false;
    }

    /**
     * 是否存在菜单子节点
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public boolean hasChildByMenuId(Long menuId) {
        int result = menuMapper.hasChildByMenuId(menuId);
        return result > 0 ? true : false;
    }


    /**
     * @Description     根据用户id添加权限参数
     * @param userId
     * @return
     **/
    public Set<String> selectMenuPermsByUserId(Long userId){
        List<String> perms = menuMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (StringUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }
}



















