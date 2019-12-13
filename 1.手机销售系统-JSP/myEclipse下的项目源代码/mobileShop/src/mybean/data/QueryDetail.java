package mybean.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.utils.JdbcUtil;

public class QueryDetail {
	String backnews;
	public String getBacknews() {
		return backnews;
	}
	public void setBacknews(String backnews) {
		this.backnews = backnews;
	}
	
	public void queryById(String mobileID,String putGoodsPath,String picBasePath) {
		String detail;
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		ResultSet rs = null;
		
		
    	detail = "<th>产品号"+mobileID;
    	if(mobileID==null){
    		detail = "没有产品号，无法查看细节";
    		return;
    	}

		try {
			connection = JdbcUtil.getConnection();
			//3.获取statement
			//String sql ="insert into user(logname,password,phone,address,realname) value(?,?,?,?,?) ";
			String sql ="select * from mobileForm where mobile_version = '"+mobileID+"'";
			prepareStatement = connection.prepareStatement(sql);
			
			//4.执行sql
			rs = prepareStatement.executeQuery();
			detail = detail+"<table border=2>"
					+ "<tr>"
					+ "<th>产品号</th><th>名称</th><th>制造商</th><th>价格</th><th><font color=blue>放入购物车<font></th>"
					+ "</tr>";
			
			String picture = picBasePath+"welcome.jpg";
			String detailMess = "";
			
			//5.处理查询结果
			while(rs.next()) {
				String number = rs.getString(1);
				String name = rs.getString(2);
				String maker = rs.getString(3);
				String price = rs.getString(4);
				detailMess = rs.getString(5);
				picture = picBasePath+"/"+rs.getString(6);
				
				String goods = "("+number+","+name+","+maker+","+price+")#"+price; //便于购物车计算价格，尾缀上“#价格值”
				goods = goods.replaceAll("\\p{Blank}","");
				String button = "<form action = '"+putGoodsPath+"' method='post'>"+
						"<input type='hidden' name='java' value="+goods+">"+
						"<input type='submit' value='放入购物车'></form>";
				detail = detail+"<tr><td>"+number+"</td>"
						+ "<td>"+name+"</td>"
								+ "<td>"+maker+"</td>"
										+ "<td>"+price+"</td>"
												+ "<td>"+button+"</td></tr>";
			}
			
			detail = detail +"</table>产品详情：<br>"
					+ "<div align=center>"+detailMess+"</div>"
							+ "<img src='"+picture+"' width=260></img>";			
			
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
