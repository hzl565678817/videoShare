package com.cdu.videoshare.service.serviceImpl;


import com.cdu.videoshare.mapper.PraiseMapper;
import com.cdu.videoshare.model.Praise;
import com.cdu.videoshare.service.PraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PraiseServiceImpl implements PraiseService {
    @Autowired
    public PraiseMapper praiseMapper;

    @Override
    public int recordPraise(Praise praise) {
        return praiseMapper.recordPraise(praise);
    }

    @Override
    public Praise checkPraise(int videoId, int userId) {
        return praiseMapper.checkPraise(videoId,userId);
    }

    @Override
    public int cancelPraise(Praise praise) {
        return praiseMapper.cancelPraise(praise);
    }
}
