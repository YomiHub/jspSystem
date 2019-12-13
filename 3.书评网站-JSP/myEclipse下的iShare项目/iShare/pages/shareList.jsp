<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%
    String path = request.getContextPath();
    int type = 0;
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
    String loginPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/QueryInfo?method=listAll";
    String ifLogin = "No";
	if(loginBean==null){
 		ifLogin = "No";
 		response.sendRedirect(loginPath);  //重定向到登录页
    	return;
 	}else{
 		boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
 		
 		if(b){
 			ifLogin = "No";
 			response.sendRedirect(loginPath);  //重定向到登录页
    		return;
 		}else{
 			ifLogin = "Yes";
 		}
 	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Index</title>
    
        <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/libs/cssLibs/bootstrap.min.css" rel="stylesheet">

     
    <script src="${pageContext.request.contextPath }/libs/jsLibs/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/libs/jsLibs/jquery.cookie.js"></script>
    
    <script src="${pageContext.request.contextPath }/libs/jsLibs/bootstrap.min.js"></script>
    
    
    <link rel="stylesheet" type="text/css" href="styles/public.css">
    
    <link rel="stylesheet" type="text/css" href="styles/publish/publish.css">
    <link rel="stylesheet" type="text/css" href="styles/index/index.css">
  </head>
  <style>
  .type {
		/*固定定位*/
		position: fixed;
		bottom: 200px;
		z-index:100;
		width: 100%;
		height: 40px;
		text-align: center;
		display:none;
	}
	.type p {
		min-width: 300px;
		max-width: 400px;
		margin: 0 auto;
		line-height: 40px;
		color: #fff;
		background-color: #C91623;

	}
	
	.listTable th{
		text-align:center;
	}
	
	.center{
		margin:0 auto;
	}
	
	
</style>
<body>
	 
   
	<div class="userInfo" style="display:none;">
		<p><jsp:getProperty name="loginBean" property="logname"/></p>
	</div>
    <div id="top">
        <ul class="topMenu">
         <% 
    		if(ifLogin=="No"){
    	%>
            <li><a target="_blank" href="${pageContext.request.contextPath }/pages/login.jsp">登录</a></li>
            <li><a target="_blank" href="${pageContext.request.contextPath }/pages/register.jsp">注册</a></li>
         <% 
	        }else{
	    %>
            <li><a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=7">欢迎您,<%=loginBean.getLogname()%></a></li>
            <li><a href="${pageContext.request.contextPath }/servlet/HandleExit">退出登录</a></li>
        <% 
	        }
	    %>
            
            <li class="no_dot"><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll">关于我们</a></li>
            <li class="no_dot" style="margin-left:4px">
                <a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll" class="space"><img src="images/logoMini.png"></a>
            </li>
        </ul>
    </div>
    <div id="header">
	    <% 
    		if(ifLogin=="No"){
    	%>
           <div class="shoping">
	        	<div class="logText">
		            <input type="text" id="logname" class="logInput" placeholder="账号" value="" />
		            <input type="password" id="logPass" class="logInput" placeholder="密码" value="" />
	            </div>
	            <a onclick="toLogin()" style="cursor:pointer">快捷登录</a>
	        </div>           
	    <% 
	        }else{
	    %>
	     	<div class="shoping">
	        	<div class="loginTip">
		             <p class="loginTipText"><span style="color:#FFFF00; font-size:18px">i 分享  </span> [发现有趣的人和事]</p>
		             <p class="loginTipText">希望今天的<span style="color:#FFFF00; font-size:18px">你</span>，也能够<span style="color:#FFFF00; font-size:18px">做你想做的事</span></p>
	            </div>
	        </div>   
	    <% 
	        }
	    %> 
		 
        
        <h1 title="Ecommerce WebSite">
            <a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll"><img src="images/iShare.png" alt="logo"></a>
        </h1>
        <div class="search">
            <form action="#">
                <input type="text" id="searchOne" class="searchText" value="" />
                <input type="submit" class="searchBtn" value="" />
            </form>
        </div>
    </div>
     <ul id="nav">
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll"><strong><span>首 页</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=0"><strong><span>文 学</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=1"><strong><span>流 行</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=2"><strong><span>文 化</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=3"><strong><span>生 活</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=4"><strong><span>经 管</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=5"><strong><span>科 技</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=6"><strong><span>日 记</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/pages/publishShare.jsp"><strong><span>发布分享</span></strong></a></li>
        <li><a target="_blank" href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=7"><strong><span>个人中心</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll"><strong><span>待扩展</span></strong></a></li>
      <!--    <li><a href="#"><strong><span>待 扩 展</span></strong></a></li> -->
    </ul>
    
    <div id="content" style="display:relactive; padding-bottom:30px; min-height:500px;">
       <div class="container-fluid" style="padding:20px;">
	       <div >
	            <%-- <div class="productsList">
	                <h2>SHARE</h2>
	                <ul class="clear">
	                	<c:forEach items="${ShareByInfoTypeResult.list}" var="item">
	                     <li>
	                         <a target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}"><img src="${item.infoPic}" alt="" /></a>
	                         <h3>${item.infoTitle}</h3>
	                         <p>类型: 
	                         	<c:if test="${item.type== 0}">
	                         		<span>文学</span>
	                         	</c:if>
	                         	<c:if test="${item.type== 1}">
	                         		<span>流行</span>
	                         	</c:if>
	                         	<c:if test="${item.type== 2}">
	                         		<span>文化</span>
	                         	</c:if>
	                         	<c:if test="${item.type== 3}">
	                         		<span>生活</span>
	                         	</c:if>
	                         </p>
	                         <p>点赞数：${item.support}</p>
	                     </li>
	                   </c:forEach>
	                </ul>
	              
	            </div> --%>
	       </div>
	       <table class="table listTable table-hover">
	       		<tr>
	       			<th>图书封面</th>
	       			<th>图书名称</th>
	       			<th>分享者</th>
	       			<th>描述</th>
	       			<th>点赞数</th>
	       			<th>查看详情</th>
	       		</tr>
	       		<c:forEach items="${ShareByInfoTypeResult.list}" var="item">
	       		<tr>
	       			<td style="text-align:center"><img style="width:200px;" src="${item.infoPic}" alt="" /></td>
	       			<td style="text-align:center">${item.infoTitle}</td>
	       			<td style="text-align:center">${item.infoAuthor}</td>
	       			<td style="width:240px">${item.infoDescribe}</td>
	       			<td style="text-align:center">${item.support}</td>
	       			<td><a target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}">查看细节</a></td>
	       		</tr>
	       		</c:forEach>
	       </table>
	       
	        <div class="page" style="text-align:center">
	                <ul class="pagination pagination-self center">
	          	<!--  上一页  -->
	          	<c:if test="${ShareByInfoTypeResult.currentPage == 1}">
	          		 <li>
	                    <span aria-hidden="true">前一页</span>
	               </li>
	          	</c:if>
	          	<c:if test="${ShareByInfoTypeResult.currentPage >1}">
	          		 <li>
	                   <a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${ShareByInfoTypeResult.currentPage-1}" aria-label="Previous">
	                       <span aria-hidden="true">前一页</span>
	                   </a>
	               </li>
	          	</c:if>
	             
	              <c:forEach begin="${ShareByInfoTypeResult.beginIndex }" end="${ShareByInfoTypeResult.endIndex }" varStatus="status">
	              	<c:if test="${status.index eq ShareByInfoTypeResult.currentPage}">
	              		<li><span style="color: black;">${status.index }</span></li>
	              	</c:if>
	              	<c:if test="${status.index ne ShareByInfoTypeResult.currentPage}">
	              		<li><a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${status.index}">${status.index }</a></li>
	              	</c:if>
	              </c:forEach>
	              
	              <!-- 下一页 -->
	              <c:if test="${ShareByInfoTypeResult.currentPage == ShareByInfoTypeResult.totalPages}">
	               <li>
	                     <span aria-hidden="true">后一页</span>
	               </li>
	              </c:if>
	              <c:if test="${ShareByInfoTypeResult.currentPage < ShareByInfoTypeResult.totalPages}">
	               <li>
	                   <a href="${pageContext.request.contextPath }/servlet/QueryInfoByType?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${ShareByInfoTypeResult.currentPage+1}" aria-label="Next">
	                       <span aria-hidden="true">后一页</span>
	                   </a>
	               </li>
	              </c:if>
	       			</ul>
	            </div>
	            
	       
	       
   	 </div>
   </div>
   
   <!-- 提示信息 -->
	<div class="type">
		<p>${ShareByInfoTypeResult.infoType}</p>
	</div> 
    <div id="footer">
        <div id="footerTop">
            <p class="icoFirst">i 分享  —— 发现有趣的人和事</p>
            <!-- <p class="icoSecond">We ship your orders anywhere!</p> -->
            <div class="search">
                <form action="#">
                    <input type="text" id="searchTwo" class="searchText" value="Search website" />
                    <input type="submit" class="searchBtn" value="" />
                </form>
            </div>
        </div>
	</div>
	
	

<script type="text/javascript">
	var infoTypeStr = $('.type p').text();
	console.log(infoTypeStr);
	
	if(infoTypeStr == 0){
		$("#nav li:eq(1)").addClass('navActive');
	}else if(infoTypeStr == 1){
		$("#nav li:eq(2)").addClass('navActive');
	}else if(infoTypeStr == 2){
		$("#nav li:eq(3)").addClass('navActive');
	}else if(infoTypeStr == 3){
		$("#nav li:eq(4)").addClass('navActive');
	}else if(infoTypeStr == 4){
		$("#nav li:eq(5)").addClass('navActive');
	}else if(infoTypeStr == 5){
		$("#nav li:eq(6)").addClass('navActive');
	}else if(infoTypeStr == 6){
		$("#nav li:eq(7)").addClass('navActive');
	}else if(infoTypeStr == 7){
		$("#nav li:eq(9)").addClass('navActive');
	}else if(infoTypeStr == 8){
		$("#nav li:eq(10)").addClass('navActive');
	}
</script>
</body>
</html>
