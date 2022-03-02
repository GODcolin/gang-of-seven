package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.Algorithm.RecommendAlgorithm;
import com.nyanner.govii.elementary.entity.knowledge.Knowledge;
import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import com.nyanner.govii.elementary.entity.knowledge.Widget;
import com.nyanner.govii.elementary.mapper.*;
import com.nyanner.govii.elementary.model.bean.*;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.*;
import com.nyanner.govii.elementary.model.bean.*;
import com.nyanner.govii.elementary.model.bean.KnowledgeAudit;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
@AllArgsConstructor
public class KnowledgeService {

    private KnowledgeMapper knowledgeMapper;
    private KnowledgeTagMapper knowledgeTagMapper;
    private KnowledgeDepartMapper knowledgeDepartMapper;
    private WidgetMapper widgetMapper;
    private SecurityAuditorAware securityAuditorAware;
    private CategoryMapper categoryMapper;
    private RankSettingMapper rankSettingMapper;

    public Knowledge findByKnowledgeId(Long id) {
        return knowledgeMapper.selectKnowledgeDetailsByKnowledgeId(id);
    }

    public List<KnowledgeIdAndTitle> findHotKnowledge(Integer limit) {
        RankSetting rankSetting = rankSettingMapper.selectRankSetting(
                securityAuditorAware.getCurrentAuditor().orElseThrow());
        if (rankSetting.getType().equals("1")){
            return knowledgeMapper.selectHotKnowledge(limit,rankSetting.getLimitTime());
        }
        else if (rankSetting.getType().equals("2")){
            return knowledgeMapper.selectKnowledgeByLikes(limit,rankSetting.getLimitTime());
        }
        else return knowledgeMapper.selectKnowledgeByCollect(limit,rankSetting.getLimitTime());
    }

    public List<KnowledgeIdAndTitleAndTime> selectNewKnowledge(Integer limit) {
        return knowledgeMapper.selectNewKnowledge(limit);
    }

    public PageMode<KnowledgeAudit> findAuditingKnowledge(Integer limit, Integer page) {
        return PageUtil.query(page, limit, () -> knowledgeMapper.selectAuditingKnowledge());
    }

    public List<SearchKnowledge> findHistoryKnowledge(Long masterId) {
        return knowledgeMapper.selectKnowledgeVersions(masterId);
    }

    public List<SearchKnowledge> selectRandomKnowledge() {
        int limit = 4;      //推荐的总知识条数
        int userLimit = 3;      //推荐的个性知识条数
        Long userId = securityAuditorAware.getCurrentAuditor().orElseThrow();
        List<SearchKnowledge> recommendKnowledgeList = new ArrayList<>();
        RecommendAlgorithm recommendAlgorithm = new RecommendAlgorithm();
        //如果用户未点赞收藏则随机推荐
        if (categoryMapper.findUserLikeCategory(userId).size() == 0 &&
                categoryMapper.findUserCollectionCategory(userId).size() == 0) {
            userLimit = 0;
        }
        //根据用户个性推荐
        int repeatNumber = 0;
        List<Long> knowledgeIdList = new ArrayList<>();
        for (int i = 0; i < userLimit; i++) {
            Long categoryId = recommendAlgorithm.recommend(categoryMapper.findUserLikeCategory(userId),
                    categoryMapper.findUserCollectionCategory(userId));
            //包含去重处理
            SearchKnowledge searchKnowledge = knowledgeMapper.selectRandomKnowledgeByCategoryId(categoryId);
            if (searchKnowledge == null){
                repeatNumber += 1;
                continue;
            }
            if ( !knowledgeIdList.contains( searchKnowledge.getId() ) ){
                knowledgeIdList.add(searchKnowledge.getId());
                recommendKnowledgeList.add(knowledgeMapper.selectRandomKnowledgeByCategoryId(categoryId));
            }else {
                repeatNumber += 1;
            }
        }
        //随机推荐的知识
        List<SearchKnowledge> tempList = knowledgeMapper.selectRandomKnowledge(limit - userLimit );
        for (int i = 0; i < tempList.size(); i++) {
            if ( !knowledgeIdList.contains(tempList.get(i).getId()) ){
                knowledgeIdList.add(tempList.get(i).getId());
                recommendKnowledgeList.add(tempList.get(i));
            }else {
                repeatNumber += 1;
            }
        }
        //去重的知识统一补充
        for (int i = 0; repeatNumber > 0 ; i++) {
            List<SearchKnowledge> leftTempList = knowledgeMapper.selectRandomKnowledge(repeatNumber);
            if ( !knowledgeIdList.contains(leftTempList.get(i).getId()) ){
                knowledgeIdList.add(leftTempList.get(i).getId());
                recommendKnowledgeList.add(leftTempList.get(i));
                repeatNumber -= 1;
            }
        }

        //按照点赞降序排列
        Collections.sort(recommendKnowledgeList, new Comparator<SearchKnowledge>() {
            @Override
            public int compare(SearchKnowledge o1, SearchKnowledge o2) {
                //降序
                return o2.getLikeCounts().compareTo(o1.getLikeCounts());
            }
        });
        return recommendKnowledgeList;
    }

    public Knowledge addKnowledge(Knowledge knowledge) {
        //新添加一个系列的知识（不同历史版本的知识为一个系列）
        if (knowledge.getMasterId() == null) {
            Widget widget = new Widget();   //系列
            widgetMapper.addWidget(widget);
            knowledge.setMasterId(widget.getId());
        } else {
            knowledgeMapper.updateKnowledgeVersion(knowledge.getMasterId());
        }
        knowledgeMapper.addKnowledge(knowledge);
        //将知识与部门、标签关联
        if(knowledge.getTags() != null && knowledge.getTags().size() != 0)
            knowledgeTagMapper.batchKnowledgeTag(knowledge.getId(),knowledge.getTags());
        if(knowledge.getDepts() != null && knowledge.getDepts().size() != 0)
            knowledgeDepartMapper.batchKnowledgeDepart(knowledge.getId(),knowledge.getDepts());
        return knowledge;
    }

    public void updateKnowledgeStatusById(Long id, String status) {
        knowledgeMapper.updateKnowledgeStatusById(id, status);
    }


    //实现知识的下线，逻辑删除
    public void delKnowledgeById(Long id) {
        knowledgeMapper.offlineKnowledge(id);
    }

    public PageMode<SearchKnowledge> selectKnowledgeByCategoryId(Long id, Integer page, Integer limit) {
        return PageUtil.query(page, limit, () -> knowledgeMapper.selectKnowledgeByCategoryId(id));
    }

    //查询用户审核通过的知识
    public PageMode<KnowledgeAudit> selectAuditedKnowledge(String title, Integer page, Integer limit) {
        return PageUtil.query(page, limit,
            () -> knowledgeMapper.selectAuditedKnowledge(securityAuditorAware.getCurrentAuditor().orElseThrow(), title));
    }

    public KnowledgeIdAndTitleAndContent shareKnowledgeById(Long id) {
        return knowledgeMapper.shareKnowledgeById(id);
    }

    public KnowledgeIdAndTitleAndContent selectKnowledgeTitleAndContentById(Long id){
        return knowledgeMapper.selectKnowledgeTitleAndContentById(id);
    }

    //后台知识管理界面
    public PageMode<KnowledgeManageInfo> selectKnowledgeManageInfo(KnowledgeManageInfo knowledgeManageInfo) {
        return PageUtil.query(knowledgeManageInfo.getPage(), knowledgeManageInfo.getLimit(),
            () -> knowledgeMapper.selectKnowledgeManageInfo(knowledgeManageInfo));
    }

    //更新知识
    public Knowledge updateKnowledge(Knowledge knowledge) {
        //先删除当前知识和部门、标签的关联
        knowledgeTagMapper.deleteByKnowledgeId(knowledge.getId());
        knowledgeDepartMapper.deleteKnowledgeDepartByKnowledgeId(knowledge.getId());

        //将修改后的知识与部门、标签关联
        if(knowledge.getTags() != null && knowledge.getTags().size() != 0)
            knowledgeTagMapper.batchKnowledgeTag(knowledge.getId(),knowledge.getTags());
        if(knowledge.getDepts() != null && knowledge.getDepts().size() != 0)
            knowledgeDepartMapper.batchKnowledgeDepart(knowledge.getId(),knowledge.getDepts());

        knowledgeMapper.updateKnowledge(knowledge);

        return knowledge;
    }

}




