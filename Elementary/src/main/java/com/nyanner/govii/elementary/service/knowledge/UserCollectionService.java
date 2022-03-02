package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeCollection;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.KnowledgeCollectionMapper;
import com.nyanner.govii.elementary.model.bean.IndividualCollection;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserCollectionService {

    private KnowledgeCollectionMapper knowledgeCollectionMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<IndividualCollection> findUserCollection(Long id, Integer page, Integer limit) {
        return PageUtil.query(page, limit, () -> knowledgeCollectionMapper.selectByUserId(id));
    }

    public boolean checkUserCollectionKnowledge(Long id) {

        if (knowledgeCollectionMapper.checkUserKnowledgeCollect(
            securityAuditorAware.getCurrentAuditor().orElseThrow(), id) == 1) {
            return true;
        } else return false;
    }

    public void addUserCollection(KnowledgeCollection knowledgeCollection) {
        knowledgeCollection.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        if (knowledgeCollectionMapper.checkUserKnowledgeCollect(knowledgeCollection.getUserId(), knowledgeCollection.getKnowledgeId()) == 0) {
            knowledgeCollectionMapper.addKnowledgeCollection(knowledgeCollection);
        }
    }

    public void cancelUserCollection(Long id) {
        knowledgeCollectionMapper.userCancelKnowledgeCollect(securityAuditorAware.getCurrentAuditor().orElseThrow(), id);
    }

}
