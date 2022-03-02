package com.nyanner.govii.elementary.entity.knowledge;

import lombok.Data;

/*
知识推荐参数设置
 */
@Data
public class RankSetting {
    private Integer limitTime;
    private String type;
    private Long userId;
}













