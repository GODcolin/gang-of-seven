package com.nyanner.govii.elementary.utils;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nyanner.govii.elementary.common.PageMode;

import java.util.List;
import java.util.function.Supplier;

//分页工具类
public class PageUtil {
    public static <T> PageMode<T> query(Integer pageIndex, Integer pageSize, Supplier<List<T>> supplier) {
        Page<T> page = PageHelper.startPage(pageIndex, pageSize);
        List<T> list = supplier.get();
        PageInfo<T> pageInfo = new PageInfo<>(list);

        return PageMode.<T>builder()
            .pageIndex(pageIndex)
            .pageSize(pageSize)
            .total((int) pageInfo.getTotal())
            .pages(pageInfo.getPages())
            .data(list)
            .build();
    }
}
