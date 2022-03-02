package com.nyanner.govii.elementary.functionTest;

import com.nyanner.govii.elementary.utils.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.ZonedDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@Slf4j
public class RedisTest {
    @Autowired
    private RedisUtils redisUtils;

    @Test
    public void test() {
        String msg = "Hello, Redis! Time is %s".formatted(ZonedDateTime.now());
        redisUtils.set("hello", msg);
        assertEquals(msg, redisUtils.get("hello"));
    }
}
