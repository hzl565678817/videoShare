package com.cdu.videoshare.controller;


import com.cdu.videoshare.model.Praise;
import com.cdu.videoshare.model.ResponseEntity;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.PraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/18 11:23
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Controller
@RequestMapping("praise")
public class PraiseController {
    private static final int STATUS =  1;

    @Autowired
    private PraiseService praiseService;


    @ResponseBody
    @GetMapping("add")
    public ResponseEntity<Void> add(int id, HttpSession session){
        ResponseEntity<Void> responseEntity = null;
        User user = (User) session.getAttribute("user");
        if (user != null){
            int recordPraise = praiseService.recordPraise(new Praise(id, user.getId()));
            if (recordPraise == STATUS){
                responseEntity = new ResponseEntity<>();
                responseEntity.setCode(200);
                responseEntity.setMessage("ok");
            }else {
                responseEntity = new ResponseEntity<>();
                responseEntity.setCode(500);
                responseEntity.setMessage("error");
            }
        }
        return  responseEntity;
    }

    @ResponseBody
    @GetMapping("delete")
    public ResponseEntity<Void> delete(int id, HttpSession session){
        User user = (User) session.getAttribute("user");
        int recordFavor = praiseService.cancelPraise(new Praise(id, user.getId()));
        ResponseEntity<Void> responseEntity = null;
        if (recordFavor == STATUS){
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(200);
            responseEntity.setMessage("ok");
        }else {
            responseEntity = new ResponseEntity<>();
            responseEntity.setCode(500);
            responseEntity.setMessage("error");
        }
        return  responseEntity;
    }
}