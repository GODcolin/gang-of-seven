package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.entity.knowledge.KnowledgeLikes;
import com.nyanner.govii.elementary.service.knowledge.UserLikesService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

@RestController
@Slf4j
@RequestMapping("/api/userLikes")
@AllArgsConstructor
public class UserLikesController {

    private UserLikesService userLikesService;

    @GetMapping("/findUserLikes")
    public RestResponse findUserLikes(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                      @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userLikesService.findUserLikes(page, limit));
    }

    @GetMapping("/checkIsLike")
    public RestResponse checkUserLikeKnowledge(@NotNull Long id) {
        return RestResponse.ok(userLikesService.checkUserLikeKnowledge(id));
    }

    @Log(title = "点赞", businessType = BusinessType.INSERT)
    @PostMapping("/addUserLike")
    public RestResponse addUserLikes(@RequestBody KnowledgeLikes knowledgeLikes) {
        userLikesService.addUserLike(knowledgeLikes);
        return RestResponse.ok();
    }

    @Log(title = "点赞", businessType = BusinessType.DELETE)
    @DeleteMapping("/cancelUserLike")
    public RestResponse cancelUserLike(@NotNull Long id) {
        userLikesService.cancelUserLike(id);
        return RestResponse.ok();
    }


}
