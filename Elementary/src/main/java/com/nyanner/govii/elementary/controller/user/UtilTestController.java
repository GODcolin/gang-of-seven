package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.utils.ServletUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
@Slf4j
public class UtilTestController {

    @GetMapping("/ServletUtils")
    public void test(String name) {
        log.info("查看请求包内容{}", ServletUtils.getRequest());
    }
}
