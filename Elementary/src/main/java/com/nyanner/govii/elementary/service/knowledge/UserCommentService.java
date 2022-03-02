package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Comment;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.CommentMapper;
import com.nyanner.govii.elementary.model.bean.IndividualComment;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserCommentService {

    private CommentMapper commentMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<Comment> selectByKnowledgeId(Long id, Integer limit, Integer page) {
        return PageUtil.query(page, limit, () -> commentMapper.selectByKnowledgeId(id));
    }

    public PageMode<IndividualComment> findCommentByUserId(Integer page, Integer limit) {
        return PageUtil.query(page, limit,
            () -> commentMapper.selectByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow()));
    }

    public void addComment(Comment comment) {
        comment.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        commentMapper.addComment(comment);
    }

    public void delKnowledgeById(Long id) {
        commentMapper.deleteCommentById(id);
    }

}
