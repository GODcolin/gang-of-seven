package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RankSettingMapper {

    /**
     * @param
     * @return
     * @Description 根据当前用户查询知识推荐配置参数
     **/
    RankSetting selectRankSetting(Long userId);

    /**
     * @param
     * @return
     * @Description 修改知识推荐配置参数
     **/
    int updateRankSetting(RankSetting rankSetting);
}









