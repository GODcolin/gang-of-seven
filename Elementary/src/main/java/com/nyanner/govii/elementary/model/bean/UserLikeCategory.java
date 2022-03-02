package com.nyanner.govii.elementary.model.bean;

import lombok.Data;

@Data
public class UserLikeCategory {
    private Long id;        //id
    private int count;      //每种类别的数量
    private double percent;     //占比
    private double cumulativeProbability;       //累计概率
}
