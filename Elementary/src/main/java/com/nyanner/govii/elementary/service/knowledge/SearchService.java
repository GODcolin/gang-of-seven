package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.model.bean.KnowledgeParams;
import com.nyanner.govii.elementary.common.PageMode;
import com.nyanner.govii.elementary.mapper.KnowledgeMapper;
import com.nyanner.govii.elementary.model.bean.SearchKnowledge;
import com.nyanner.govii.elementary.utils.PageUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class SearchService {
    private final KnowledgeMapper knowledgeMapper;

    public PageMode<SearchKnowledge> search(String q, Integer limit, Integer page) {
        return PageUtil.query(page, limit, () -> knowledgeMapper.searchKnowledgeInfo(q));
    }

    public PageMode<SearchKnowledge> advancedSearchKnowledge(KnowledgeParams knowledgeParams) {
        return PageUtil.query(knowledgeParams.getPage(), knowledgeParams.getLimit(),
            () -> knowledgeMapper.advancedSearchKnowledge(knowledgeParams));
    }

}
