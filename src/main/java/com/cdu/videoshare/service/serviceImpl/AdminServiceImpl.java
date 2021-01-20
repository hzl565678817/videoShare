package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.AdminMapper;
import com.cdu.videoshare.model.Admin;
import com.cdu.videoshare.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName AdminServiceImpl
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/13 11:16
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String account) {
        return adminMapper.getByAccountAndPwd(account);
    }
}
