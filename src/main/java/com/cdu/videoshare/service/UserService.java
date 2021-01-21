package com.cdu.videoshare.service;

import com.cdu.videoshare.model.User;
import com.cdu.videoshare.model.UserQueryCondition;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

public interface UserService {

    int regUser(User user);

    int checkUser(String account);

    User getUserByAccountAndPwd(String account,String password);

    void delById(int id);

    PageInfo<User> getAll(int pageNum, UserQueryCondition condition);

    void update(@Param("id") int id, @Param("status") String status);
    void modifyStatus(int id,int status);

}
