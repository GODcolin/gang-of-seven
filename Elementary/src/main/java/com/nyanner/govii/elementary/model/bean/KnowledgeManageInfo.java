package com.nyanner.govii.elementary.model.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeManageInfo {
    private Long id;            //知识id
    private String title;       //标题
    private String author;      //作者
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;    //创建时间
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date lifeTime;      //有效时间
    private String isDelete;    //是否下线
    private String status;      //状态
    private String version;     //版本
    private String auditor;     //审核者
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date auditTime;     //审核时间
    private Integer limit;
    private Integer page;
}














