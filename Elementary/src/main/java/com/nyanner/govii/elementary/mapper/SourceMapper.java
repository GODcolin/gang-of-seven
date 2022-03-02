package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Source;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SourceMapper {

    /**
     * @param
     * @return
     * @Description 查询所有来源信息
     **/
    List<Source> selectAll();

    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id查询来源信息
     **/
    List<Source> selectByKnowledgeId(Long knowledgeId);

    /**
     * @param sourceids   知识来源ids
     * @param knowledgeId
     * @return
     * @Description 添加知识区域关联信息
     **/
    int addKnowledgeSource(List<Integer> sourceids, Long knowledgeId);

}
