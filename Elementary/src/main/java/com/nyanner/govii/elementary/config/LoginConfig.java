package com.nyanner.govii.elementary.config;

import lombok.Data;
import org.springframework.context.annotation.Configuration;

@Configuration
/*
3分钟内连续错5次，会锁10分钟
 */
@Data
public class LoginConfig {

    /**
     * 在多长时间内监控, 如希望在 60s 内尝试
     * 次数限制为5次, 那么 watch=60; unit: s
     */
    private Long watch = 180L;

    /**
     * 锁定时长, unit: s
     */
    private Long lock = 300L;

    /**
     * 错误的尝试次数
     */
    private int times = 3;
}
