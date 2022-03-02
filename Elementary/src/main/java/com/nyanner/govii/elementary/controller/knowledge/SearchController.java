package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.model.bean.KnowledgeParams;
import com.nyanner.govii.elementary.model.bean.SearchKnowledge;
import com.nyanner.govii.elementary.service.knowledge.SearchService;
import com.nyanner.govii.elementary.utils.DateUtils;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

@RestController
@RequestMapping("/api/search")
@AllArgsConstructor
@Slf4j
public class SearchController {
    private final SearchService searchService;

    @GetMapping
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public PageMode<SearchKnowledge> search(
        @RequestParam("q") @NotBlank String q,
        @RequestParam(value = "limit", defaultValue = "10") Integer limit,
        @RequestParam(value = "page", defaultValue = "1") Integer page
    ) {
        return searchService.search(q, limit, page);
    }

    //高级搜索
    @GetMapping("/advancedSearchKnowledge")
    public RestResponse advancedSearchKnowledge(@RequestParam(value = "title",defaultValue = "") String title,
                                                @RequestParam(value = "keyWords",defaultValue = "") String keyWords,
                                                @RequestParam(value = "category",defaultValue = "") String category,
                                                @RequestParam(value = "author",defaultValue = "") String author,
                                                @RequestParam(value = "beginTime",defaultValue = "") String beginTime,
                                                @RequestParam(value = "endTime",defaultValue = "") String endTime,
                                                @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                                @RequestParam(value = "page", defaultValue = "1") Integer page
                                                ) {

        KnowledgeParams knowledgeParams = new KnowledgeParams();
        if(!title.equals(""))
            knowledgeParams.setTitle(title);
        if(!keyWords.equals(""))
            knowledgeParams.setKeyWords(keyWords);
        if(!category.equals(""))
            knowledgeParams.setCategory(category);
        if(!author.equals(""))
            knowledgeParams.setAuthor(author);
        if(!beginTime.equals("")){
            knowledgeParams.setBeginTime(DateUtils.dateTime("yyyy-MM-dd",beginTime));
        }
        if(!endTime.equals("")){
            knowledgeParams.setEndTime(DateUtils.dateTime("yyyy-MM-dd",endTime));
        }

        knowledgeParams.setPage(page);
        knowledgeParams.setLimit(limit);

        log.info("打印高级搜索条件:{}",knowledgeParams);
        return RestResponse.ok(searchService.advancedSearchKnowledge(knowledgeParams));
    }
}
