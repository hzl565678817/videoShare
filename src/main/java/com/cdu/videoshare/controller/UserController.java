package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.ResponseEntity;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.model.UserQueryCondition;
import com.cdu.videoshare.service.StatusService;
import com.cdu.videoshare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * @ClassName UserController
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/15 14:01
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("user")
public class UserController {

    private static final int STATUS =  1;

    @Autowired
    private UserService userService;

    @Autowired
    private StatusService statusService;

    /**
     * 注册页面
     * @return reg
     */
    @GetMapping("reg")
    public String reg() {
        return "reg";
    }

    /**
     * 检测用户账号是否存在
     * @param account 账号
     * @return 存在与否
     */
    @GetMapping("check")
    @ResponseBody
    public Integer checkUser(String account) {
        return userService.checkUser(account);
    }

    /**
     * 添加用户
     * @param user 用户信息
     * @return login
     */
    @PostMapping("reg")
    @ResponseBody
    public ResponseEntity<Void> regUser(User user, Model model) {
        int status = userService.regUser(user);
        ResponseEntity<Void> responseEntity = null;
        if (status != STATUS){
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(500);
            responseEntity.setMsg("error");
            model.addAttribute("msg","注册失败，服务器异常");
        }else {
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(200);
            responseEntity.setMsg("ok");
        }
        return responseEntity;
    }

    /**
     * 跳转登录界面
     * @return 返回login
     */
    @GetMapping("login")
    public String login(){
        return "login";
    }

    @PostMapping("login")
    public String login(String account, String password, Model model, HttpSession session){
        User user = userService.getUserByAccountAndPwd(account, password);
        if (user == null){
            model.addAttribute("msg","用户名或密码有误，请重新输入");
            return "/login";
        }
        session.setAttribute("user",user);
        return "redirect:/index";
    }


    //用户列表方法整合
    @GetMapping("list")
    public String getAll(Integer pageNum, Model model, UserQueryCondition condition) {
        model.addAttribute("pageInfo",userService.getAll(pageNum == null ? 1 : pageNum,condition));

        //查询所有状态
        model.addAttribute("status",statusService.getAll());
        model.addAttribute("condition",condition);
        return "admin/user_list";
    }

    @GetMapping("del")
    public String del(int id,Integer pageNum, Model model,UserQueryCondition condition) {
        userService.delById(id);
        model.addAttribute("pageInfo", userService.getAll(pageNum == null ? 1 : pageNum,condition));
        return "admin/user_list";
    }




}
