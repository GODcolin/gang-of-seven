package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.service.knowledge.CategoryService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/category")
@AllArgsConstructor
public class CategoryController {

    private CategoryService categoryService;

    @GetMapping("/findAllCategory")
    public RestResponse findAllCategory() {
        return RestResponse.ok(categoryService.findAllCategory());
    }

    @GetMapping("/findSecondCategory")
    public RestResponse findSecondCategory() {
        return RestResponse.ok(categoryService.findSecondCategory());
    }
}
