package com.nyanner.govii.elementary.controller.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.RankSetting;
import com.nyanner.govii.elementary.service.knowledge.RankSettingsService;
import com.nyanner.govii.elementary.vo.RestResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/rankSetting")
@AllArgsConstructor
public class RankSettingController {

    private RankSettingsService rankSettingsService;

    @PostMapping("/setRecommendationSettings")
    public RestResponse setRecommendationSettings(@RequestBody RankSetting rankSetting) {
        rankSettingsService.setRecommendationSettings(rankSetting);
        return RestResponse.ok();
    }
}
