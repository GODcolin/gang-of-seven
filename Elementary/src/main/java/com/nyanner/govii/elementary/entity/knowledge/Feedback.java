package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nyanner.govii.elementary.model.bean.KnowledgeIdAndTitle;
import com.nyanner.govii.elementary.model.bean.User;
import lombok.Data;

import java.util.Date;

@Data
public class Feedback {
    private Long id;

    private Long knowledgeId;
    private KnowledgeIdAndTitle knowledge;

    private Long userId;    //反馈用户id
    private User user;      //反馈者

    private String type;    //反馈类型
    private String content; //反馈内容
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date feedbackTime;  //反馈时间
    private String status;      //状态

    private Long handlerId;       //处理者id
    private User handler;           //处理者

    private String reason;          //驳回理由
    private Integer flag;

}


















