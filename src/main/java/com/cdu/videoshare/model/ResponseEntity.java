package com.cdu.videoshare.model;

import lombok.Data;

import java.util.List;

@Data
public class ResponseEntity<T> {
    private int code;   //响应码
    private String message; //消息
    private T data; //数据


}
