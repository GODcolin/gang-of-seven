package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeTicket;
import com.nyanner.govii.elementary.mapper.KnowledgeTicketMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class KnowledgeTicketMapperTest {

    @Autowired
    KnowledgeTicketMapper knowledgeTicketMapper;

    @Test
    public void addKnowledgeTicketTest() {
        KnowledgeTicket knowledgeTicket = new KnowledgeTicket();
        knowledgeTicket.setKnowledgeId(2L);
        knowledgeTicket.setTicketId(5L);
        int i = knowledgeTicketMapper.addKnowledgeTicket(knowledgeTicket);
        log.info("测试添加知识工单关联记录:{}", i);
    }
}
