package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Source;
import com.nyanner.govii.elementary.mapper.SourceMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class SourceService {
    private SourceMapper sourceMapper;

    public List<Source> findAll() {
        return sourceMapper.selectAll();
    }
}
