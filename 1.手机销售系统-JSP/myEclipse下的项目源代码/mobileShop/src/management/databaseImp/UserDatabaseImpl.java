package management.databaseImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import management.bean.User;
import management.tool.PageResult;
import org.utils.JdbcUtil;

public class UserDatabaseImpl {

	/**
	 * 注册用户
	 */
	public void add(User user) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
	
			String sql ="insert into user(logname, password, phone, address, realname) value(?,?,?,?,?) ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, user.getLogname());
			prepareStatement.setString(2, user.getPassword());
			prepareStatement.setString(3, user.getPhone());
			prepareStatement.setString(4, user.getAddress());
			prepareStatement.setString(5, user.getRealname());
		
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}
	
	
	/**
	 * 通过用户名模糊查询
	 */
	
	public User queryByLogname(String name) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from user where logname=? ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, name);
		
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				String logname = resultSet.getString("logname");
				String phone = resultSet.getString("phone");
				String address = resultSet.getString("address");
				String realname = resultSet.getString("realname");
				
				user = new User(logname,phone,address,realname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return user;
	}
	
	/**
	 * 查询表中所用的用户
	 */

	public List<User> queryAll() {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		List<User> userList = new ArrayList<>();
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from user";
			prepareStatement = connection.prepareStatement(sql);
			
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				String logname = resultSet.getString("logname");
				String realname = resultSet.getString("realname");
				User user = new User(logname,realname);
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return userList;
	}

	/**
	 * 修改用户信息
	 */
	public void update(User user) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="update user set logname=?,phone=?,address=?,realname=? where logname=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, user.getLogname());
			prepareStatement.setString(2, user.getPhone());
			prepareStatement.setString(3, user.getAddress());
			prepareStatement.setString(4, user.getRealname());
			prepareStatement.setString(5, user.getLogname());
		
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, null);
			
		}
		
	}
	
	/**
	 * 删除用户
	 */

	public void delete(String name) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="delete from user where logname=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, name);
		
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}

	/**
	 * 分页查询用户
	 */
	public PageResult queryByPages(Integer currentPage, Integer pageSize, String userName) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		PreparedStatement prepareStatement2 = null;
		ResultSet resultSet2 = null;
		PageResult pageResult = null;
		try {
			connection = JdbcUtil.getConnection();
			String whereSql = "";
			if(userName!=null && userName.trim().length()>0) {
				whereSql = "where logname like '%"+userName+"%' ";
			}

			String sql ="select * from user "+whereSql+" limit ?,?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, (currentPage-1)*pageSize);
			prepareStatement.setInt(2, pageSize);
		
			resultSet = prepareStatement.executeQuery();
	
			List<User> userList = new ArrayList<>();
			while(resultSet.next()) {
				String logname = resultSet.getString("logname");
				String phone = resultSet.getString("phone");
				String address = resultSet.getString("address");
				String realname = resultSet.getString("realname");
				
				User user = new User(logname,phone,address,realname);
				userList.add(user);
			}
			//查询表中用户总数
			String sql2 ="select * from user "+whereSql;
			prepareStatement2 = connection.prepareStatement(sql2);
			resultSet2 = prepareStatement2.executeQuery();
			Long totalRecord = 0L;
			while(resultSet2.next()) {
				totalRecord = totalRecord + 1;
			}
			pageResult = new PageResult(userList, totalRecord, pageSize, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, resultSet);
			JdbcUtil.close(connection, prepareStatement2, resultSet2);
		}
		return pageResult;
	}


	/**
	 * 号码和密码查找用户
	 */
	public User queryByAccountAndPassword(String phone, String password) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from user where phone=? and password=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, phone.trim());
			prepareStatement.setString(2, password.trim());
		
			resultSet = prepareStatement.executeQuery();
		
			while(resultSet.next()) {
				String logname = resultSet.getString("logname");
				String phoneStr = resultSet.getString("phone");
				String address = resultSet.getString("address");
				String realname = resultSet.getString("realname");
				user = new User(logname,phoneStr,address,realname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return user;
	}
	
	/**
	 * 号码和密码查找管理员
	 */
	public User queryManageByAccountAndPassword(String phone, String password) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			connection = JdbcUtil.getConnection();
			String sql ="select * from management where phone=? and password=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, phone.trim());
			prepareStatement.setString(2, password.trim());
		
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				String logname = resultSet.getString("logname");
				String phoneStr = resultSet.getString("phone");
				String address = resultSet.getString("address");
				String realname = resultSet.getString("realname");
				user = new User(logname,phoneStr,address,realname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return user;
	}
	
}
