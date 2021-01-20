package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.VideoMapper;
import com.cdu.videoshare.model.Category;
import com.cdu.videoshare.model.Video;
import com.cdu.videoshare.service.VideoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName VideoServiceImpl
 * @Version 1.0
 * @Author 何政梁
 * @Date 2021/1/14 10:34
 * @Description TODO
 * Modification User:
 * Modification Date:
 */

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public PageInfo<Video> getAll(int pageNum,Map<String, String> map) {
        int pageSize = 3;
        PageHelper.startPage(pageNum,pageSize);  //开启分页，接收两个参数：页码及分页大小
        List<Video> data = videoMapper.getAll(map);
        PageInfo<Video> pageInfo = new PageInfo<>(data); //包含分页的信息
        return pageInfo;
    }

    @Override
    public List<Video> getForIndex() {
        PageHelper.startPage(1, 15);  //开启分页，接收两个参数：页码及分页大小
        List<Video> data = videoMapper.getAll();
        PageInfo<Video> pageInfo = new PageInfo<>(data); //包含分页的信息
        return pageInfo.getList();
    }

    @Override
    public Video getById(int id) {
        return videoMapper.getById(id);
    }

    @Override
    public int addVideo(Video video) {
        return videoMapper.addVideo(video);
    }

    @Override
    public int updUserVideoNum(int id) {
        return videoMapper.updUserVideoNum(id);
    }

    @Override
    public List<Video> getForIndexByCategory(int id) {
        return videoMapper.getForIndexByCategory(id);
    }

    @Override
    public List<Video> getForIndexByName(String title) {
        return videoMapper.getForIndexByName(title);
    }


}
