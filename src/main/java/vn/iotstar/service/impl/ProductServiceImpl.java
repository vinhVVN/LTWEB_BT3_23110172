package vn.iotstar.service.impl;

import java.util.List;

import vn.iotstar.dao.ProductDAO;
import vn.iotstar.dao.impl.ProductDAOImpl;
import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;

public class ProductServiceImpl implements ProductService{
	ProductDAO productDao = new ProductDAOImpl();
	@Override
	public void insert(Product product) {
		
		productDao.insert(product);
	}

	@Override
	public void edit(Product product) {
		
		productDao.edit(product);
	}

	@Override
	public void delete(int id) {
		productDao.delete(id);
		
	}

	@Override
	public Product get(int id) {
		return productDao.get(id);
	}

	@Override
	public List<Product> getAll() {
		// TODO Auto-generated method stub
		return productDao.getAll();
	}

	@Override
	public List<Product> search(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsByCID(int cate_id) {
		// TODO Auto-generated method stub
		return productDao.getProductsByCID(cate_id);
	}
	
}
