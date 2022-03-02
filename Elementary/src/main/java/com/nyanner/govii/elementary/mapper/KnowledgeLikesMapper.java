package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeLikes;
import com.nyanner.govii.elementary.model.bean.IndividualKnowledgeLikes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeLikesMapper {
    /**
     * @param userId
     * @return
     * @Description 根据用户id查询点赞信息
     **/
    List<IndividualKnowledgeLikes> selectByUserId(Long userId);

    int addKnowledgeLikes(KnowledgeLikes knowledgeLikes);

    /**
     * @param userId
     * @param knowledgeId
     * @return
     * @Description 判断用户是否点赞知识
     **/
    int checkUserLikeKnowledge(Long userId, Long knowledgeId);


    /**
     * @param userId
     * @param knowledgeId
     * @return
     * @Description 用户取消知识点赞
     **/
    int userCancelKnowledgeLike(Long userId, Long knowledgeId);


}
