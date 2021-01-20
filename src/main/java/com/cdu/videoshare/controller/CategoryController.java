package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.Category;
import com.cdu.videoshare.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * @ClassName CategoryController
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/13 15:08
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 访问增加类别页面
     */
    @GetMapping("/add")
    public String add() {
        return "admin/category_add";
    }

    /**
     * 调用dao层接口，并封装查询的数据到model，回调给列表页面
     *
     * @param name  类别名
     * @param model 对象
     */
    @PostMapping("/add")
    public String add(String name, Model model) {
        categoryService.add(name);
        model.addAttribute("categories", categoryService.getAll());
        return "admin/category_list";
    }

    /**
     * 访问类别列表页面
     */
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("categories", categoryService.getAll());
        return "admin/category_list";
    }

    /**
     * 删除某个类别
     *
     * @param id 类别id,唯一标识符
     */
    @GetMapping("/del")
    public String del(int id, Model model) {
        categoryService.delById(id);
        model.addAttribute("categories", categoryService.getAll());
        return "admin/category_list";
    }

    @GetMapping("update/{id}")
    public String getById(@PathVariable int id, Model model) {
        Category category = categoryService.getById(id);
        model.addAttribute("category", category);
        return "admin/category_update";
    }

    @PostMapping("update")
    public String updateById(int id, String name, Model model) {
        int status = categoryService.updateById(id, name);
        model.addAttribute("categories", categoryService.getAll());
        return "admin/category_list";
    }
}
