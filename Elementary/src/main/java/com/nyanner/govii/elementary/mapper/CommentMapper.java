package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Comment;
import com.nyanner.govii.elementary.model.bean.IndividualComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    /**
     * @param knowledgeId
     * @return
     * @Description 根据文章id查询评论
     **/
    List<Comment> selectByKnowledgeId(Long knowledgeId);

    /*
    根据用户id查询评论内容
     */
    List<IndividualComment> selectByUserId(Long userId);

    /**
     * @param parentId
     * @return
     * @Description 根据父评论的id查找所有的子评论
     **/
    List<Comment> findCommentsByParentId(Long parentId);

    /**
     * @param comment
     * @return
     * @Description 添加评论
     **/
    int addComment(Comment comment);

    /**
     * @param id
     * @return
     * @Description 根据评论id删除评论
     **/
    int deleteCommentById(Long id);

}














