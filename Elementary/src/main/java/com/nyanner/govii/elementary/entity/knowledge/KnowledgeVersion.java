package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class KnowledgeVersion {
    private Long id;            //版本id
    private String versionName; //版本名称
    private Long KnowledgeId;   //知识id
    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;   //创建时间
    private Long creatorId;     //创建者id
    private Long newVersionId;  //最新版本的id

}
