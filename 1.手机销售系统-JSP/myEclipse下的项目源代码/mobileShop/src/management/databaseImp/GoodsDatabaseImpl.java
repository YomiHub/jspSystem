package management.databaseImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.utils.JdbcUtil;
import management.bean.Goods;
import management.tool.PageResult;

public class GoodsDatabaseImpl {
	/**
	 * 注册用户
	 */
	public void add(Goods goods) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
	
			String sql ="insert into mobileform values(?,?,?,?,?,?,?) ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, goods.getMobile_version());
			prepareStatement.setString(2, goods.getMobile_name());
			prepareStatement.setString(3, goods.getMobile_made());
			prepareStatement.setFloat(4, goods.getMobile_price());
			prepareStatement.setString(5, goods.getMobile_mess());
			prepareStatement.setString(6, goods.getMobile_pic());
			prepareStatement.setInt(7, goods.getId());
		
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}
	
	
	/**
	 * 通过手机版本号查询
	 */
	
	public Goods queryByVersion(String version) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		Goods goods = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from mobileform where mobile_version=? ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, version);
		
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				String mobile_version = resultSet.getString("mobile_version");
				String mobile_name = resultSet.getString("mobile_name");
				String mobile_made = resultSet.getString("mobile_made");
				float mobile_price = resultSet.getFloat("mobile_price");
				
				String mobile_mess = resultSet.getString("mobile_mess");
				String mobile_pic = resultSet.getString("mobile_pic");
				int id = resultSet.getInt("id");
				
				goods = new Goods(mobile_version, mobile_name,mobile_made, mobile_price, mobile_mess,mobile_pic,id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return goods;
	}
	
	/**
	 * 查询表中所用的用户
	 */

	public List<Goods> queryAll() {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		List<Goods> goodsList = new ArrayList<>();
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from mobileform";
			prepareStatement = connection.prepareStatement(sql);
			
			resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()) {
				String mobile_version = resultSet.getString("mobile_version");
				String mobile_name = resultSet.getString("mobile_name");
				String mobile_made = resultSet.getString("mobile_made");
				float mobile_price = resultSet.getFloat("mobile_price");
				
				String mobile_mess = resultSet.getString("mobile_mess");
				String mobile_pic = resultSet.getString("mobile_pic");
				int id = resultSet.getInt("id");
				Goods goods = new Goods(mobile_version, mobile_name,mobile_made, mobile_price, mobile_mess,mobile_pic,id);
				goodsList.add(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return goodsList;
	}

	/**
	 * 修改信息
	 */
	public void update(Goods goods) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="update mobileform set mobile_name=?, mobile_made=?, mobile_price=?, mobile_mess=?, mobile_pic=?, id=? where mobile_version=?";
			prepareStatement = connection.prepareStatement(sql);
		
			prepareStatement.setString(1, goods.getMobile_name());
			prepareStatement.setString(2, goods.getMobile_made());
			prepareStatement.setFloat(3, goods.getMobile_price());
			prepareStatement.setString(4, goods.getMobile_mess());
			prepareStatement.setString(5, goods.getMobile_pic());
			prepareStatement.setInt(6, goods.getId());
			prepareStatement.setString(7, goods.getMobile_version());
			
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

	public void delete(String mobile_version) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="delete from mobileform where mobile_version=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, mobile_version);
		
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
	public PageResult queryByPages(Integer currentPage, Integer pageSize, String mobileVersion) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		PreparedStatement prepareStatement2 = null;
		ResultSet resultSet2 = null;
		PageResult pageResult = null;
		try {
			connection = JdbcUtil.getConnection();
			String whereSql = "";
			if(mobileVersion!=null && mobileVersion.trim().length()>0) {
				whereSql = "where (mobile_version like '%"+mobileVersion+"%') or (mobile_name like '%"+mobileVersion+"%') ";
			}

			String sql ="select * from mobileform "+whereSql+" limit ?,?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, (currentPage-1)*pageSize);
			prepareStatement.setInt(2, pageSize);
		
			resultSet = prepareStatement.executeQuery();
	
			List<Goods> goodsList = new ArrayList<>();
			while(resultSet.next()) {
				String mobile_version = resultSet.getString("mobile_version");
				String mobile_name = resultSet.getString("mobile_name");
				String mobile_made = resultSet.getString("mobile_made");
				float mobile_price = resultSet.getFloat("mobile_price");
				
				String mobile_mess = resultSet.getString("mobile_mess");
				String mobile_pic = resultSet.getString("mobile_pic");
				int id = resultSet.getInt("id");
				
				Goods goods = new Goods(mobile_version, mobile_name,mobile_made, mobile_price, mobile_mess,mobile_pic,id);
				goodsList.add(goods);
			}
			//查询表中用户总数
			String sql2 ="select * from mobileform "+whereSql;
			prepareStatement2 = connection.prepareStatement(sql2);
			resultSet2 = prepareStatement2.executeQuery();
			Long totalRecord = 0L;
			while(resultSet2.next()) {
				totalRecord = totalRecord + 1;
			}
			pageResult = new PageResult(goodsList, totalRecord, pageSize, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, resultSet);
			JdbcUtil.close(connection, prepareStatement2, resultSet2);
		}
		return pageResult;
	}
	
}
