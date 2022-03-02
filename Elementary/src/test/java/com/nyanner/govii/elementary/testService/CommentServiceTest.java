package com.nyanner.govii.elementary.testService;

import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.entity.knowledge.Comment;
import com.nyanner.govii.elementary.service.knowledge.UserCommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class CommentServiceTest {

    @Autowired
    UserCommentService commentService;

    @Test
    void selectByKnowledgeIdTest() {
        PageMode<Comment> comments = commentService.selectByKnowledgeId(11L, 5, 2);
        System.out.println(comments);
    }

    @Test
    void addCommentTest() {
        Comment comment = new Comment();
        comment.setUserId(1L);
        comment.setKnowledgeId(15L);
        comment.setContent("文章很棒");
        comment.setParentId(26L);
        commentService.addComment(comment);
    }
}









