<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String registerPath =path+"/pages/inputRegister.jsp";
String loginPath = path+"/pages/login.jsp";
String indexPath = path+"/index.jsp";
String classifyPath =  path+"/pages/lookMobile.jsp";
String ShoppingCarPath =  path+"/pages/lookShoppingCar.jsp";
String serchMobilePath =  path+"/pages/searchMobile.jsp";
String lookOrderFormPath = path+"/pages/lookOrderForm.jsp";
String changePassPath = path+"/pages/changePassword.jsp";
String changeRegisterPath = path+"/pages/changeRegisterInfo.jsp";
String exitPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleExit";

String searchByConditioPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/searchByCondition";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'searchMobile.jsp' starting page</title>
    <%@ include file="/WEB-INF/tags/tophead.txt" %>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   	<div align=center>
   		<p>查询时可以输入手机的版本号或手机名称及价格</p>
   		<p>手机名称支持模糊查询</p>
   		<p>输入价格是在两个价格之间时，格式是：价格1-价格2如：3987-8976</p>
   		<form action = "<%= searchByConditioPath %>">
   			<BR>输入查询信息：<input type=text name="searchMess"><br>
   			<input type=radio name ="radio" value = "mobile_version">手机版本号
   			<input type=radio name ="radio" value = "mobile_name">手机名称提交
   			<input type=radio name ="radio" value = "mobile_price">手机价格
   			<br><input type=submit name="g" value="提交">
   		</form>
   	</div>
  </body>
</html>
