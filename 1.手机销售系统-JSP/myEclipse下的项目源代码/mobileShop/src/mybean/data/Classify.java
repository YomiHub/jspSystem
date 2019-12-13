package mybean.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import org.utils.JdbcUtil;

public class Classify {
	String backnews,classifyName;
	int id;
	
	public Integer getGtId() {
		return id;
	}
	public void setGtId(Integer gtId) {
		this.id = gtId;
	}
	public String getName() {
		return classifyName;
	}
	public void setName(String name) {
		this.classifyName = name;
	}

	public String getBacknews() {
		return backnews;
	}

	public void setBacknews(String backnews) {
		this.backnews = backnews;
	}
	
	public void queryAll() {
		String backnews="测试";
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet rs = null;

		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			//String sql ="insert into user(logname,password,phone,address,realname) value(?,?,?,?,?) ";
			String sql ="select * from mobileclassify";
			prepareStatement = connection.prepareStatement(sql);
			
			//4.执行sql
			rs = prepareStatement.executeQuery();
			backnews = "<form action='/mobileShop/servlet/QueryRecord' method='post' class='classifyform'>"
					+ "<select name='classifyNum'>";
			//5.处理查询结果
			while(rs.next()) {
				int id=rs.getInt(1);
				String mobileCategory = rs.getString(2);
				backnews = backnews+"<option value='"+id+"'>"+mobileCategory+"</option>";
			}
			
			backnews = backnews + "</select>"
					+ "<input type='submit' value='提交' class='classifyinput'/>"
					+ "</form>";
			this.backnews = backnews;
			
//			response.sendRedirect(request.getContextPath()+"/pages/lookMobile.jsp");
		} catch (Exception e) {
			backnews=""+e.toString();
			this.backnews = backnews;
			
			e.printStackTrace();
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.close(connection, prepareStatement, rs);
		}
	    
	}
}
