package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.mapper.SysUserMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class UserTest {
    @Autowired
    SysUserMapper userMapper;

    @Test
    void checkUserNameUniqueTset() {
        int i = userMapper.checkUserNameUnique("ashdj");
        log.info("ashdj用户名不存在数据库中 : {}", i);
    }

    @Test
    void selectUserByIdTest() {
        SysUser sysUser = userMapper.selectUserById(1L);
        log.info("用户id为1的用户信息:{}", sysUser);
    }

    @Test
    void selectUserListTest(){
        List<SysUser> sysUsers = userMapper.selectUserList(new SysUser());

        sysUsers.forEach(e->log.info("用户信息:{}",e));
    }
}
