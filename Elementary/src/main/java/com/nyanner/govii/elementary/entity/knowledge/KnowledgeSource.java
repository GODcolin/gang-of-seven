package com.nyanner.govii.elementary.entity.knowledge;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
//知识渠道关联实体
public class KnowledgeSource {
    private Integer id;
    private Long knowledgeId;
    private Integer sourceId;
}
