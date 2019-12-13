package mybean.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.utils.JdbcUtil;

public class Register {
	String logname="",phone="",address="",realname="",backnews="";
	
	
	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getBacknews() {
		return backnews;
	}

	public void setBacknews(String backnews) {
		this.backnews = backnews;
	}
	
	   //处理中文字符串
    public String handleString(String s) {
    	try {
    		byte bb[]=s.getBytes("ISO8859-1");
    		s=new String(bb,"UTF-8");
    	}catch(Exception e){}
    	
    	return s;
    }
	
	public void queryByLogname(String name) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet rs = null;
		
		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			String sql ="select * from user where logname = '"+name+"'";
			prepareStatement = connection.prepareStatement(sql);
			
			//4.执行sql
			rs = prepareStatement.executeQuery();
			
			
			//5.处理查询结果
			while(rs.next()) {
				String logname = rs.getString("logname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String realname = rs.getString("realname");
				this.setLogname(logname);
				this.setPhone(phone);
				this.setAddress(address);
				this.setRealname(realname);
			}
		} catch (Exception e) {		
			e.printStackTrace();
		}finally {
			//5.释放资源 connection prepareStatement
			JdbcUtil.close(connection, prepareStatement, rs);
		}
	    
	}
}
