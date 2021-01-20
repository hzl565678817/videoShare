package com.cdu.videoshare.service;

import com.cdu.videoshare.model.Status;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatusService {

    List<Status> getAll();


    Status getById(int id);

    void update(@Param("id") int id, @Param("name") String sname);
}
