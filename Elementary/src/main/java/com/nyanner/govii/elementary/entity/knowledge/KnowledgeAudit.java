package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeAudit {
    private Long id;
    private Long knowledgeId;       //知识id
    private Long reviewerId;        //审核人id
    private String rejectReason;    //拒绝原因
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date processTime;   //处理时间
}
