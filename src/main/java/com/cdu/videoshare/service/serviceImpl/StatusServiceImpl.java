package com.cdu.videoshare.service.serviceImpl;


import com.cdu.videoshare.mapper.StatusMapper;
import com.cdu.videoshare.model.Status;
import com.cdu.videoshare.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class StatusServiceImpl implements StatusService {
    @Autowired
    private StatusMapper statusMapper;


    @Override
    public List<Status> getAll() {
        return statusMapper.getAll();
    }

    @Override
    public Status getById(int id) {
        return statusMapper.getById(id);
    }

    @Override
    public void update(int id, String sname) {
        statusMapper.update(id, sname);
    }
}
