package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.service.knowledge.SourceService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/source")
@AllArgsConstructor
public class SourceController {

    private SourceService sourceService;

    @GetMapping("/findAllSource")
    public RestResponse findAllSource() {
        log.info("开始查询Source...");
        return RestResponse.ok(sourceService.findAll());
    }
}

