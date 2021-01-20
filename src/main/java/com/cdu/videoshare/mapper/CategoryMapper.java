package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 类别的mapper接口
 */
@Repository
public interface CategoryMapper {

    /**
     * 增加一个类别
     * @param name 类别名
     */
    void add(@Param("name") String name);

    /**
     * 查询所有类别名
     * @return 返回泛型为Category的List集合
     */
    List<Category> getAll();

    /**
     * 删除某个类别
     * @param id 类别id
     */
    void delById(int id);

    /**
     * 根据用户id查询类别实体
     * @param id 类别id
     * @return 类别实体
     */
    Category getById(int id);

    /**
     * 通过id修改类别
     * @param id 类别id
     * @return 成功与否
     */
    int updateById(@Param("id") int id, @Param("name") String name);

}
