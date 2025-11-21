package vn.iotstar.service.impl;

import java.util.List;

import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.dao.impl.CategoryDAOImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	
	CategoryDAO cateDAO = new CategoryDAOImpl();
	
	@Override
	public void insert(Category category) {
		cateDAO.insert(category);
	}

	@Override
	public void update(Category newCategory) {
		cateDAO.update(newCategory);
		
	}

	@Override
	public void delete(int id) throws Exception {
		cateDAO.delete(id);
		
	}

	@Override
	public Category findById(int id) {
		return cateDAO.findById(id);
	}

	@Override
	public List<Category> findByName(String name) {
		return cateDAO.findByName(name);
	}

	@Override
	public List<Category> findAll() {
		return cateDAO.findAll();
	}

	
}
