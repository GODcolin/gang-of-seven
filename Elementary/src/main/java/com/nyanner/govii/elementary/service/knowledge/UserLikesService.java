package com.nyanner.govii.elementary.service.knowledge;


import com.nyanner.govii.elementary.entity.knowledge.KnowledgeLikes;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.KnowledgeLikesMapper;
import com.nyanner.govii.elementary.model.bean.IndividualKnowledgeLikes;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserLikesService {
    private KnowledgeLikesMapper knowledgeLikesMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<IndividualKnowledgeLikes> findUserLikes(Integer page, Integer limit) {
        return PageUtil.query(page, limit,
            () -> knowledgeLikesMapper.selectByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow()));
    }

    public boolean checkUserLikeKnowledge(Long knowledgeId) {
        if (knowledgeLikesMapper.checkUserLikeKnowledge(
            securityAuditorAware.getCurrentAuditor().orElseThrow(), knowledgeId) == 1) {
            return true;
        } else return false;
    }


    public void addUserLike(KnowledgeLikes knowledgeLikes) {
        knowledgeLikes.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        if (knowledgeLikesMapper.checkUserLikeKnowledge(knowledgeLikes.getUserId(), knowledgeLikes.getKnowledgeId()) != 1) {
            knowledgeLikesMapper.addKnowledgeLikes(knowledgeLikes);
        }
    }

    public void cancelUserLike(Long id) {
        knowledgeLikesMapper.userCancelKnowledgeLike(
            securityAuditorAware.getCurrentAuditor().orElseThrow(), id);
    }
}
