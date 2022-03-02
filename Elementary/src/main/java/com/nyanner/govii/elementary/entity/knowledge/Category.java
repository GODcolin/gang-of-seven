package com.nyanner.govii.elementary.entity.knowledge;

import lombok.Data;

import java.util.List;

//分类
@Data
public class Category {
    private Long id;
    private Long parentId;              //父id
    private String categoryName;        //类别名称

    private List<Category> childrenCategorys;   //子类别集合
}
