package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.entity.knowledge.Feedback;
import com.nyanner.govii.elementary.service.knowledge.FeedbackService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/feedback")
@AllArgsConstructor
public class FeedbackController {

    private FeedbackService feedbackService;

    //查找用户反馈
    @GetMapping("/findUserFeedback")
    public RestResponse selectByUser(@RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                     @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return RestResponse.ok(feedbackService.selectFeedbackByUserId(limit, page));
    }

    @GetMapping("/selectProcessingFeedback")
    public RestResponse selectProcessingFeedback(
        @RequestParam(value = "limit", defaultValue = "10") Integer limit,
        @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return RestResponse.ok(feedbackService.selectProcessingFeedback(limit, page));
    }

    @Log(title = "反馈", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public RestResponse addFeedback(@RequestBody Feedback feedback) {
        feedbackService.addFeedback(feedback);
        return RestResponse.ok();
    }

    @Log(title = "反馈", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    public RestResponse updateFeedbackWhenProcess(@RequestBody Feedback feedback) {
        feedbackService.updateFeedbackWhenProcess(feedback);
        return RestResponse.ok();
    }
}
