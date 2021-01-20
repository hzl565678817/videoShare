package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.Status;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StatusMapper {
    void update(@Param("id") int id, @Param("name") String sname);

    Status getById(int id);

    List<Status> getAll();
}
