package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import com.nyanner.govii.elementary.mapper.RankSettingMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class RankSettingMapperTest {
    @Autowired
    RankSettingMapper rankSettingMapper;

    @Test
    public void selectRankSettingTest() {
        RankSetting rankSetting = rankSettingMapper.selectRankSetting(1L);
        log.info("查询知识推荐参数设置{}", rankSetting);
    }

    @Test
    public void updateRankSettingTest() {
        RankSetting rankSetting = new RankSetting();
        rankSetting.setLimitTime(30);
        rankSetting.setType("1");
        rankSetting.setUserId(1L);
        int i = rankSettingMapper.updateRankSetting(rankSetting);
        log.info("修改知识推荐参数:{}", i);

    }

}
