package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.service.knowledge.ViewHistoryService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/viewHistory")
@AllArgsConstructor
public class ViewHistoryController {

    private ViewHistoryService viewHistoryService;

    @GetMapping("/selectViewHistoryById")
    public RestResponse selectViewHistoryById(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                              @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(viewHistoryService.findViewHistoryByUserId(page, limit));
    }
}
