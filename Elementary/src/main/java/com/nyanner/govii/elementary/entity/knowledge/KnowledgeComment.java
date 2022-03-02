package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeComment {
    private long id;   //评论id

    private long knowledgeId;   //知识id

    private long authorId;   //知识id

    private String title;   //公告标题

    private String content;   //评论内容

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;     //评论创建时间

    private long parentId;   //父id

    private String level;   //
}
