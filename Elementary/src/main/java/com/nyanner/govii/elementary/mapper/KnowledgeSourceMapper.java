package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeSource;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeSourceMapper {

    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id删除知识渠道关联信息
     **/
    int deleteKnowledgeSourceByKnowledgeId(Long knowledgeId);

    int batchKnowledgeSource(List<KnowledgeSource> knowledgeSourceList);


}
