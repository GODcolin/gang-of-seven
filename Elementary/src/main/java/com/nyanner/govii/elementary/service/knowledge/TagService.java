package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Tag;
import com.nyanner.govii.elementary.mapper.TagMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class TagService {

    private TagMapper tagMapper;

    public List<Tag> findTagsByKnowledgeId(Long articleId) {
        return tagMapper.findTagsByKnowledgeId(articleId);
    }

    public List<Tag> findTagsByTagIds(List<Long> ids) {
        return tagMapper.findTagsByTagIds(ids);
    }

    public List<Tag> findAll() {
        return tagMapper.findAll();
    }

    public Tag findById(Long id) {
        return tagMapper.findById(id);
    }

    public List<Long> findHotsTagIds(int limit) {
        return tagMapper.findHotsTagIds(limit);
    }

    public void addTag(Tag tag) {
        tagMapper.addTag(tag.getTagName());
    }

}