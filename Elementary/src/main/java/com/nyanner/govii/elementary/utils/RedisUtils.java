package com.nyanner.govii.elementary.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
@Slf4j
public record RedisUtils(StringRedisTemplate stringRedisTemplate) {
    public void set(String key, String value) {
        stringRedisTemplate.opsForValue().set(key, value);
    }

    public String get(String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    public Boolean expire(String key, final Long timeout, final TimeUnit unit) {
        return stringRedisTemplate.expire(key, timeout, unit);
    }

    public Boolean hasKey(String key) {
        return stringRedisTemplate.hasKey(key);
    }

    public Boolean delete(String key) {
        return stringRedisTemplate.delete(key);
    }
}
