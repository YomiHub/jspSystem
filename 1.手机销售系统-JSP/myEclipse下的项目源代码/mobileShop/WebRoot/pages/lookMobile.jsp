<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.utils.JdbcUtil"%>
<jsp:useBean id="classifyBean" class="mybean.data.Classify" scope="session"/> 
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

String cssPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/assets/css/login.css";

String handleRegisterPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleRegister";
String queryRecordPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/QueryRecord";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'lookMobile.jsp' starting page</title>
     <%@ include file="/WEB-INF/tags/tophead.txt" %>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=cssPath%>">
  </head>
  <body>
  <%classifyBean.queryAll();%>
   	<div align="center">
		<jsp:getProperty name="classifyBean" property="backnews"/>
   	</div>
  </body>
</html>
