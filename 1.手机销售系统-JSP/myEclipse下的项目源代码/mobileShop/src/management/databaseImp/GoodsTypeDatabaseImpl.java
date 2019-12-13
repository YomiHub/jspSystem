package management.databaseImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.utils.JdbcUtil;
import management.bean.GoodsType;
import management.tool.PageResult;

public class GoodsTypeDatabaseImpl {
	
	public void add(GoodsType goodsType) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
	
			String sql ="insert into mobileclassify(name) value(?) ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, goodsType.getName());
	
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}


	public GoodsType queryById(Integer id) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		GoodsType goodsType = null;
		try {
			connection = JdbcUtil.getConnection();
		
			String sql ="select * from mobileclassify where id=? ";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
		
			resultSet = prepareStatement.executeQuery();
			while(resultSet.next()) {
				String name = resultSet.getString("name");
				goodsType = new GoodsType(id, name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return goodsType;
	}

	public List<GoodsType> queryAll() {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		List<GoodsType> goodsTypeList = new ArrayList<>();
		try {
			connection = JdbcUtil.getConnection();
			String sql ="select * from mobileclassify";
			prepareStatement = connection.prepareStatement(sql);
			resultSet = prepareStatement.executeQuery();
			while(resultSet.next()) {
				Integer id = resultSet.getInt("id");
				String name = resultSet.getString("name");
			
				GoodsType goodsType = new GoodsType(id, name);
				goodsTypeList.add(goodsType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
		}
		return goodsTypeList;
	}


	public void update(GoodsType goodsType) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
			String sql ="update mobileclassify set name=? where id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, goodsType.getName());
			prepareStatement.setInt(2, goodsType.getGtId());
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, null);
			
		}
		
	}


	public void delete(Integer id) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtil.getConnection();
			String sql ="delete from mobileclassify where id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
			prepareStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, null);
		}
	}


	public PageResult queryByPages(Integer currentPage, Integer pageSize, String typeName) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet resultSet = null;
		PreparedStatement prepareStatement2 = null;
		ResultSet resultSet2 = null;
		PageResult pageResult = null;
		try {
			connection = JdbcUtil.getConnection();
			String whereSql = "";
			if(typeName!=null && typeName.trim().length()>0) {
				whereSql = "where name like '%"+typeName+"%' ";
			}

			String sql ="select * from mobileclassify "+whereSql+" limit ?,?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, (currentPage-1)*pageSize);
			prepareStatement.setInt(2, pageSize);
		
			resultSet = prepareStatement.executeQuery();
	
			List<GoodsType> goodsTypeList = new ArrayList<>();
			while(resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				
				GoodsType goodsType = new GoodsType(id, name);
				goodsTypeList.add(goodsType);
			}
			String sql2 ="select * from mobileclassify "+whereSql;
			prepareStatement2 = connection.prepareStatement(sql2);
			resultSet2 = prepareStatement2.executeQuery();
			Long totalRecord = 0L;
			while(resultSet2.next()) {
				totalRecord = totalRecord + 1;
			}
			pageResult = new PageResult(goodsTypeList, totalRecord, pageSize, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(connection, prepareStatement, resultSet);
			JdbcUtil.close(connection, prepareStatement2, resultSet2);
		}
		return pageResult;
	}


}
