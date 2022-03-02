package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.History;
import com.nyanner.govii.elementary.model.bean.IndividualViewHistory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HistoryMapper {

    List<IndividualViewHistory> findByUserId(Long userId);

    int addHistory(History history);

    /**
     * @Description 判断用户是否浏览过该历史
     * @param history
     * @return
     **/
    int checkUserHistory(History history);


    int updateVisitTime(History history);
}
