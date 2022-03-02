package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeVersion;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeVersionMapper {

    /**
     * @param newVersionId
     * @return
     * @Description 根据最新版本id查询版本信息
     **/
    List<KnowledgeVersion> findByNewVersionId(Long newVersionId);

    /**
     * @param id
     * @return
     * @Description 根据版本id查询版本信息
     **/
    KnowledgeVersion findById(Long id);

    KnowledgeVersion findByKnowledgeId(Long knowledgeId);

}
