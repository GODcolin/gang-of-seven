package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeAudit;
import com.nyanner.govii.elementary.mapper.KnowledgeAuditMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class KnowledgeAuditTest {

    @Autowired
    KnowledgeAuditMapper knowledgeAuditMapper;

    @Test
    void findKnowledgeIdByIdTest() {
        Long knowledgeIdById = knowledgeAuditMapper.findKnowledgeIdById(1L);
        log.info("查询审核id为1的知识id : {}", knowledgeIdById);
    }

    @Test
    void addKnowledgeAuditTest() {
        KnowledgeAudit knowledgeAudit = new KnowledgeAudit();
        knowledgeAudit.setKnowledgeId(2L);
        knowledgeAudit.setReviewerId(2L);
        knowledgeAudit.setRejectReason("知识存在错误");
        int i = knowledgeAuditMapper.addKnowledgeAudit(knowledgeAudit);
        log.info("添加一条审核记录,{}", i);
    }
}
