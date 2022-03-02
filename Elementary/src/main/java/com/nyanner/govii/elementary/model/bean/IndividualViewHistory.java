package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class IndividualViewHistory {
    private Long knowledgeId;

    private String knowledgeTitle;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date viewTime;  //浏览时间
}
