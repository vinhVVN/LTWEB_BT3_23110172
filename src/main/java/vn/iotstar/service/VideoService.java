package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Video;

public interface VideoService {
	List<Video> findAll();
    Video findById(String id);
    void insert(Video video);
    void update(Video video);
    void delete(String id) throws Exception;
    List<Video> findByTitle(String keyword);
}
