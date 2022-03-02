package com.nyanner.govii.elementary.testMapper;


import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.mapper.CategoryMapper;
import com.nyanner.govii.elementary.model.bean.UserLikeCategory;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class CategoryTest {
    @Autowired
    CategoryMapper categoryMapper;

    @Test
    void findAllTest() {
        List<Category> categories = categoryMapper.findAll();
        categories.forEach(e -> log.info("查看所有的类别:{}", e));
    }


    @Test
    void findCategoryByIdTest() {
        Category category = categoryMapper.findCategoryById(1L);
        System.out.println(category);
    }


    @Test
    void addCategoryTest() {
        Category category = new Category();
        category.setParentId(44L);
        category.setCategoryName("二级类别添加");


        int i = categoryMapper.addCategory(category);
        log.info("添加了知识类别{}", i);
    }

    @Test
    void deleteCategoryByIdTest() {
        categoryMapper.deleteCategoryById(44L);
    }

    @Test
    void findSecondCategoryTest(){
        List<Category> secondCategory = categoryMapper.findSecondCategory();
        secondCategory.forEach(e -> log.info("二级分类:{}",e));
    }



}
