package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.UserMapper;
import com.cdu.videoshare.model.User;
import com.cdu.videoshare.model.UserQueryCondition;
import com.cdu.videoshare.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/15 14:01
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int regUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int checkUser(String account) {
        return userMapper.checkUser(account);
    }

    @Override
    public User getUserByAccountAndPwd(String account, String password) {
        return userMapper.getUserByAccountAndPwd(account,password);
    }

    //整合用户列表

    @Override
    public void delById(int id) {
        userMapper.delById(id);
    }


    @Override
    public PageInfo<User> getAll(int pageNum, UserQueryCondition condition) {
        int pagesize = 3;

        PageHelper.startPage(pageNum, pagesize);
        List<User> data = userMapper.getAll(condition);
        PageInfo<User> pageInfo = new PageInfo<>(data);
        return pageInfo;

    }

    @Override
    public void update(int id, String status) {
        userMapper.update(id, status);
    }

    @Override
    public void modifyStatus(int id, int status) {
        userMapper.modifyStatus(id,status);
    }
}
