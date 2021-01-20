package com.cdu.videoshare.mapper;


import com.cdu.videoshare.model.Category;
import com.cdu.videoshare.model.Favor;
import com.cdu.videoshare.model.Video;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 视频接口
 */
@Repository
public interface VideoMapper {

    /**
     * 查询所有视频
     * @return 返回泛型为Video的List集合
     */
    List<Video> getAll(Map<String, String> map);
    List<Video> getAll();

    Video getById(int id);

    int addVideo(Video video);

    int updUserVideoNum(int id);

    List<Video> getForIndexByCategory(int id);

    List<Video> getForIndexByName(String title);



}
