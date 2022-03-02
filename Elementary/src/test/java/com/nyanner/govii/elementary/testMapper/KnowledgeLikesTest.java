package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeLikes;
import com.nyanner.govii.elementary.mapper.KnowledgeLikesMapper;
import com.nyanner.govii.elementary.model.bean.IndividualKnowledgeLikes;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeLikesTest {
    @Autowired
    KnowledgeLikesMapper knowledgeLikesMapper;

    @Test
    void selectByUserIdTest() {
        List<IndividualKnowledgeLikes> knowledgeLikes = knowledgeLikesMapper.selectByUserId(3L);
        knowledgeLikes.forEach(e -> log.info("查询用户id为3的点赞信息:{}", e));
    }

    @Test
    void addKnowledgeLikesTest() {
        KnowledgeLikes knowledgeLikes = new KnowledgeLikes();
        knowledgeLikes.setKnowledgeId(3L);
        knowledgeLikes.setUserId(9L);

        int i = knowledgeLikesMapper.addKnowledgeLikes(knowledgeLikes);
        log.info("添加一条知识点赞信息,{}", i);
    }

    @Test
    void checkUserLikeKnowledgeTest() {
        int i = knowledgeLikesMapper.checkUserLikeKnowledge(1L, 11L);
        log.info("查询用户是否点赞知识:{}", i);
    }

    @Test
    void userCancelKnowledgeLikeTest() {
        int i = knowledgeLikesMapper.userCancelKnowledgeLike(9L, 3L);
        log.info("用户取消点赞:{}", i);
    }

}













