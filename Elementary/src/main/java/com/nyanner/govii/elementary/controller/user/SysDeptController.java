package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.service.user.SysDeptService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/sysDept")
@AllArgsConstructor
public class SysDeptController {
    private SysDeptService sysDeptService;

    @GetMapping("/findAllSysDept")
    public RestResponse findAllSysDept() {
        log.info("开始查询Source...");
        return RestResponse.ok(sysDeptService.findAll());
    }
}
