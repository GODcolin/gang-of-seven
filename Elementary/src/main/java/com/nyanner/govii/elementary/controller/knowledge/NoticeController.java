package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.service.knowledge.NoticeService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/notice")
@AllArgsConstructor
public class NoticeController {
    private NoticeService noticeService;

    @GetMapping("/findAllNotice")
    public RestResponse findAllNotice() {
        log.info("开始查询所有公告...");
        return RestResponse.ok(noticeService.findAllNotice());
    }
}
