package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.Favor;
import org.springframework.stereotype.Repository;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/19 9:20
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Repository
public interface FavorMapper {


    int recordFavor(Favor favor);

    Favor checkFavor(int videoId,int userId);

    int cancelFavor(Favor favor);

}
