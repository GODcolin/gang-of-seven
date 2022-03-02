package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.model.bean.DepartIdAndName;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeDepartMapper {

    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id
     **/
    int deleteKnowledgeDepartByKnowledgeId(Long knowledgeId);


    int batchKnowledgeDepart(Long knowledgeId, List<DepartIdAndName> depts);
}
