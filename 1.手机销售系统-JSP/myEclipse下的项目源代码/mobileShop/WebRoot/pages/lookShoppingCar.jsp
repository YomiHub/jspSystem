<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/> 
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

String deleteServletPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleDelete";
String buyServletPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleBuyGoods";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <%@ include file="/WEB-INF/tags/tophead.txt" %>
    <title>My JSP 'lookShooppingCar.jsp' starting page</title>
    
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
    <div align=center>
    	<% 
    	if(loginBean==null){
    		response.sendRedirect(loginPath);  //重定向到登录页
    	}else{
    		boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
    		
    		if(b){
    			response.sendRedirect(loginPath);
    		}
    	}
    	
    	LinkedList<String> car = loginBean.getCar();
    	if(car == null){
    		out.print("<h2>购物车没有物品</h2>");
    	}else{
    		Iterator<String> iterator = car.iterator();   //迭代器，调用集合的方法iterator获取出，Iteator接口实现类的对象
    		StringBuffer buyGoods = new StringBuffer();
    		int n=0;
    		double priceSum = 0;
    		out.print("购物车中的物品：<table border=2>");
    		while(iterator.hasNext()){
    			String goods = iterator.next();
    			String showGoods = "";
    			n++;
    			//购物车物品的后缀是“#价格数字”
    			int index =  goods.lastIndexOf("#");
    			if(index!=-1){
    				priceSum += Double.parseDouble(goods.substring(index+1));
    				showGoods = goods.substring(0,index);
    			}
    			
    			buyGoods.append(n+":"+showGoods);
    			String del ="<form action = '"+deleteServletPath+"' method='post'>"+
						"<input type='hidden' name='delete' value="+goods+">"+
						"<input type='submit' value='删除'></form>";
						
				out.print("<tr><td>"+showGoods+"</td>");
				out.print("<td>"+del+"</td></tr>");
    		}
    		
    		out.print("</table>");
    		String orderForm = "<form action = '"+buyServletPath+"' method='post'>"+
    								"<input type='hidden' name='buy' value="+buyGoods+">"+
    								"<input type='hidden' name='price' value="+priceSum+">"+
    								"<input type='submit' value='生成订单'></form>";
    	    out.print(orderForm);
    	}
    	%>
    </div>
  </body>
</html>
