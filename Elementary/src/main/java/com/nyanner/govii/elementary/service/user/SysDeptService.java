package com.nyanner.govii.elementary.service.user;

import com.nyanner.govii.elementary.entity.user.SysDept;
import com.nyanner.govii.elementary.mapper.SysDeptMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class SysDeptService {
    private SysDeptMapper sysDeptMapper;

    public List<SysDept> findAll() {
        return sysDeptMapper.selectDeptAll();
    }
}
