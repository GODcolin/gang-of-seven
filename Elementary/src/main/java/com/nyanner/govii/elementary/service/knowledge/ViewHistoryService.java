package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.History;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.mapper.HistoryMapper;
import com.nyanner.govii.elementary.model.bean.IndividualViewHistory;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ViewHistoryService {

    private HistoryMapper historyMapper;
    private SecurityAuditorAware securityAuditorAware;

    public PageMode<IndividualViewHistory> findViewHistoryByUserId(Integer page, Integer limit) {
        return PageUtil.query(page, limit,
            () -> historyMapper.findByUserId(securityAuditorAware.getCurrentAuditor().orElseThrow()));
    }

    public void addViewHistory(History history) {
        if(historyMapper.checkUserHistory(history) > 0)
            historyMapper.updateVisitTime(history);
        else
            historyMapper.addHistory(history);
    }
}
