package com.cdu.videoshare.service.serviceImpl;

import com.cdu.videoshare.mapper.HisAndColMapper;
import com.cdu.videoshare.model.Video;
import com.cdu.videoshare.service.HisAndColService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Version 1.0
 * @Author 彭彭
 * @Date 2021/1/20 10:24
 * @Description TODO
 * Modification User:
 * Modification Date:
 */
@Service
public class HisAndColServiceImpl implements HisAndColService {

    @Autowired
    private HisAndColMapper hisAndColMapper;

    @Override
    public List<Video> getAll(int userId) {
        return hisAndColMapper.getAll(userId);
    }

    @Override
    public int checkRecord(int userId,int videoId) {
        return hisAndColMapper.checkRecord(userId,videoId);
    }

    @Override
    public void modifyRecord(int userId, int videoId) {
        hisAndColMapper.modifyRecord(userId, videoId);
    }
    @Override
    public void addHistoryByUser(int userId, int videoId) {
        hisAndColMapper.addHistoryByUser(userId, videoId);
    }

    @Override
    public List<Video> getAllCollection(int userId) {
        return hisAndColMapper.getAllCollection(userId);
    }

    @Override
    public List<Video> getMyVideo(int userId) {
        return hisAndColMapper.getMyVideo(userId);
    }

    @Override
    public List<Video> getPraise(int userId) {
        return hisAndColMapper.getPraise(userId);
    }
}
