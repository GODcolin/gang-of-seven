package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Feedback;
import com.nyanner.govii.elementary.mapper.FeedbackMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class FeedbakTest {
    @Autowired
    FeedbackMapper feedbackMapper;

    @Test
    public void addFeedbackTest() {
        Feedback feedback = new Feedback();
        feedback.setUserId(4L);
        feedback.setContent("啊哈大会");
        feedback.setKnowledgeId(34L);
        feedback.setType("存在错字");

        int i = feedbackMapper.addFeedback(feedback);
        log.info("测试添加反馈记录:{}", i);
    }

    @Test
    public void selectProcessingFeedbackTest() {
        List<Feedback> feedbacks = feedbackMapper.selectProcessingFeedback();

        feedbacks.forEach(e -> log.info("测试查询待处理的反馈:{}", e));
    }

    @Test
    public void updateFeedbackWhenProcessTest() {
        Feedback feedback = new Feedback();
        feedback.setId(1L);
        feedback.setHandlerId(3L);
        feedback.setStatus("2");
        feedback.setReason("驳回");

        feedbackMapper.updateFeedbackWhenProcess(feedback);
    }

    @Test
    public void selectFeedbackByUserIdTest() {
        List<Feedback> feedbacks = feedbackMapper.selectFeedbackByUserId(1L);
        feedbacks.forEach(e -> log.info("测试根据用户{}", e));
    }


}











