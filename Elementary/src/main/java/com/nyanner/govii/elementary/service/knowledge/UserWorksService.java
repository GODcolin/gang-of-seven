package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.KnowledgeMapper;
import com.nyanner.govii.elementary.model.bean.IndividualKnowledge;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserWorksService {
    private KnowledgeMapper knowledgeMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<IndividualKnowledge> findAllWorksById(Integer page, Integer limit) {
        return PageUtil.query(page, limit,
            () -> knowledgeMapper.selectKnowledgeByUser(securityAuditorAware.getCurrentAuditor().orElseThrow(), null));
    }

    public PageMode<IndividualKnowledge> findUserWorks(Integer page, Integer limit, String status) {
        return PageUtil.query(page, limit,
            () -> knowledgeMapper.selectKnowledgeByUser(securityAuditorAware.getCurrentAuditor().orElseThrow(), status));
    }

}
