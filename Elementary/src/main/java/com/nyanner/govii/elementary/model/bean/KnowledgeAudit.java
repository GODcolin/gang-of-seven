package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.nyanner.govii.elementary.entity.knowledge.Category;
import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeAudit {
    private Long id;       //知识id
    private String author;       //作者
    private String title;        //知识标题
    @JsonProperty("classification")
    private Category category;     //知识分类
    @JsonProperty("time")
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;   //知识创建时间


}
