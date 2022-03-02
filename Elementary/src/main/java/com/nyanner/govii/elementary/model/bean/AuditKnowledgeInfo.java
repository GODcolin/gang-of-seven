package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.entity.knowledge.Source;
import com.nyanner.govii.elementary.entity.knowledge.Tag;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class AuditKnowledgeInfo {
    private String title;
    private String author;
    private List<Tag> keywords;
    private Category category;
    private Source source;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date lifeTime;
    private String content;

}
