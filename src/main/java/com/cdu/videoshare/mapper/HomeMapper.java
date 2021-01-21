package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/18 23:10
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Repository
public interface HomeMapper {

    User getById(int id);
    void updateById(@Param("id") int id, @Param("password") String password, @Param("account")String account, @Param("email")String email);
}
