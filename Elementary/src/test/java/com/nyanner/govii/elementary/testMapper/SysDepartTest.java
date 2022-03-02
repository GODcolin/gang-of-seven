package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.entity.user.SysDept;
import com.nyanner.govii.elementary.mapper.SysDeptMapper;
import com.nyanner.govii.elementary.model.bean.DepartIdAndName;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class SysDepartTest {

    @Autowired
    SysDeptMapper sysDeptMapper;

    @Test
    void selectByKnowledgeIdTest() {
        List<DepartIdAndName> sysDepts = sysDeptMapper.selectByKnowledgeId(11L);
        sysDepts.forEach(e -> log.info("查询知识id为11的发布区域{}", e));
    }

    @Test
    void selectAllTest() {
        List<SysDept> sysDepts = sysDeptMapper.selectDeptAll();
        sysDepts.forEach(e -> log.info("查询所有的部门信息: {}", e));
    }
}
