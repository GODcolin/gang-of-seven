package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.RankSettingMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class RankSettingsService {

    private RankSettingMapper rankSettingMapper;
    private SecurityAuditorAware securityAuditorAware;

    public void setRecommendationSettings(RankSetting rankSetting) {
        rankSetting.setUserId(securityAuditorAware.getCurrentAuditor().orElseThrow());
        rankSettingMapper.updateRankSetting(rankSetting);
    }
}
