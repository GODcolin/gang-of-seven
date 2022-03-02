package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeVersion;
import com.nyanner.govii.elementary.mapper.KnowledgeVersionMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class KnowledgeVersionTest {

    @Autowired
    KnowledgeVersionMapper knowledgeVersionMapper;

    @Test
    void findByKnowledgeIdTest() {
        KnowledgeVersion knowledgeVersion = knowledgeVersionMapper.findByKnowledgeId(11L);
        log.info("查询知识id为1的版本{}", knowledgeVersion);
    }
}
