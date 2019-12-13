package management.databaseImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.utils.JdbcUtil;
import management.bean.OrderForm;
import management.tool.PageResult;

public class OrderFormDatabaseImpl {
	
	/**
	 * 通过购买者名称模糊查询
	 */
	
	public OrderForm queryById(int order_id) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		OrderForm orderForm = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from orderform where id=? ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1,order_id);
		
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				int id = resultSet.getInt("id");
				String logname = resultSet.getString("logname");
				String mess = resultSet.getString("mess");
				float sum = resultSet.getFloat("sum");
				int status = resultSet.getInt("status");
				
				orderForm = new OrderForm(id,logname,mess,sum,status);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return orderForm;
	}
	
	/**
	 * 查询表
	 */

	public List<OrderForm> queryAll() {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		List<OrderForm> orderFormList = new ArrayList<>();
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from orderform";
			prepareStatement = connection.prepareStatement(sql);
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				int id = resultSet.getInt("id");
				String logname = resultSet.getString("logname");
				String mess = resultSet.getString("mess");
				float sum = resultSet.getFloat("sum");
				int status = resultSet.getInt("status");
				OrderForm orderForm = new OrderForm(id,logname,mess,sum,status);
				orderFormList.add(orderForm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return orderFormList;
	}

	/**
	 * 修改信息
	 */
	public void update(OrderForm orderForm) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="update orderform set logname=?,mess=?,sum=?,status=? where id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, orderForm.getLogname());
			prepareStatement.setString(2, orderForm.getMess());
			prepareStatement.setFloat(3, orderForm.getSum());
			prepareStatement.setInt(4, orderForm.getStatus());
			prepareStatement.setInt(5, orderForm.getId());
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, null);
			
		}
		
	}
	
	/**
	 * 删除
	 */

	public void delete(int id) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="delete from orderform where id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
		
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}
	
	/**
	 * 改变为已处理状态
	 */

	public void changeStatus(int id) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="update orderform set status=? where id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, 1);
			prepareStatement.setInt(2, id);
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}

	/**
	 * 分页查询
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

			String sql ="select * from orderform "+whereSql+" limit ?,?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, (currentPage-1)*pageSize);
			prepareStatement.setInt(2, pageSize);
		
			resultSet = prepareStatement.executeQuery();
	
			List<OrderForm> orderFormList = new ArrayList<>();
			while(resultSet.next()) {
				int id = resultSet.getInt("id");
				String logname = resultSet.getString("logname");
				String mess = resultSet.getString("mess");
				float sum = resultSet.getFloat("sum");
				int status = resultSet.getInt("status");
				
				OrderForm orderForm = new OrderForm(id,logname,mess,sum,status);
				orderFormList.add(orderForm);
			}
			//查询表中用户总数
			String sql2 ="select * from orderform "+whereSql;
			prepareStatement2 = connection.prepareStatement(sql2);
			resultSet2 = prepareStatement2.executeQuery();
			Long totalRecord = 0L;
			while(resultSet2.next()) {
				totalRecord = totalRecord + 1;
			}
			pageResult = new PageResult(orderFormList, totalRecord, pageSize, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, resultSet);
			JdbcUtil.close(connection, prepareStatement2, resultSet2);
		}
		return pageResult;
	}
}
