package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeAudit;
import com.nyanner.govii.elementary.model.bean.ReceiveAuditParam;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.KnowledgeAuditMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class KnowledgeAuditService {
    private KnowledgeAuditMapper knowledgeAuditMapper;
    private SecurityAuditorAware securityAuditorAware;

    //查看已经审核的内容
    public List<KnowledgeAudit> findByReviewerId(Long id) {
        return knowledgeAuditMapper.findByReviewerId(id);
    }

    public void addKnowledgeAudit(ReceiveAuditParam auditKnowledgeVO) {
        KnowledgeAudit knowledgeAudit = new KnowledgeAudit();
        BeanUtils.copyProperties(auditKnowledgeVO, knowledgeAudit);
        knowledgeAudit.setReviewerId(securityAuditorAware.getCurrentAuditor().orElseThrow());
//        knowledgeAudit.setReviewerId(securityAuditorAware.getCurrentAuditor().orElseThrow());//获取当前用户id
//        knowledgeAudit.setKnowledgeId(auditKnowledgeVO.getKnowledgeId());
        knowledgeAuditMapper.addKnowledgeAudit(knowledgeAudit);
    }

    public void updateKnowledgeAudit(Map<String, Object> map) {
        knowledgeAuditMapper.updateKnowledgeAudit(map);
    }
}
