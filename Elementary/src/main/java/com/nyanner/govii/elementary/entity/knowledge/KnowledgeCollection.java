package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
//知识收藏关联表
public class KnowledgeCollection {
    private Long id;
    private Long userId;
    private Long knowledgeId;
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date collectTime;   //收藏时间
}
