package com.cdu.videoshare.model;

import lombok.Data;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/19 9:27
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Data
public class Favor {
    private int id;
    private int videoId;
    private int userId;
    private String favorTime;

    public Favor(int videoId, int userId) {
        this.videoId = videoId;
        this.userId = userId;
    }
}
