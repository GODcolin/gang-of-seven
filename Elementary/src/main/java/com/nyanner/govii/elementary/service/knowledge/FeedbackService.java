package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Feedback;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.FeedbackMapper;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import static com.nyanner.govii.elementary.common.FeedbackStatusCode.*;

@Service
@AllArgsConstructor
public class FeedbackService {
    private FeedbackMapper feedbackMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<Feedback> selectFeedbackByUserId(Integer limit, Integer page) {
        return PageUtil.query(page, limit,
            () -> feedbackMapper.selectFeedbackByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow()));
    }

    public PageMode<Feedback> selectProcessingFeedback(Integer limit, Integer page) {
        return PageUtil.query(page, limit,
            () -> feedbackMapper.selectProcessingFeedback());
    }

    public void addFeedback(Feedback feedback) {
        feedback.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        feedback.setStatus(PROCESSING_FEEDBACK);
        feedbackMapper.addFeedback(feedback);
    }

    public void updateFeedbackWhenProcess(Feedback feedback) {
        if (feedback.getFlag() == 1) {
            feedback.setStatus(PASS_FEEDBACK);
        } else if (feedback.getFlag() == 0) {
            feedback.setStatus(FAIL_FEEDBACK);
        }
        feedback.setHandlerId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        feedbackMapper.updateFeedbackWhenProcess(feedback);
    }
}
