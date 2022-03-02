package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Feedback;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FeedbackMapper {

    /**
     * @param feedback
     * @return
     * @Description 添加一条反馈内容
     * 要求必须有反馈者id,反馈内容、知识id,反馈类型
     **/
    int addFeedback(Feedback feedback);

    /**
     * @param
     * @return
     * @Description 查询待处理的反馈
     **/
    List<Feedback> selectProcessingFeedback();

    /**
     * @param feedback
     * @return
     * @Description 更新反馈
     * 要求必须传入status(状态)，handlerId(处理人id),
     * reason(驳回理由可不填)
     **/
    int updateFeedbackWhenProcess(Feedback feedback);


    /**
     * @param
     * @return
     * @Description 查询反馈历史
     **/
    List<Feedback> selectFeedbackByUserId(Long userId);

}











