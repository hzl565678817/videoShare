package com.cdu.videoshare.controller;

import com.cdu.videoshare.model.Favor;
import com.cdu.videoshare.model.ResponseEntity;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.FavorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("favor")
public class FavorController {
    private static final int STATUS =  1;

    @Autowired
    private FavorService favorService;


    @ResponseBody
    @GetMapping("add")
    public ResponseEntity<Void> add(int id, HttpSession session){
        ResponseEntity<Void> responseEntity = null;
        User user = (User) session.getAttribute("user");
        if (user != null){
            int recordFavor = favorService.recordFavor(new Favor(id, user.getId()));
            if (recordFavor == STATUS){
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
        int recordFavor = favorService.cancelFavor(new Favor(id, user.getId()));
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
