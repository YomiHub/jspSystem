<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.data.DataByPage"%>
<%@ page import="com.sun.rowset.*"%>

<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<%
String path = request.getContextPath();
String registerPath =path+"/pages/inputRegister.jsp";
String loginPath = path+"/pages/login.jsp";
String indexPath = path+"/index.jsp";
String classifyPath =  path+"/pages/lookMobile.jsp";
String detailPath =  path+"/pages/showDetail.jsp";
String ShoppingCarPath =  path+"/pages/lookShoppingCar.jsp";
String serchMobilePath =  path+"/pages/searchMobile.jsp";
String lookOrderFormPath = path+"/pages/lookOrderForm.jsp";
String changePassPath = path+"/pages/changePassword.jsp";
String changeRegisterPath = path+"/pages/changeRegisterInfo.jsp";
String exitPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleExit";

String putGoodsPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/PutGoodsToCar";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/WEB-INF/tags/tophead.txt" %>
    <title>My JSP 'byPageShow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 	 <div align="center">
    <table border=2>
    	<tr>
    		<th>手机识别号</th>
    		<th>手机名称</th>
    		<th>手机制造商</th>
    		<th>手机价格</th>
    		<th>查看详情</th>
    		<th><font color=blue>添加到购物车</font></th>
    	</tr>
    	<jsp:setProperty name="dataBean" property="pageSize" param ="pageSize"/>
    	<jsp:setProperty name="dataBean" property="currentPage" param ="currentPage"/>
    	<%
    		CachedRowSetImpl rowSet = dataBean.getRowSet();
    		if(rowSet==null){
    			out.print("没有任何查询信息，无法浏览");
    			return;
    		}
    		
    		rowSet.last();
    		int totalRecord = rowSet.getRow();
    		out.println("全部记录数"+totalRecord);  //全部的记录数
    		
    		int pageSize = dataBean.getPageSize();  //显示的记录数
    		int totalPage = dataBean.getTotalPage();
    		if(totalRecord%pageSize==0){
    			totalPage = totalRecord/pageSize;  //总页数
    		}else{
    			totalPage = totalRecord/pageSize+1; 
    		}
    		
    		dataBean.setPageSize(pageSize);
    		dataBean.setTotalPage(totalPage);
    		if(totalPage>=1){
    			if(dataBean.getCurrentPage()<1){
    				dataBean.setCurrentPage(dataBean.getTotalPage());   //已超过最前一页时，翻到最后一页
    			};
    			
    			if(dataBean.getCurrentPage()<1){
    				dataBean.setCurrentPage(dataBean.getTotalPage());
    			};
    			
    			int index = (dataBean.getCurrentPage()-1)*pageSize+1;
    			rowSet.absolute(index);   //查询位置移动到当前页的起始记录位置
    			
    			boolean boo = true;
    			for(int i=1; i<=pageSize&&boo;i++){
    				String number = rowSet.getString(1);
    				String name = rowSet.getString(2);
    				String maker = rowSet.getString(3);
    				String price = rowSet.getString(4);
    				
    				String goods = "("+number+","+name+","+maker+","+price+")#"+price; //便于购物车计算价格，尾缀上“#价格值”
    				goods = goods.replaceAll("\\p{Blank}","");
    				String button = "<form action = '"+putGoodsPath+"' method='post'>"+
    								"<input type='hidden' name='java' value="+goods+">"+
    								"<input type='submit' value='放入购物车'></form>";
					String detail = "<form action = '"+detailPath+"' method='post'>"+
					"<input type='hidden' name='detail' value="+number+">"+
					"<input type='submit' value='查看细节'></form>";
					
					out.print("<tr>");
					out.print("<td>"+number+"</td>");
					out.print("<td>"+name+"</td>");
					out.print("<td>"+maker+"</td>");
					out.print("<td>"+price+"</td>");
					out.print("<td>"+detail+"</td>");
					out.print("<td>"+button+"</td>");
					out.print("</tr>");
					boo = rowSet.next();
    			}
    		}
    	 %>
    </table>
    <p>每页最多显示<jsp:getProperty name="dataBean" property="pageSize"/> 条信息</p>
    <p>当前显示第<font color=blue><jsp:getProperty name="dataBean" property="currentPage"/>页</font>
    </p>
    
    <table>
    	<tr>
    		<td>
    			<form action="" method=post>
    				<input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()-1%>"/>
    				<input type="submit" name="g" value="上一页"/>
    			</form>
    		</td>
    		<td>
    			<form action="" method=post>
    				<input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()+1%>"/>
    				<input type="submit" name="g" value="下一页"/>
    			</form>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<form action="" method=post>
    				每页显示<input type="text" name="pageSize" value=2 size=3/>
    				条记录<input type="submit" name="g" value="确定"/>
    			</form>
    			<form action="" method=post>
    				输入页码：<input type="text" name="currentPage" size=2>
    				<input type="submit" name="g" value="提交"/>
    			</form>
    		</td>
    	</tr>
    </table>
    </div>
  </body>
</html>
