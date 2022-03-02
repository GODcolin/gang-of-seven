package com.nyanner.govii.elementary.model.bean;

import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeIdAndTitleAndTime {
    private Long id;
    private String title;
    private Date createTime;
}
