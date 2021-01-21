package com.cdu.videoshare.service;

import com.cdu.videoshare.model.User;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/18 23:10
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
public interface HomeService {

    User getById(int id);
    void updateById(int id,String password,String account,String email);
}
