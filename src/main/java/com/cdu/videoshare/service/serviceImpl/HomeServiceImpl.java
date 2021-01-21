package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.HomeMapper;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/18 23:10
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    private HomeMapper homeMapper;

    @Override
    public User getById(int id) {
        return homeMapper.getById(id);
    }

    @Override
    public void updateById(int id, String password, String account, String email) {
        homeMapper.updateById(id,password,account,email);
    }
}
