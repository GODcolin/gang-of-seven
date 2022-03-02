package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Knowledge;
import com.nyanner.govii.elementary.model.bean.*;
import com.nyanner.govii.elementary.model.bean.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KnowledgeMapper {

    /**
     * @param limit
     * @return
     * @Description 根据浏览量查询最热的知识
     **/
    List<KnowledgeIdAndTitle> selectHotKnowledge(Integer limit, Integer days);

    /**
     * @param limit limit为显示条数
     * @return
     * @Description 按点赞量排序知识
     **/
    List<KnowledgeIdAndTitle> selectKnowledgeByLikes(Integer limit, Integer days);

    /**
     * @param limit
     * @return
     * @Description 按知识收藏排序知识
     **/

    List<KnowledgeIdAndTitle> selectKnowledgeByCollect(Integer limit, Integer days);


    /**
     * @param limit
     * @return
     * @Description 查询最新知识
     **/
    List<KnowledgeIdAndTitleAndTime> selectNewKnowledge(Integer limit);

    /**
     * @param msg
     * @return 返回知识的基本信息
     * @Description 实现知识标题、内容的模糊搜索
     **/
    List<SearchKnowledge> searchKnowledgeInfo(String msg);

    /**
     * @param knowledge
     * @return
     * @Description 新增知识
     **/
    int addKnowledge(Knowledge knowledge);


    /**
     * @param
     * @return
     * @Description 根据用户id查询知识信息
     **/
    List<IndividualKnowledge> selectKnowledgeByUser(Long userId, String status);

    /**
     * @param
     * @return
     * @Description 审核员查询待审核的知识
     **/

    List<KnowledgeAudit> selectAuditingKnowledge();


    /**
     * @param masterId
     * @return
     * @Description 将系列id为masterId，最新版本的知识改为历史版本
     **/
    int updateKnowledgeVersion(Long masterId);

    /*
        根据知识id修改知识状态
     */
    int updateKnowledgeStatusById(Long knowledgeId, String status);

    /*
    根据知识id查询知识详细信息
     */
    Knowledge selectKnowledgeDetailsByKnowledgeId(Long knowledgeId);

    /*
    根据系列id查询对应知识的历史版本
     */
    List<SearchKnowledge> selectKnowledgeVersions(Long masterId);

    /**
     * @param categoryId
     * @return
     * @Description 根据类别查询知识id
     **/
    List<SearchKnowledge> selectKnowledgeByCategoryId(Long categoryId);


    /**
     * @param
     * @return
     * @Description 查询所有的知识
     **/

    List<Knowledge> findAll();


    /**
     * @param knowledgeId
     * @return
     * @Description 下线知识
     **/
    int offlineKnowledge(Long knowledgeId);


    /**
     * @param knowledgeParams
     * @return
     * @Description 高级搜索
     **/
    List<SearchKnowledge> advancedSearchKnowledge(KnowledgeParams knowledgeParams);


    /**
     * @param title 可为null
     * @return
     * @Description 查询个人审核通过的知识
     **/
    List<KnowledgeAudit> selectAuditedKnowledge(Long userId, String title);

    /**
     * @param
     * @return
     * @Description 随机推荐limit条知识
     **/
    List<SearchKnowledge> selectRandomKnowledge(int limit);


    /**
     * @param knowledgeId
     * @return
     * @Description 根据知识id查询标题和内容，
     **/
    KnowledgeIdAndTitleAndContent shareKnowledgeById(Long knowledgeId);

    /*
    根据知识id查询内容和知识
     */
    KnowledgeIdAndTitleAndContent selectKnowledgeTitleAndContentById(Long knowledgeId);

    /**
     * @param
     * @return
     * @Description 查询管理信息
     **/
    List<KnowledgeManageInfo> selectKnowledgeManageInfo(KnowledgeManageInfo knowledgeManageInfo);

    /**
     * @param knowledge
     * @return
     * @Description 更新知识
     **/
    int updateKnowledge(Knowledge knowledge);


    /**
     * @Description     根据类别id随机推荐知识
     * @param categoryId
     * @return
     **/
    SearchKnowledge selectRandomKnowledgeByCategoryId(Long categoryId);


}




