package vn.iotstar.dao;

import vn.iotstar.model.User;

public interface UserDAO {
	public User get(String username);
}
