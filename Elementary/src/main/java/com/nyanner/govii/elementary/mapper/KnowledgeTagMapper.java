package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeTagMapper {

    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id删除知识标签关联记录
     **/
    int deleteByKnowledgeId(Long knowledgeId);

    /**
     * @param
     * @return
     * @Description 批量新增知识标签信息
     **/
    int batchKnowledgeTag(Long knowledgeId, List<Tag> tags);
}










