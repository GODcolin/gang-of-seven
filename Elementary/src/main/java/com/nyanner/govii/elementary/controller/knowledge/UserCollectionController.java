package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.knowledge.KnowledgeCollection;
import com.nyanner.govii.elementary.service.knowledge.UserCollectionService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

@RestController
@Slf4j
@RequestMapping("/api/collection")
@AllArgsConstructor
public class UserCollectionController {

    private UserCollectionService userCollectionService;
    private SecurityAuditorAware securityAuditorAware;

    @GetMapping("/findUserCollection")
    public RestResponse findUserCollection(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                           @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(userCollectionService.findUserCollection(
            securityAuditorAware.getCurrentAuditor().orElseThrow(), page, limit));
    }

    @GetMapping("/checkIsCollect")
    public RestResponse checkIsCollect(@NotNull Long id) {
        return RestResponse.ok(userCollectionService.checkUserCollectionKnowledge(id));
    }

    @Log(title = "用户收藏", businessType = BusinessType.INSERT)
    @PostMapping("/addCollection")
    public RestResponse addCollection(@RequestBody KnowledgeCollection knowledgeCollection) {
        userCollectionService.addUserCollection(knowledgeCollection);
        return RestResponse.ok();
    }

    @Log(title = "用户收藏", businessType = BusinessType.DELETE)
    @DeleteMapping("/cancelUserCollection")
    public RestResponse cancelUserCollection(@NotNull Long id) {
        userCollectionService.cancelUserCollection(id);
        return RestResponse.ok();
    }

}
