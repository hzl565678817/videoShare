package com.cdu.videoshare.service;

import com.cdu.videoshare.model.Category;

import java.util.List;

public interface CategoryService {

    void add(String name);

    List<Category> getAll();

    void delById(int id);

    Category getById(int id);

    int updateById(int id, String name);
}
