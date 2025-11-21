package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.VideoDAO;
import vn.iotstar.entity.Video;

public class VideoDAOImpl implements VideoDAO{
	
	private EntityManager entityManager = JPAConfig.getEnityManager();
	
	@Override
	public List<Video> findAll() {
		String jpql = "SELECT v FROM Video v";
        TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
        return query.getResultList();
	}

	@Override
	public Video findById(String id) {
		return entityManager.find(Video.class, id);
	}

	@Override
	public void insert(Video video) {
		entityManager.persist(video);
		
	}

	@Override
	public void update(Video video) {
		entityManager.merge(video);
		
	}

	@Override
	public void delete(String id) throws Exception {
		Video video = findById(id);
        if (video != null) {
            entityManager.remove(video);
        } else {
            throw new Exception("Không tìm thấy Video để xóa");
        }
		
	}

	@Override
	public List<Video> findByTitle(String keyword) {
		String jpql = "SELECT v FROM Video v WHERE v.title LIKE :keyword";
        TypedQuery<Video> query = entityManager.createQuery(jpql, Video.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
	}

}
