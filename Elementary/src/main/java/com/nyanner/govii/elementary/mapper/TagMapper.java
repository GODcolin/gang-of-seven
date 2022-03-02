package com.nyanner.govii.elementary.mapper;

import com.nyanner.govii.elementary.entity.knowledge.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {

    /**
     * @param
     * @return
     * @Description 查找所有的标签
     **/
    List<Tag> findAll();


    /**
     * @param id
     * @return
     * @Description 根据知识id查询标签信息
     **/
    List<Tag> findTagsByKnowledgeId(Long id);


    /**
     * @param name
     * @return
     * @Description 添加标签
     **/
    int addTag(String name);

    /**
     * @param tag
     * @return
     * @Description 修改标签
     **/
    int updateTag(Tag tag);

    /**
     * @param id
     * @return
     * @Description 删除标签
     **/
    int delTagById(Long id);


    /**
     * @param ids
     * @return
     * @Description 根据多个标签ids查询对应标签信息
     **/
    List<Tag> findTagsByTagIds(List<Long> ids);


    /**
     * @param id 标签id
     * @return
     * @Description 根据标签id查找标签信息
     **/
    Tag findById(Long id);

    List<Long> findHotsTagIds(int limit);


}


















