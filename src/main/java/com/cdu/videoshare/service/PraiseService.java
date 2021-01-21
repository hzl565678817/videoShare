package com.cdu.videoshare.service;


import com.cdu.videoshare.model.Praise;

public interface PraiseService {


    int recordPraise(Praise praise);

    Praise checkPraise(int videoId,int userId);

    int cancelPraise(Praise praise);
}
