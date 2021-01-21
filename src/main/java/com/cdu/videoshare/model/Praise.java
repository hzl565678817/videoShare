package com.cdu.videoshare.model;

import lombok.Data;

@Data
public class Praise {
    private int id;
    private int videoId;
    private int userId;
    private String praiseTime;


    public Praise(int videoId, int userId) {
        this.videoId = videoId;
        this.userId = userId;
    }
}
