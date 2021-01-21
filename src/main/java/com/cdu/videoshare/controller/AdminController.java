package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.Admin;
import com.cdu.videoshare.model.ResponseEntity;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.AdminService;
import com.cdu.videoshare.service.HomeService;
import com.cdu.videoshare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @ClassName AdminController
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/13 11:03
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;



    /**
     * 访问登录页面
     */
    @GetMapping("/login")
    public String login() {
        return "admin/login";
    }

    /**
     * 用户校验
     * @param account  账号
     * @param password 密码
     */
    @PostMapping("/login")
    public String checkUser(String account, String password, Model model, HttpSession session) {
        Admin admin = adminService.login(account);
        if (admin == null) {
            model.addAttribute("msg", "该账号不存在");
            return "admin/login";
        } else {
            if (!admin.getPassword().equals(password)) {
                model.addAttribute("msg", "密码不正确");
                return "admin/login";
            } else {
                session.setAttribute("admin", admin);
                return "admin/index";
            }
        }
    }

    @GetMapping("/logout")
    public String logOut(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login";
    }


    @GetMapping("modifypwd")
    public String modify(Model model,HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        model.addAttribute("admin",admin);
        return "admin/updpwd";
    }

    @PostMapping("updatepwd")
    @ResponseBody
    public ResponseEntity<Void> modifyPwd(int id, String password1, String password2, Model model,HttpSession session){
        ResponseEntity<Void> responseEntity = null;
        if (password1.equals(password2)) {
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(200);
            adminService.updatePwd(id, password1);
            session.invalidate();
            return responseEntity;
        } else {
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(201);
            return responseEntity;
        }
    }

}
