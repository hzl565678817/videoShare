package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.User;
import com.cdu.videoshare.model.UserQueryCondition;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    /**
     * 注册
     * @param user user实体
     */
    int addUser(User user);

    int checkUser(String account);

    User getUserByAccountAndPwd(@Param("account") String account, @Param("password") String password);

    List<User> getAll(UserQueryCondition condition);

    void update(@Param("id") int id, @Param("status") String status);
    void delById(int id);


}
