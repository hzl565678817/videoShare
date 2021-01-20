package com.cdu.videoshare.model;


import lombok.Data;

/**
 * @ClassName Video
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/14 10:26
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Data
public class Video {
    private int id;
    private String title;
    private String url;
    private User user;
    private Category category;
    private String pubTime;
    private String cover;
    private int viewNum;
    private int praiseNum;
    private Status status;
    private String sname;
    private String viewTime;


}
