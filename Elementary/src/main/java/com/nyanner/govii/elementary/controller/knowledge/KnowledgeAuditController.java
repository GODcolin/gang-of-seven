package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.common.KnowledgeStatusCode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.model.bean.ReceiveAuditParam;
import com.nyanner.govii.elementary.service.knowledge.KnowledgeAuditService;
import com.nyanner.govii.elementary.service.knowledge.KnowledgeService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/audit")
@AllArgsConstructor
public class KnowledgeAuditController {
    private KnowledgeAuditService knowledgeAuditService;
    private KnowledgeService knowledgeService;
    private SecurityAuditorAware securityAuditorAware;

    @GetMapping("/findByReviewerId")
    public RestResponse findByReviewerId() {
        Long id = securityAuditorAware.getCurrentAuditor().orElseThrow();//获取当前用户id
        return RestResponse.ok(knowledgeAuditService.findByReviewerId(id));
    }

    @Log(title = "审核", businessType = BusinessType.INSERT)
    @PostMapping("/addKnowledgeAudit")
    public RestResponse addKnowledgeAudit(@RequestBody ReceiveAuditParam receiveAuditParamVO) {
        if (receiveAuditParamVO.getFlag() != null) {
            if (receiveAuditParamVO.getFlag() == 1) {
                knowledgeService.updateKnowledgeStatusById(receiveAuditParamVO.getKnowledgeId(), KnowledgeStatusCode.PASS_WORKS);
            } else if (receiveAuditParamVO.getFlag() == 0) {
                knowledgeService.updateKnowledgeStatusById(receiveAuditParamVO.getKnowledgeId(), KnowledgeStatusCode.DRAFT_WORKS);
            }
            knowledgeAuditService.addKnowledgeAudit(receiveAuditParamVO);
            return RestResponse.ok();
        } else return RestResponse.fail("接收到的传递审核结果参数为空");
    }

//    @Log(title = "审核", businessType = BusinessType.UPDATE)
//    @PostMapping("/updateKnowledgeAudit")
//    public RestResponse updateKnowledgeAudit(@RequestBody Map<String,Object> map) {
//        return RestResponse.ok();
//    }


}
