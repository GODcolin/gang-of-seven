package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Tag;
import com.nyanner.govii.elementary.mapper.KnowledgeTagMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeTagMapperTest {

    @Autowired
    KnowledgeTagMapper knowledgeTagMapper;

    @Test
    void batchKnowledgeTagTest() {

        List<Tag> tags = new ArrayList<>();
        tags.add(new Tag(1L, "5G"));
        tags.add(new Tag(3L, "话费"));
        tags.add(new Tag(4L, "装修"));

        int i = knowledgeTagMapper.batchKnowledgeTag(15L, tags);
        log.info("添加知识标签关联表记录 : {}", i);

    }
}
