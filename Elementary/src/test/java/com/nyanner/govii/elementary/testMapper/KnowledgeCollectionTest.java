package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeCollection;
import com.nyanner.govii.elementary.mapper.KnowledgeCollectionMapper;
import com.nyanner.govii.elementary.model.bean.IndividualCollection;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeCollectionTest {
    @Autowired
    KnowledgeCollectionMapper knowledgeCollectionMapper;

    @Test
    void selectByUserIdTest() {
        List<IndividualCollection> knowledgeCollections = knowledgeCollectionMapper.selectByUserId(1L);
        knowledgeCollections.forEach(e -> log.info("根据用户id查询收藏知识信息 {}", e));
    }

    @Test
    void addKnowledgeCollectionTest() {
        KnowledgeCollection knowledgeCollection = new KnowledgeCollection();
        knowledgeCollection.setKnowledgeId(5L);
        knowledgeCollection.setUserId(3L);
        int i = knowledgeCollectionMapper.addKnowledgeCollection(knowledgeCollection);
        log.info("用户id为10的用户收藏了知识id为3 , {}", i);
    }

    @Test
    void findCollectionCountsByKnowledgeIdTest() {
        int collectionCountsByKnowledgeId = knowledgeCollectionMapper.findCollectionCountsByKnowledgeId(11L);
        log.info("查询知识id为11的收藏量: {}", collectionCountsByKnowledgeId);
    }

    @Test
    void checkUserKnowledgeCollectTest() {
        int i = knowledgeCollectionMapper.checkUserKnowledgeCollect(3L, 5L);
        log.info("检查用户id为3是否收藏知识id为5的知识:{}", i);

    }

    @Test
    void userCancelKnowledgeCollectTest() {
        int i = knowledgeCollectionMapper.userCancelKnowledgeCollect(3L, 5L);
        log.info("用户取消知识收藏:{}", i);
    }


}
