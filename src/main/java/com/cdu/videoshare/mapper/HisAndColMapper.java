package com.cdu.videoshare.mapper;

import com.cdu.videoshare.model.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/20 10:23
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Repository
public interface HisAndColMapper {
    List<Video> getAll(int userId);

    int checkRecord(int userId,int videoId);

    void addHistoryByUser(int userId, int videoId);

    void modifyRecord(int userId, int videoId);


    List<Video> getAllCollection(int userId);

    List<Video> getMyVideo(int userId);



}
