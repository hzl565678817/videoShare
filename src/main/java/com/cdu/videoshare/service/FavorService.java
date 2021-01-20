package com.cdu.videoshare.service;

import com.cdu.videoshare.model.Favor;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/19 9:21
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
public interface FavorService {


    int recordFavor(Favor favor);

    Favor checkPraise(int videoId,int userId);

    int cancelFavor(Favor favor);

}
