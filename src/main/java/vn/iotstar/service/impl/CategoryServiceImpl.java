package vn.iotstar.service.impl;

import java.util.List;

import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.dao.impl.CategoryDAOImpl;
import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	
	CategoryDAO cateDAO = new CategoryDAOImpl();
	
	@Override
	public void insert(Category category) {
		cateDAO.insert(category);
	}

	@Override
	public void edit(Category newCategory) {
		Category oldCate = cateDAO.get(newCategory.getCateid());
		oldCate.setCatename(newCategory.getCatename());
		oldCate.setIcon(newCategory.getIcon());
		cateDAO.edit(oldCate);
		
	}

	@Override
	public void delete(int id) {
		cateDAO.delete(id);
		
	}

	@Override
	public Category get(int id) {
		return cateDAO.get(id);
	}

	@Override
	public Category get(String name) {
		return cateDAO.get(name);
	}

	@Override
	public List<Category> getAll() {
		return cateDAO.getAll();
	}

	@Override
	public List<Category> search(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
