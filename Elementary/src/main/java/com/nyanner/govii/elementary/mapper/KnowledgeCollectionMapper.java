package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeCollection;
import com.nyanner.govii.elementary.model.bean.IndividualCollection;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeCollectionMapper {

    /**
     * @param userId
     * @return
     * @Description 根据用户id查询收藏信息
     **/
    List<IndividualCollection> selectByUserId(Long userId);

    /**
     * @param knowledgeCollection
     * @return
     * @Description 添加一条知识收藏记录
     **/
    int addKnowledgeCollection(KnowledgeCollection knowledgeCollection);

    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id查询对应的收藏数量
     **/
    int findCollectionCountsByKnowledgeId(Long knowledgeId);


    /**
     * @param userId
     * @param knowledgeId
     * @return
     * @Description 查询用户是否收藏知识
     **/
    int checkUserKnowledgeCollect(Long userId, Long knowledgeId);

    /**
     * @param userId
     * @param knowledgeId
     * @return
     * @Description 用户取消收藏
     **/
    int userCancelKnowledgeCollect(Long userId, Long knowledgeId);


}
