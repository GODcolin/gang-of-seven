package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.knowledge.Notice;
import com.nyanner.govii.elementary.mapper.NoticeMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class NoticeTest {
    @Autowired
    NoticeMapper noticeMapper;

    @Test
    public void selectAllTest() {
        List<Notice> notices = noticeMapper.selectAll();
        notices.forEach(e -> log.info("所有的公告信息:{}", e));
    }
}
