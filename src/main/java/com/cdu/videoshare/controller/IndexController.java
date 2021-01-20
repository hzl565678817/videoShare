package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.CategoryService;
import com.cdu.videoshare.service.FavorService;
import com.cdu.videoshare.service.VideoService;
import com.cdu.videoshare.service.HisAndColService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

/**
 * @ClassName IndexController
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/15 14:18
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
public class IndexController {

    private static final int STATUS = 1;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private VideoService videoService;

    @Autowired
    FavorService favorService;

    @Autowired
    HisAndColService hisAndColService;

    @GetMapping("/index")
    public String index(Model model) {
        //查询所有的类别并且存在Model中
        model.addAttribute("categories",categoryService.getAll());
        model.addAttribute("videos",videoService.getForIndex());
        return "index";
    }

    @GetMapping("video/view/{id}")
    public String view(@PathVariable int id, Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user != null){
            int status = hisAndColService.checkRecord(user.getId(), id);
            videoService.modifyViewNum(user.getId(),id);
            if (status == STATUS){
                hisAndColService.modifyRecord(user.getId(),id);
            }else {
                hisAndColService.addHistoryByUser(user.getId(), id);
            }
            model.addAttribute("praise",favorService.checkPraise(id, user.getId()));
        }

        model.addAttribute("categories",categoryService.getAll());
        model.addAttribute("video",videoService.getById(id));
        return "view";
    }

    @GetMapping("index/category/{id}")
    public String indexByCategory(@PathVariable int id,Model model){
        //查询所有的类别并且存在Model中
        model.addAttribute("categories",categoryService.getAll());
        model.addAttribute("videos",videoService.getForIndexByCategory(id));
        return "index";
    }

    @GetMapping("index/search/{title}")
    public String searchVideo(@PathVariable String title, Model model){
        //查询所有的类别并且存在Model中
        model.addAttribute("categories",categoryService.getAll());
        model.addAttribute("videos",videoService.getForIndexByName(title));
        return "index";
    }




}
