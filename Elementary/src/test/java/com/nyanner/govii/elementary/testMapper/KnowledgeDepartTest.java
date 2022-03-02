package com.nyanner.govii.elementary.testMapper;

import com.nyanner.govii.elementary.mapper.KnowledgeDepartMapper;
import com.nyanner.govii.elementary.model.bean.DepartIdAndName;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class KnowledgeDepartTest {
    @Autowired
    KnowledgeDepartMapper knowledgeDepartMapper;

    @Test
    void batchKnowledgeDepartTest() {
        List<DepartIdAndName> depts = new ArrayList<>();
        depts.add(new DepartIdAndName(103L, "研发部门"));
        depts.add(new DepartIdAndName(104L, "市场部门"));
        depts.add(new DepartIdAndName(105L, "测试部门"));
        int i = knowledgeDepartMapper.batchKnowledgeDepart(12L, depts);
        log.info("批量添加知识部门关联信息 : {}", i);
    }


}
