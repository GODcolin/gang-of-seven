package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Category;
import com.nyanner.govii.elementary.model.bean.UserLikeCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {


    /**
     * @param
     * @return
     * @Description 查询所有的分类
     **/
    List<Category> findAll();

    /**
     * @Description     查询二级分类
     * @param
     * @return
     */
    List<Category> findSecondCategory();


    /**
     * @param id 类别id
     * @return
     * @Description 根据类别id查询分类信息
     **/
    Category findCategoryById(Long id);


    /**
     * @param parentId
     * @return
     * @Description 根据父id查询所有的子类别信息
     **/
    List<Category> findCategoryByParentId(Long parentId);


    int addCategory(Category category);

    /**
     * @param name
     * @param id
     * @return
     * @Description 根据类别id更改类别名称
     **/
    int updateCategory(String name, String id);

    /**
     * @param id
     * @return
     * @Description 根据类别id删除知识类别
     **/
    int deleteCategoryById(Long id);

    /**
     * @param userId
     * @return
     * @Description 查询用户的点赞类别及数量
     **/
    List<UserLikeCategory> findUserLikeCategory(Long userId);

    /**
     * @param userId
     * @return
     * @Description 查询用户的评论类别及数量
     **/
    List<UserLikeCategory> findUserCollectionCategory(Long userId);

}



























