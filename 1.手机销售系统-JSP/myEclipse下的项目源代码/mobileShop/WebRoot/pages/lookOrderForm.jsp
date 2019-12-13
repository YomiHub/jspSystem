<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<jsp:useBean id="orderBean" class="mybean.data.QueryOrderForm" scope="session"/>  
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

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <%@ include file="/WEB-INF/tags/tophead.txt" %>
    <title>My JSP 'lookOrderForm.jsp' starting page</title>
    
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
    <%
    	if(loginBean==null){
    		response.sendRedirect(loginPath);  //重定向到登录页
    	}else{
    		boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
    		
    		if(b){
    			response.sendRedirect(loginPath);
    		}
    	}

    	orderBean.queryOrder(loginBean.getLogname());
     %>
     <div align=center>
     <jsp:getProperty name="orderBean" property="backnews"/>
     </div>
  </body>
</html>
