package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeSource;
import com.nyanner.govii.elementary.mapper.KnowledgeSourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeSourceTest {
    @Autowired
    KnowledgeSourceMapper knowledgeSourceMapper;

    @Test
    void batchKnowledgeSourceTest() {
        List<KnowledgeSource> knowledgeSourceList = new ArrayList<>();

        knowledgeSourceList.add(new KnowledgeSource(4, 5L, 6));
        knowledgeSourceList.add(new KnowledgeSource(4, 5L, 7));
        knowledgeSourceList.add(new KnowledgeSource(4, 5L, 8));
        knowledgeSourceList.add(new KnowledgeSource(4, 3L, 9));
        knowledgeSourceList.add(new KnowledgeSource(4, 2L, 7));
        int i = knowledgeSourceMapper.batchKnowledgeSource(knowledgeSourceList);
        log.info("批量添加了知识渠道关联信息 : {}", i);
    }

}
