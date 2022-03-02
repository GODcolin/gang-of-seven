package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Tag;
import com.nyanner.govii.elementary.mapper.TagMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class TagTest {
    @Autowired
    TagMapper tagMapper;

    @Test
    public void findTagsByKnowledgeIdTest() {
        List<Tag> tags = tagMapper.findTagsByKnowledgeId(11L);
        tags.forEach(e -> log.info("知识id为11的标签信息:{}", e));
    }


    @Test
    public void findAllTest() {
        List<Tag> tags = tagMapper.findAll();
        tags.forEach(e -> System.out.println(e));
    }

    @Test
    void addTagTest() {
        int i = tagMapper.addTag("测试标签");
        log.info("添加标签测试{}", i);
    }

    @Test
    void updateTagTest() {
        Tag tag = new Tag(25L, "更新标签名称测试");
        int i = tagMapper.updateTag(tag);

        log.info("更新标签测试{}", i);
    }

    @Test
    void delTagByIdTest() {
        int i = tagMapper.delTagById(25L);
        log.info("删除标签测试{}", i);
    }


    @Test
    public void findTagsByTagIdsTest() {
        List<Long> tagsId = new ArrayList<>();
        tagsId.add(1L);
        tagsId.add(2L);
        List<Tag> tags = tagMapper.findTagsByTagIds(tagsId);
        tags.forEach(e -> System.out.println(e));


    }


    @Test
    public void findByIdTest() {
        List<Long> tagsId = new ArrayList<>();
        tagsId.add(1L);
        tagsId.add(2L);
        List<Tag> tags = tagMapper.findTagsByTagIds(tagsId);
        tags.forEach(e -> System.out.println(e));
    }

    @Test
    public void findHotsTagIdsTest() {
        List<Long> tagsId = new ArrayList<>();
        tagsId.add(1L);
        tagsId.add(2L);
        List<Tag> tags = tagMapper.findTagsByTagIds(tagsId);
        tags.forEach(e -> System.out.println(e));
    }

}
