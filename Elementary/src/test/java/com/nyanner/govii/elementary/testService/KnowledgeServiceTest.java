package com.nyanner.govii.elementary.testService;

import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.entity.knowledge.Knowledge;
import com.nyanner.govii.elementary.entity.knowledge.Source;
import com.nyanner.govii.elementary.service.knowledge.KnowledgeService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class KnowledgeServiceTest {
    @Autowired
    KnowledgeService knowledgeService;

    @Test
    void addKnowledge() {
        Knowledge knowledge = new Knowledge();
        knowledge.setTitle("第二版测试");
        knowledge.setAuthorId(2L);
        Category category = new Category();
        category.setId(5L);
        category.setCategoryName("套餐使用");
        knowledge.setCategory(category);

        Source source = new Source();
        source.setId(2L);
        source.setName("人民网");
        knowledge.setSource(source);
        knowledge.setContent("今天是个好日子");
        knowledge.setMasterId(56L);


        knowledgeService.addKnowledge(knowledge);
    }
}
