package com.nyanner.govii.elementary.functionTest;

import com.nyanner.govii.elementary.service.user.UserService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.Map;

@SpringBootTest
@Slf4j
public class verificationCodeTest {

    @Autowired
    UserService userService;

    @Test
    public void sentCodeTest() {
        RestResponse restResponse = userService.sentCode("xyz");
        log.info("忘记密码，发送验证码{}", restResponse);
    }

    @Test
    public void resetPasswordTest() {
        Map<String, Object> map = new HashMap<>();
        map.put("username", "xyz");
        map.put("verificationCode", "LKGR6w");
        map.put("newPassword", "123456");

        RestResponse restResponse = userService.resetPassword(map);
        log.info("重置密码测试{}", restResponse);
    }
}
