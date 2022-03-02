package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class IndividualComment {
    private String knowledgeTitle;
    private Long knowledgeId;

    private String commentContent;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date commentTime;//评论时间
}
