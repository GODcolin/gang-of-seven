package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Comment;
import com.nyanner.govii.elementary.mapper.CommentMapper;
import com.nyanner.govii.elementary.model.bean.IndividualComment;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class CommentTest {
    @Autowired
    CommentMapper commentMapper;

    @Test
    void selectByKnowledgeIdTest() {
        log.info("------开始查询了");
        List<Comment> comments = commentMapper.selectByKnowledgeId(11L);
        comments.forEach(e -> System.out.println(e));
    }

    @Test
    void findCommentsByParentIdTest() {
        List<Comment> comments = commentMapper.findCommentsByParentId(0L);

        comments.forEach(e -> System.out.println(e));
    }

    @Test
    void selectByUserIdTest() {
        List<IndividualComment> individualComments = commentMapper.selectByUserId(1L);
        individualComments.forEach(e -> log.info("查询用户id为1的所有评论内容:{}", e));
    }

    @Test
    void addCommentTest() {
        Comment comment = new Comment();
        comment.setUserId(1L);
        comment.setKnowledgeId(15L);
        comment.setContent("评论内容测试");
        comment.setParentId(0L);
        commentMapper.addComment(comment);
    }


}
