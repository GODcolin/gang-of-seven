package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeAudit;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface KnowledgeAuditMapper {

    /**
     * @param reviewerId
     * @return
     * @Description 根据审核人的id 查询审核信息
     **/
    List<KnowledgeAudit> findByReviewerId(Long reviewerId);

    /**
     * @param id
     * @return
     * @Description 根据审核id查询知识id
     **/
    Long findKnowledgeIdById(Long id);

    /**
     * @param knowledgeAudit
     * @return
     * @Description 添加一条知识审核记录
     **/
    int addKnowledgeAudit(KnowledgeAudit knowledgeAudit);


    int updateKnowledgeAudit(Map<String, Object> map);
}

