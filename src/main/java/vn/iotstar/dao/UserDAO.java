package vn.iotstar.dao;

import vn.iotstar.entity.User;

public interface UserDAO {
	public User get(String username);
	
	void insert(User user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	User findByEmail(String email);
	
	void updatePassword(int id, String newpass);
	
	void update(User user);
}
