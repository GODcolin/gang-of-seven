package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class IndividualKnowledge {
    private Long knowledgeId;
    private String title;
    private String categoryName;
    private String status;
    private Integer viewCounts;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;
}
