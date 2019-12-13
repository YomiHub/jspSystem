package management.service;

import java.util.List;
import management.bean.User;
import management.tool.PageResult;
import management.databaseImp.UserDatabaseImpl;

public class UserServiceImpl{

	public List<User> queryAll() {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		return userDao.queryAll();
	}

	public void add(User user) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		userDao.add(user);
	}

	public void delete(String logname) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		userDao.delete(logname);
	}

	public PageResult queryByPages(Integer currentPage, Integer pageSize, String userName) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		return userDao.queryByPages(currentPage, pageSize, userName);
	}

	public User queryByLogname(String name) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		return userDao.queryByLogname(name);
	}

	public void update(User user) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		userDao.update(user);
	}

	public User queryByAccountAndPassword(String phone, String password) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		return userDao.queryByAccountAndPassword(phone,password);
	}
	
	public User queryManageByAccountAndPassword(String phone, String password) {
		UserDatabaseImpl userDao = new UserDatabaseImpl();
		return userDao.queryManageByAccountAndPassword(phone,password);
	}

}
