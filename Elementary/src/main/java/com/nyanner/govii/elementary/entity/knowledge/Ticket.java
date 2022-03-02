package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nyanner.govii.elementary.model.bean.User;
import lombok.Data;

import java.util.Date;

@Data
public class Ticket {
    private Long id;

    private String title;

    private String content;

    private User creator;
    private Long creatorId;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;    //创建时间

    private String status;

    private User auditor;   //审核员
    private Long auditorId;
    private Date auditTime;

    private String reason;

    private User receiver;  //接单者

    private Long receiverId;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date receiveTime;//接单时间

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date finishTime;//完成时间

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date closeTime;//关闭时间

    private Integer flag;   //前端传递的审核结果标志 0失败，1成功

    private String notFinishReason; //审核工单完成度不通过的原因

    private Long knowledgeId;   //知识id

}












