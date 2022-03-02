package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class IndividualKnowledgeLikes {
    private Long knowledgeId;
    private String knowledgeTitle;
    private String knowledgeAuthor;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date likesTime; //点赞时间

}
