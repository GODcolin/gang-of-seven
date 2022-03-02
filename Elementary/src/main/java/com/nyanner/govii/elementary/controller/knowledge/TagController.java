package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.entity.knowledge.Tag;
import com.nyanner.govii.elementary.service.knowledge.TagService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/tag")
@AllArgsConstructor
public class TagController {

    private TagService tagService;

    @GetMapping("/findAllTag")
    public RestResponse findAllTag() {
        return RestResponse.ok(tagService.findAll());
    }

    @Log(title = "标签", businessType = BusinessType.INSERT)
    @PostMapping("/addTag")
    public RestResponse addTag(Tag tag) {
        tagService.addTag(tag);
        return RestResponse.ok();
    }
}


