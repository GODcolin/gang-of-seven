package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.History;
import com.nyanner.govii.elementary.mapper.HistoryMapper;
import com.nyanner.govii.elementary.model.bean.IndividualViewHistory;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class HistoryTest {
    @Autowired
    HistoryMapper historyMapper;

    @Test
    void findByUserIdTest() {
        List<IndividualViewHistory> viewHistories = historyMapper.findByUserId(1L);

        viewHistories.forEach(e -> log.info("查询用户id为1的浏览历史{}", e));
    }

    @Test
    void addHistoryTest() {
        History history = new History();
        history.setUserId(1L);
        history.setKnowledgeId(30L);
/*//        int i = historyMapper.addHistory(history);
        if(i == 1){
            log.info("添加用户浏览记录成功");
        }else{
            log.info("添加用户浏览记录失败");
        }*/
    }

    @Test
    void checkUserHistoryTest(){
        History history = new History();
        history.setUserId(1L);
        history.setKnowledgeId(30L);
        int i = historyMapper.checkUserHistory(history);
        log.info("查询是否存在一条浏览记录:{}",i);
    }

    @Test
    void updateVisitTimeTest(){
        History history = new History();
        history.setUserId(1L);
        history.setKnowledgeId(30L);
        int i = historyMapper.updateVisitTime(history);
        log.info("更新浏览时间:{}",i);
    }

}
