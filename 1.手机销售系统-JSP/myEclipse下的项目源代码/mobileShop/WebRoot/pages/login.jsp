<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<%
String path = request.getContextPath();
String registerPath =path+"/pages/inputRegister.jsp";
String loginPath = path+"/pages/login.jsp";
String indexPath = path+"/index.jsp";
String classifyPath =  path+"/pages/lookMobile.jsp";
String ShoppingCarPath =  path+"/pages/lookShoppingCar.jsp";
String serchMobilePath =  path+"/pages/searchMobile.jsp";
String changePassPath = path+"/pages/changePassword.jsp";
String changeRegisterPath = path+"/pages/changeRegisterInfo.jsp";
String lookOrderFormPath = path+"/pages/lookOrderForm.jsp";String exitPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleExit";
String cssPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/assets/css/login.css";
String handleLoginPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleLogin";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/WEB-INF/tags/tophead.txt" %>
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%-- <link rel="stylesheet" type="text/css" href="<%=cssPath%>"> --%>
  </head>
  
  <body>
  	<div align="center">
  	    <form action="<%=handleLoginPath%>" Method="post" name="form">
		  	<table border=2>
	  		    <tr><th colspan="4" >登录</th></tr>
		  		<tr>
	    			<td>用户名称:</td><td><input type="text" name="logname"></td>
	    			<td>用户名密码：</td><td><input type="text" name="password"></td>
	    		</tr>
		    	<tr>
	    			<td colspan="4" align="center"><input type="submit" name="l" value="登录"/></td>
	    		</tr>
		  	</table>
	  	</form>
  	</div> 
  	<div align="center">
  		<p>登录反馈：<jsp:getProperty name="loginBean" property="backnews"/></p>
  		<br>登录名称：<jsp:getProperty name="loginBean" property="logname"/>
  	</div>
  </body>
</html>
