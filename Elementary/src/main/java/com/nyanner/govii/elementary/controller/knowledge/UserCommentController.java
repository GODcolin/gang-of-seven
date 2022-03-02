package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.entity.knowledge.Comment;
import com.nyanner.govii.elementary.service.knowledge.UserCommentService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

@RestController
@Slf4j
@RequestMapping("/api/comment")
@AllArgsConstructor
public class UserCommentController {

    private UserCommentService commentService;
    private UserCommentService userCommentService;

    @GetMapping("/findCommentByUserId")
    public RestResponse findCommentByUserId(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                            @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userCommentService.findCommentByUserId(page, limit));
    }

    @GetMapping("/selectCommentByKnowledgeId")
    public RestResponse selectCommentByKnowledgeId(@RequestParam("id") @NotBlank Long id,
                                                   @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                                   @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return RestResponse.ok(commentService.selectByKnowledgeId(id, limit, page));
    }

    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping("/addComment")
    public RestResponse addComment(@RequestBody Comment comment) {
        if (comment.getParentId() == null) {
            comment.setParentId(0L);
        }
        commentService.addComment(comment);
        return RestResponse.ok();
    }

    @Log(title = "评论", businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteKnowledgeById")
    public RestResponse delKnowledgeById(Long id) {
        commentService.delKnowledgeById(id);
        return RestResponse.ok();
    }

}
