package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.configs.DBConnectionSQLServer;
import vn.iotstar.dao.ProductDAO;
import vn.iotstar.model.Category;
import vn.iotstar.model.Product;

public class ProductDAOImpl implements ProductDAO{

	@Override
	public void insert(Product product) {
		String sql = "INSERT INTO Product(product_name, description, price, image, cate_id) VALUES (?,?,?,?,?)";
		try {
			Connection con = new DBConnectionSQLServer().getConnectionW();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getProductname());
			ps.setString(2, product.getDescription());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCateid());
			ps.executeUpdate();
		}
		catch (Exception ex){
			ex.printStackTrace();
		}
	}

	@Override
	public void edit(Product product) {
		String sql = "UPDATE product SET product_name = ?, description=?, price=?, image = ?, cate_id = ?"
				+ " WHERE product_id = ?";
		try {
			Connection con = new DBConnectionSQLServer().getConnectionW();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getProductname());
			ps.setString(2, product.getDescription());
			ps.setDouble(3, product.getPrice());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCateid());
			ps.setInt(6, product.getProductid());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM product WHERE product_id = ?";
		try {
			Connection con = new DBConnectionSQLServer().getConnectionW();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Product get(int id) {
		String sql = "SELECT * FROM Product WHERE product_id = ?";
        try {
            Connection con = new DBConnectionSQLServer().getConnectionW();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductid(rs.getInt("product_id"));
                product.setProductname(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setCateid(rs.getInt("cate_id"));
                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}

	@Override
	public List<Product> getAll() {
		List<Product> products = new ArrayList<Product>();
		String sql = "SELECT * FROM Product";
		try {
			Connection conn = new DBConnectionSQLServer().getConnectionW();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
                product.setProductid(rs.getInt("product_id"));
                product.setProductname(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setCateid(rs.getInt("cate_id"));
				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public List<Product> search(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsByCID(int cate_id) {
		List<Product> products = new ArrayList<Product>();
		String sql = "SELECT * FROM Product WHERE cate_id = ?";
		try {
			Connection conn = new DBConnectionSQLServer().getConnectionW();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cate_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
                product.setProductid(rs.getInt("product_id"));
                product.setProductname(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setCateid(rs.getInt("cate_id"));
				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
}
