package com.nyanner.govii.elementary.entity.knowledge;

import lombok.Data;

@Data
/*
知识标签关联表
 */
public class KnowledgeTag {
    private Long Id;
    private Long knowledgeId;
    private Long tagId;
}
