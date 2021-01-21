package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.FavorMapper;
import com.cdu.videoshare.model.Favor;
import com.cdu.videoshare.service.FavorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/19 9:21
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class FavorServiceImpl implements FavorService {

    @Autowired
    private FavorMapper favorMapper;

    @Override
    public int recordFavor(Favor favor) {
        return favorMapper.recordFavor(favor);
    }

    @Override
    public Favor checkFavor(int videoId,int userId) {
        return favorMapper.checkFavor(videoId,userId);
    }

    @Override
    public int cancelFavor(Favor favor) {
        return favorMapper.cancelFavor(favor);
    }
}
