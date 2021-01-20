package com.cdu.videoshare;

import lombok.extern.apachecommons.CommonsLog;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.cdu.videoshare.mapper")
public class VideoshareApplication  {

    public static void main(String[] args) {
        SpringApplication.run(VideoshareApplication.class, args);
    }


}
