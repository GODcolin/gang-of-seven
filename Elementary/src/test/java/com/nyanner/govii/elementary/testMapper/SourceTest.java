package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Source;
import com.nyanner.govii.elementary.mapper.SourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class SourceTest {
    @Autowired
    SourceMapper sourceMapper;

    @Test
    void selectAllTest() {
        List<Source> sources = sourceMapper.selectAll();
        sources.forEach(e -> {
            log.info("所有知识来源信息: {}", e);
        });
    }

    @Test
    void selectByKnowledgeIdTest() {
        List<Source> sources = sourceMapper.selectByKnowledgeId(1L);
        sources.forEach(e -> {
            log.info("根据知识id查询知识来源信息: {}", e);
        });
    }

}
