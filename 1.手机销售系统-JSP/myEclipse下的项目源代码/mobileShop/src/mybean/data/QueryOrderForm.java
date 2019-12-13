package mybean.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.utils.JdbcUtil;

public class QueryOrderForm {
	String backnews;
	public String getBacknews() {
		return backnews;
	}
	public void setBacknews(String backnews) {
		this.backnews = backnews;
	}
	
	public void queryOrder(String logname) {
		String detail = "";
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet rs = null;

		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			//String sql ="insert into user(logname,password,phone,address,realname) value(?,?,?,?,?) ";
			String sql ="select id,mess,sum from orderform where logname = '"+logname+"'";
			prepareStatement = connection.prepareStatement(sql);
			
			//4.执行sql
			rs = prepareStatement.executeQuery();
			detail = detail+"<table border=2>"
					+ "<tr>"
					+ "<th width=100>订单号</th><th width=100>信息</th><th width=100>价格</th>"
					+ "</tr>";
			
			//5.处理查询结果
			while(rs.next()) {
				String id = rs.getString(1);
				String mess = rs.getString(2);
				String sum = rs.getString(3);

				detail = detail+"<tr><td>"+id+"</td>"
						+ "<td>"+mess+"</td>"
								+ "<td>"+sum+"</td></tr>";
			}
			
			detail = detail +"</table>";			
			
			this.backnews = detail;

		} catch (Exception e) {
			detail=""+e.toString();
			this.backnews = detail;
			
			e.printStackTrace();
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.close(connection, prepareStatement, rs);
		}
	    
	}
}
