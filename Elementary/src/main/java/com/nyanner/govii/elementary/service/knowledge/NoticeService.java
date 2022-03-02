package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Notice;
import com.nyanner.govii.elementary.mapper.NoticeMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class NoticeService {

    private NoticeMapper noticeMapper;

    public List<Notice> findAllNotice() {
        List<Notice> noticeList = noticeMapper.selectAll();
        return noticeList;
    }
}
