package com.cdu.videoshare.service;

import com.cdu.videoshare.model.Video;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface VideoService {


    /**
     * 查询所有视频
     * @return 返回泛型为Video的List集合
     */
    PageInfo<Video> getAll(int pageNum,Map<String, String> map);

    /**
     * 查询首页视频信息
     * @return List实体集
     */
    List<Video> getForIndex();

    List<Video> getForIndexByCategory(int id);

    List<Video> getForIndexByName(String title);

    Video getById(int id);

    int addVideo(Video video);
    int updUserVideoNum(int id);

    void delById(int id);

    void modifyStatus(int id,int status);

    int modifyViewNum(int userId,int videoId);

    void delVideoById(int id,int userId);

    void delFavorById(int id,int userId);
    void delHisById(int id,int userId);

    void delPraiseById(int id,int userId);



}
