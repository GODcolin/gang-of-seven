package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.common.KnowledgeStatusCode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.knowledge.History;
import com.nyanner.govii.elementary.entity.knowledge.Knowledge;
import com.nyanner.govii.elementary.model.bean.KnowledgeIdAndTitleAndContent;
import com.nyanner.govii.elementary.model.bean.KnowledgeManageInfo;
import com.nyanner.govii.elementary.service.knowledge.KnowledgeService;
import com.nyanner.govii.elementary.service.knowledge.ViewHistoryService;
import com.nyanner.govii.elementary.utils.HtmlToTextUtils;
import com.nyanner.govii.elementary.utils.QRCodeUtil;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.IOException;

@RestController
@Slf4j
@RequestMapping("/api/knowledge")
@AllArgsConstructor
public class KnowledgeController {

    private KnowledgeService knowledgeService;
    private SecurityAuditorAware securityAuditorAware;
    private ViewHistoryService viewHistoryService;


    @GetMapping("/findHotKnowledge")
    public RestResponse findHotKnowledge() {
        Integer limit = 10;
        return RestResponse.ok(knowledgeService.findHotKnowledge(limit));
    }

    @GetMapping("/selectKnowledgeByCategoryId")
    public RestResponse selectKnowledgeByCategoryId(@RequestParam("id") @NotNull Long id,
                                                    @RequestParam(value = "page", defaultValue = "1") Integer page,
                                                    @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(knowledgeService.selectKnowledgeByCategoryId(id, page, limit));
    }

    @GetMapping("/findNewKnowledge")
    public RestResponse findNewKnowledge() {
        Integer limit = 10;
        return RestResponse.ok(knowledgeService.selectNewKnowledge(limit));
    }

    //查找知识的历史
    @GetMapping("/findHistoryKnowledge")
    public RestResponse findHistoryKnowledge(Long masterId) {
        return RestResponse.ok(knowledgeService.findHistoryKnowledge(masterId));
    }

    //待审核知识
    @GetMapping("/findAuditingKnowledge")
    public RestResponse findAuditingKnowledge(@RequestParam(value = "limit", defaultValue = "10") Integer limit,
                                              @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return RestResponse.ok(knowledgeService.findAuditingKnowledge(limit, page));
    }

    //知识随机推荐
    @GetMapping("/recommendKnowledge")
    public RestResponse selectRandomKnowledge() {
        return RestResponse.ok(knowledgeService.selectRandomKnowledge());
    }

    //根据ID查具体知识
    @GetMapping("/findByKnowledgeId")
    public RestResponse findByKnowledgeId(@NotNull Long id) {
        History history = new History();
        history.setKnowledgeId(id);
        history.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        viewHistoryService.addViewHistory(history);
        return RestResponse.ok(knowledgeService.findByKnowledgeId(id));
    }

    //知识采编
    @Log(title = "知识采编", businessType = BusinessType.INSERT)
    @PostMapping("/addKnowledge")
    public RestResponse addKnowledge(@RequestBody Knowledge knowledge) {
        knowledge.setAuthorId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        knowledge.setStatus(KnowledgeStatusCode.AUDITING_WORKS);
        //判断直接提交知识，向数据库插入数据
        if(knowledge.getId() == null){
            knowledgeService.addKnowledge(knowledge);
            return RestResponse.ok(knowledge).msg("提交成功");
        }else{
            //判断是先保存、再提交只需要修改即可
            knowledgeService.updateKnowledge(knowledge);
            return RestResponse.ok(knowledge).msg("提交成功");
        }
    }

    //保存到草稿箱  需要重构
    @Log(title = "知识采编", businessType = BusinessType.INSERT)
    @PostMapping("/keepDraftKnowledge")
    public RestResponse keepDraftKnowledge(@Validated @RequestBody Knowledge knowledge) {


        knowledge.setAuthorId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        knowledge.setStatus(KnowledgeStatusCode.DRAFT_WORKS);
        //判断是第一次保存，向数据库添加数据
        if(knowledge.getId() == null){
             knowledgeService.addKnowledge(knowledge);
            return RestResponse.ok(knowledge);
        }else {
            //判断非第一次保存时，根据知识id修改数据库对应字段
            knowledgeService.updateKnowledge(knowledge);
            return RestResponse.ok(knowledge).msg("保存成功");
        }
    }

    //知识更新
    @Log(title = "知识采编", businessType = BusinessType.UPDATE)
    @PostMapping("/updateKnowledge")
    public RestResponse updateKnowledge(@RequestBody Knowledge knowledge) {
        return RestResponse.ok();
    }

    //知识删除
    @Log(title = "知识删除", businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteKnowledgeById")
    public RestResponse delKnowledgeById(@NotBlank Long id) {
        knowledgeService.delKnowledgeById(id);
        return RestResponse.ok();
    }

    //查询审核通过的知识
    @GetMapping("/selectAuditedKnowledge")
    public RestResponse selectAuditedKnowledge(@RequestParam(value = "title" ,defaultValue = "") String title,
                                               @RequestParam(value = "page", defaultValue = "1") Integer page,
                                               @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        return RestResponse.ok(knowledgeService.selectAuditedKnowledge(title,page,limit));
    }

    @GetMapping("/selectKnowledgeManageInfo")
    public RestResponse selectKnowledgeManageInfo(KnowledgeManageInfo knowledgeManageInfo) {
        if (knowledgeManageInfo.getLimit()==null){
            knowledgeManageInfo.setLimit(10);
        }
        if (knowledgeManageInfo.getPage()==null){
            knowledgeManageInfo.setPage(1);
        }
        return RestResponse.ok(knowledgeService.selectKnowledgeManageInfo(knowledgeManageInfo));
    }

    /**
     * @Description 根据知识id，查询分享知识的标题、内容，
     * @param id
    * @param response
     * @return
     **/
    @GetMapping("/qrCode")
    public RestResponse getQRCode(Long id, HttpServletResponse response){
        KnowledgeIdAndTitleAndContent knowledge = knowledgeService.shareKnowledgeById(id);
        try{
            StringBuilder builder = new StringBuilder();
            if(knowledge.getTitle().length() > 10)
                builder.append(knowledge.getTitle().substring(0,10));
            else
                builder.append(knowledge.getTitle());
            builder.append("\n\n");

            String text = HtmlToTextUtils.getText(knowledge.getContent());
            if(text.length() > 100){
                builder.append(text.substring(0,100));
                builder.append("....");
            }else{
                builder.append(text);
            }
            QRCodeUtil.createCodeToOutputStream(builder.toString(),response.getOutputStream());
            return RestResponse.ok();
        } catch (IOException e) {
            return RestResponse.fail().msg(e.getMessage());
        }
    }

    @GetMapping("/getKnowledgeDetails")
    public RestResponse selectKnowledgeTitleAndContentById(Long id){
        return RestResponse.ok(knowledgeService.selectKnowledgeTitleAndContentById(id));
    }

}













