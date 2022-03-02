package com.nyanner.govii.elementary.entity.knowledge;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Notice {
    private Long id;   //公告id

    private String title;   //公告标题

    private String content;   //公告内容

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date createTime;     //公告创建时间

    @JsonFormat(shape = JsonFormat.Shape.NUMBER)
    private Date validTime;     //公告截止时间

    private Integer status;   //状态0正常1关闭

    private Integer viewCounts;   //浏览次数
}
