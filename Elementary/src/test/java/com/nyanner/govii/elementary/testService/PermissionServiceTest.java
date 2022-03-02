package com.nyanner.govii.elementary.testService;

import com.nyanner.govii.elementary.service.user.SysPermissionService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Set;

@SpringBootTest
@Slf4j
public class PermissionServiceTest {
    @Autowired
    SysPermissionService sysPermissionService;

    @Test
    public void getPermission(){
        Set<String> menuPermission =
                sysPermissionService.getMenuPermission(8L);

        menuPermission.forEach(e -> log.info("查询3L用户权限{}",e));
    }

}
