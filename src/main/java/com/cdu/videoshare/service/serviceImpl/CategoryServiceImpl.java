package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.CategoryMapper;
import com.cdu.videoshare.model.Category;
import com.cdu.videoshare.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.color.CMMException;
import java.util.List;

/**
 * @ClassName CategoryServiceImpl
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/13 15:08
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void add(String name) {
        categoryMapper.add(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryMapper.getAll();
    }

    @Override
    public void delById(int id) {
        categoryMapper.delById(id);
    }

    @Override
    public Category getById(int id) {
        return categoryMapper.getById(id);
    }

    @Override
    public int updateById(int id, String name) {
        return categoryMapper.updateById(id, name);
    }
}
