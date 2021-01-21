package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.CategoryService;
import com.cdu.videoshare.service.HisAndColService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/19 21:41
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("view")
public class HisAndColController {

    @Autowired
    private HisAndColService hisAndColService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("history")
    public String viewHistory(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("videos", hisAndColService.getAll(user.getId()));
        return "home/videoHistory";
    }

    @GetMapping("collection")
    public String viewCollection(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("videos", hisAndColService.getAllCollection(user.getId()));
        return "home/videoCollection";
    }

    @GetMapping("myvideo")
    public String viewMy(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("videos", hisAndColService.getMyVideo(user.getId()));
        return "home/myVideo";
    }

    @GetMapping("praise")
    public String viewPraise(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("videos", hisAndColService.getPraise(user.getId()));
        return "home/videoPraise";
    }

}
