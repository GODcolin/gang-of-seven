package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Comment {
    private Long id;

    private String content;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;

    private Long knowledgeId;

    private Long userId;

    private Long parentId;

    private String nickName;

    private String avatar;  //头像

    private List<Comment> childrenComments;

}
