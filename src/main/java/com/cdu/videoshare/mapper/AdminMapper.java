package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 管理员的Mapper接口
 */
@Repository
public interface AdminMapper {
    /**
     * 根据账号密码查询管理员
     * @param account 账号
     * @return 返回一个Admin实体
     */
    Admin getByAccountAndPwd(String account );

    void updatePwd(@Param("id") int id, @Param("password1") String password1);
}
