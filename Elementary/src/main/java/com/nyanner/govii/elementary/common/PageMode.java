package com.nyanner.govii.elementary.common;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
//分页模型
public class PageMode<T> {

    //当前页码
    @JsonProperty("current_page")
    private Integer pageIndex;

    // 每页数量 页距(条/页)
    @JsonProperty("limit")
    private Integer pageSize;

    //总条数
    @JsonProperty("total")
    private Integer total;

    //页码总数
    @JsonProperty("pages")
    private Integer pages;

    //数据
    @JsonProperty("data")
    private List<T> data;

}










