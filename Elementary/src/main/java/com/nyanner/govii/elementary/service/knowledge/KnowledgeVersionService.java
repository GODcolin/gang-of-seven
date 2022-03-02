package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.KnowledgeVersion;
import com.nyanner.govii.elementary.mapper.KnowledgeVersionMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class KnowledgeVersionService {
    private KnowledgeVersionMapper knowledgeVersionMapper;

    public List<KnowledgeVersion> findByNewVersionId(Long id) {
        return knowledgeVersionMapper.findByNewVersionId(id);
    }

    public KnowledgeVersion findById(Long id) {
        return knowledgeVersionMapper.findById(id);
    }

    public KnowledgeVersion findByKnowledgeId(Long id) {
        return knowledgeVersionMapper.findByKnowledgeId(id);
    }

}
