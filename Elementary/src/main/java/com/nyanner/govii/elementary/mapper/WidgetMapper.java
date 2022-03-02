package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Widget;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WidgetMapper {
    void addWidget(Widget widget);
}
