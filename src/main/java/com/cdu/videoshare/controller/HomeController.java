package com.cdu.videoshare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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


    @GetMapping("/personal")
    public String personSet() {


        return "/home/index";
    }

}
