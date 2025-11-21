package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Video;

public interface VideoDAO {
	List<Video> findAll();
    Video findById(String id);
    void insert(Video video);
    void update(Video video);
    void delete(String id) throws Exception;
    List<Video> findByTitle(String keyword);
}
