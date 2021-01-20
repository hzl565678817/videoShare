package com.cdu.videoshare.model;

import lombok.Data;

/**
 * @ClassName User
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/14 14:28
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Data
public class User {
    private int id;
    private String account;
    private String password;
    private String email;
    private String regTime;
    private int videoNum;
    private int score;
    private Status status;
    private String photoUrl;
    private String sname;
}
