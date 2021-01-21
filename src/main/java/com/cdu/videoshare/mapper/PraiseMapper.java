package com.cdu.videoshare.mapper;


import com.cdu.videoshare.model.Praise;
import org.springframework.stereotype.Repository;

@Repository
public interface PraiseMapper {

    int recordPraise(Praise praise);

    Praise checkPraise(int videoId,int userId);

    int cancelPraise(Praise praise);
}
