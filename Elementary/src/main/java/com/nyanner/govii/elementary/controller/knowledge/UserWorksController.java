package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.service.knowledge.UserWorksService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import static com.nyanner.govii.elementary.common.KnowledgeStatusCode.*;

@RestController
@Slf4j
@RequestMapping("/api/userWorks")
@AllArgsConstructor
public class UserWorksController {
    //我的发布板块
    private UserWorksService userWorksService;

    @GetMapping("/findAllWorksById")
    public RestResponse findAllWorksById(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                         @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userWorksService.findAllWorksById(page, limit));
    }

    @GetMapping("/findDraftByUserId")
    public RestResponse findUserWorksByUserId(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                              @RequestParam(value = "limit", defaultValue = "10") Integer limit
    ) {
        return RestResponse.ok(userWorksService.findUserWorks(page, limit, DRAFT_WORKS));
    }

    @GetMapping("/findAuditingWorksByUserId")
    public RestResponse findAuditingWorksByUserId(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                  @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userWorksService.findUserWorks(page, limit, AUDITING_WORKS));
    }

    @GetMapping("/findPassWorksByUserId")
    public RestResponse findPassWorksByUserId(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                              @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userWorksService.findUserWorks(page, limit, PASS_WORKS));
    }

    @GetMapping("/findFailWorksByUserId")
    public RestResponse findFailWorksByUserId(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                              @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userWorksService.findUserWorks(page, limit, FAIL_WORKS));
    }

}
