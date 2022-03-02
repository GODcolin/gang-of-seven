package com.nyanner.govii.elementary.service.knowledge;

import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.mapper.CategoryMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CategoryService {

    private CategoryMapper categoryMapper;

    public List<Category> findAllCategory() {
        return categoryMapper.findAll();
    }

    public List<Category> findSecondCategory() {
        return categoryMapper.findSecondCategory();
    }

}
