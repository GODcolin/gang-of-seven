package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class IndividualCollection {
    private Long knowledgeId;

    private String knowledgeTitle;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date collectTime;  //收藏时间
}












