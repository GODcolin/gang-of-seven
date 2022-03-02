package com.nyanner.govii.elementary.model.bean;

import lombok.Data;

@Data
public class ReceiveAuditParam {
    private Integer flag;
    private Long knowledgeId;
    private String rejectReason;
}
