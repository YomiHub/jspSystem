<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<%
String path = request.getContextPath();
String registerPath =path+"/pages/inputRegister.jsp";
String loginPath = path+"/pages/login.jsp";
String indexPath = path+"/index.jsp";
String classifyPath =  path+"/pages/lookMobile.jsp";
String ShoppingCarPath =  path+"/pages/lookShoppingCar.jsp";
String serchMobilePath =  path+"/pages/searchMobile.jsp";
String changePassPath = path+"/pages/changePassword.jsp";
String lookOrderFormPath = path+"/pages/lookOrderForm.jsp";
String changeRegisterPath = path+"/pages/changeRegisterInfo.jsp";
String exitPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleExit";

String handleRegisterPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleRegister";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/WEB-INF/tags/tophead.txt" %>
    <title>My JSP 'inputRegister.jsp' starting page</title>
    
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
	    <form action="<%=handleRegisterPath%>" method="post" name="form">
	    	<table>
	    		<tr>
	    			<td>用户名称:</td><td><input type="text" name="logname"></td>
	    			<td>用户密码：</td><td><input type="text" name="password"></td>
	    		</tr>
	    		<tr>
	    			<td>重复密码:</td><td><input type="text" name="again_password"></td>
	    			<td>联系电话：</td><td><input type="text" name="phone"></td>
	    		</tr>
	    		<tr>
	    			<td>邮寄地址:</td><td><input type="text" name="address"></td>
	    			<td>真实姓名：</td><td><input type="text" name="realname"></td>
	    		</tr>
	    		<tr>
	    			<td colspan="4" align="center"><input type="submit" name="g" value="提交"/></td>
	    			
	    		</tr>
	    	</table>
	    </form>
    </div>
    <div align="center">
    	<p>注册反馈：<jsp:getProperty name="userBean" property="backnews"/></p>
    	<table>
    		<tr>
    			<td>会员名称：</td>
    			<td><jsp:getProperty name="userBean" property="logname"/></td>
    		</tr>
    		<tr>
    			<td>联系电话：</td>
    			<td><jsp:getProperty name="userBean" property="phone"/></td>
    		</tr>
    		<tr>
    			<td>邮件地址：</td>
    			<td><jsp:getProperty name="userBean" property="address"/></td>
    		</tr>
    		<tr>
    			<td>真实姓名：</td>
    			<td><jsp:getProperty name="userBean" property="realname"/></td>
    		</tr>
    	</table>
    </div>
  </body>
</html>