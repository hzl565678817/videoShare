package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/18 23:09
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HomeService homeService;

    @GetMapping ("updview")
    public  String update(){
        return "/home/update_all";
    }

    @GetMapping ("index")
    public  String index(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("user",user);
        return "/home/index";
    }


    @PostMapping("update/{id}")
    public  String update(@PathVariable int id, String newPassword, String account, String email, Model model){
        homeService.updateById(id,newPassword,account,email);
        model.addAttribute("user",homeService.getById(id));
        return "/home/index";
    }
}
