package com.nyanner.govii.elementary.testService;

import com.nyanner.govii.elementary.entity.user.SysMenu;
import com.nyanner.govii.elementary.service.user.SysMenuService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class MenuServiceTest {

    @Autowired
    SysMenuService menuService;


    @Test
    public void selectMenuByIdTest() {
        SysMenu sysMenu = menuService.selectMenuById(100L);
        log.info("打印菜单id为100的详细信息:{}", sysMenu);
    }


//    @Test
//    public void treeSelectTest(){
//        SysMenu menu = new SysMenu();
//
//        List<SysMenu> menuList = menuService.selectMenuList(menu, 1L);
//        menuList.forEach(e -> log.info("打印菜单信息{}",e));
//    }
}
