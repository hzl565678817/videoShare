package com.cdu.videoshare.service;


import com.cdu.videoshare.model.Admin;

/**
 * 管理员service接口
 */

public interface AdminService {

    /**
     * 管理员登录
     * @param account 账号
     * @return admin实体
     */
    Admin login(String account);
}
