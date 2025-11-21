package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.DBConnectionSQLServer;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.entity.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public void insert(Category category) {
		EntityManager enma = JPAConfig.getEnityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(category);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			enma.close();
		}
	}

	@Override
	public void update(Category category) {
		EntityManager enma = JPAConfig.getEnityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(category);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			enma.close();
		}

	}

	@Override
	public void delete(int id) {
		EntityManager enma = JPAConfig.getEnityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Category category = enma.find(Category.class, id);
			if (category != null) {
				enma.remove(category);
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			enma.close();
		}

	}

	@Override
	public Category findById(int id) {
		EntityManager enma = JPAConfig.getEnityManager();
		return enma.find(Category.class, id);
	}

	@Override
	public List<Category> findByName(String name) {
		EntityManager enma = JPAConfig.getEnityManager();
		String jpql = "SELECT c FROM Category c WHERE c.categoryName LIKE :keyword";
        TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
        query.setParameter("keyword", "%" + name + "%");
        return query.getResultList();
	}

	@Override
	public List<Category> findAll() {
		EntityManager enma = JPAConfig.getEnityManager();
		String jpql = "SELECT c FROM Category c";
		TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
		return query.getResultList();
	}


	
}
