package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    /**
     * @param
     * @return
     * @Description 查询所有的公告
     **/
    List<Notice> selectAll();
}
