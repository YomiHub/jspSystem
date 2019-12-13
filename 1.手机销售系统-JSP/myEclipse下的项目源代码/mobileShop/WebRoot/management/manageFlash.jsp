<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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

String bannerSrc = path+"/images/index.jpg";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首页</title>
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
  	<center>
  		<h1>欢迎光临“智多星”智能手机后台管理系统</h1>
  		<img src="<%=bannerSrc%>" width="70%"></img>
  	</center>
  </body>
</html>