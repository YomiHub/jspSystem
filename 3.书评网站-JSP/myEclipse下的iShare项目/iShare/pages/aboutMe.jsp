<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%
    String path = request.getContextPath();
    String signature;
    String userLogImage;
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
 			signature = loginBean.getSignature();
 			userLogImage = loginBean.getUserLogImage();
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
	
	.lmlshare-member-main {
	    background:rgba(255, 255, 255, 0.4) ;
	}
	.lmlshare-member-bg {
	    background:url(images/bg.jpg) no-repeat top center;
		margin:0px auto 0 auto;
	}
	.lmlshare-member-content {
	    padding: 40px 0 0 0;
	    width: 1028px;
	    margin: auto;
	    min-height: 500px;
	}
	.lmlshare-member-header {
	    height: 400px;
	}
	.lmlshare-member-change-bg {
	    width: 42px;
	    height: 39px;
	    position: absolute;
	    right: -1px;
	    top: 50px;
	    background-image: url(../images/skin.png);
	    background-position: -6px -4px;
	    cursor: pointer;
	}
	.lmlshare-member-change-bg:hover {
	    background-position: -3px -78px;
	    width: 45px;
	    height: 44px;
	}
	.lmlshare-member-avatar {
	    background: rgba(255,255,255,0.3);
	    width: 100px;
	    height: 100px;
	    padding: 4px;
	    border-radius: 50%;
	    margin: 80px auto 0;
	    cursor: pointer;
	    position: relative;
	}
	.lmlshare-member-avatar i.lmlshare-verify {
	    bottom: 4px;
	    right: 8px;
	    width: 20px;
	    height: 20px;
	    background-size: 20px;
	}
	.lmlshare-member-avatar i.lmlshare-verify-b {
	    background-position: 0px -69px;
	}
	
	.lmlshare-member-avatar img {
	    width: 100px;
	    height: 100px;
	    border-radius: 50%;
		    -webkit-transition: .4s all ease-in-out;
		-moz-transition: .4s all ease-in-out;
		-o-transition: .4s all ease-in-out;
		-ms-transition: .4s all ease-in-out;
		transition: .4s all ease-in-out;
	}
	.lmlshare-member-avatar img:hover {
			-webkit-transform: rotate(360deg);
		-moz-transform: rotate(360deg);
		-o-transform: rotate(360deg);
		-ms-transform: rotate(360deg);
		transform: rotate(360deg);
	  
	}
	.lmlshare-member-username {
	    margin-top: 6px;
	    color: #fff;
	    text-align: center;
	    text-shadow: 0 0 4px rgba(0,0,0,0.5);  
	    vertical-align: text-bottom;
	}
	.lmlshare-member-username span {
	    vertical-align: text-bottom;
	}
	.lmlshare-member-username h1 {
	    font-size: 20px;
	    display: inline;
	    font-weight: normal;
	    margin-right: 2px;
	}
	.lmlshare-member-avatar span {
	    position: absolute;
	    bottom: 0;
	    left: 0;
	    height: 108px;
	    line-height: 116px;
	    text-align: center;
	    width: 100%;
	    background: rgba(74, 74, 74, 0.6);
	    color: #fff;
	    display: none;
	    border-radius: 100%;
	}
	.lmlshare-member-avatar:hover span {
	    display: block !important;
	}
	
	.lmlshare-member-desc {
	    text-align: center;
	    color: #fff;
	    margin-top: 10px;
	    line-height: 18px;
	    text-shadow: 0 0 4px rgba(0,0,0,0.5);
	}
	.lmlshare-member-follow-info {
	    text-align: center;
	    margin-top: 15px;
	}
	.lmlshare-member-follow-info span {
	    padding: 6px 20px;
	    background-color: #fafafa;
	    border-radius: 2px;
	    font-size: 15px;
	    border: 1px solid #2196F3;
	    background-color: #2196F3;
	    color: #FFFFFF;
	    cursor: pointer;
	    display: inline-block;
	    box-shadow: 0px 2px 1px rgba(0,0,0,.2);
	}
	.lmlshare-member-follow-info span:first-child {
	    margin-right:20px; 
	}
	.lmlshare-member-follow-info .follow.has{
	    background-color: #888;
	    border: 1px solid #888;
	}
	.lmlshare-member-follow-info .follow.no {
	    background-color: #fa7d3c;
	    border: 1px solid #fa7d3c;
	}
	.lmlshare-member-menu {
	    background-color: rgba(255,255,255,0.6);
	    clear: both;
	    position: relative;
	    margin-bottom: 0px;
	    padding: 3px 50px 0px;
	    text-align: center;
	}
	.lmlshare-member-menu li {
	    width: 100px;
	    text-align: center;
	    font-size: 16px;
	    cursor: pointer;
	    position: relative;
	    color: #555;
	    display: inline-block;
	    height: 45px;
	    line-height: 45px;
	}
	.lmlshare-member-menu li.on {
	    background-color: #f1f1f1;
	}
	.lmlshare-member-menu li.on:after {
	    position: absolute;
	    left: 0;
	    top: 0;
	    content: '';
	    width: 100%;
	    border-bottom-color: #fff;
	    box-sizing: border-box;
	    pointer-events: none;
	    border: none;
	    border-radius: 0;
	    height: 45px;
		border-bottom: 2px solid #eb7350;
	}
	.lmlshare-member-menu li:hover {
	    border-bottom: 2px solid #eb7350;
	    background-color: #f1f1f1;
		font-weight:bold;
	}
	
</style>
<body style="background:rgba(255, 255, 255, 0.4)">
	 
   
	<div class="userInfo" style="display:none;">
		<p><jsp:getProperty name="loginBean" property="logname"/></p>
	</div>
    <div style="width:100%;background:#000">
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
    </div>
   <div class="lmlshare-member-main" data="1">
	  <div class="lmlshare-member-bg">
		    <div class="lmlshare-member-content">
				<div class="lmlshare-member-header">
					<div class="lmlshare-member-avatar other">
						<img src="${pageContext.request.contextPath }/serviceImages/userImg.png<%=userLogImage%>" class="avatar" />
						<i class="lmlshare-verify lmlshare-verify-a" title="<jsp:getProperty name="loginBean" property="logname"/>"></i>
					</div>
					<div class="lmlshare-member-username">
						<h1><jsp:getProperty name="loginBean" property="logname"/></h1>
						<span class="lmlshare-mark lmlshare-girl">
							<i class="fa fa-mars"></i>
						</span>
					</div>
					<div class="lmlshare-member-desc"><jsp:getProperty name="loginBean" property="signature"/></div>
					<div class="lmlshare-member-follow-info">
						<a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=7" rel="nofollow">
							<span class="follow no opacity">
								<i class="lmlshare-icon"></i>+ 关注</span>
						</a>
						<span class="opacity">
							<i class="lmlshare-icon">&#xe612;</i> 点赞</span>
					</div>
				</div>
				<div class="lmlshare-member-menu clear" id="myNav">
					<li>
						<a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=7">我的分享<a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=8">我的收藏</a>
					</li>
				</div>
		 	 </div>
		 	 
 	 	</div>
 	</div>
    
    <div id="content" style="display:relactive; min-height:500px; background:rgba(255, 255, 255, 0.4); margin:0px auto 8px">
       <div class="container-fluid" style="padding: 0px 19px;">
        <div class="section" id="imgWordWall" style="background: rgb(25,25,25); padding: 38px 0px;">
            <style media="screen">
                .media-article-card {
                    font-size: 18px;
                    border-radius: 7px;
                }

                .media-article-card a {
                    color: #FFFFFF;
                    text-decoration: none;
                    border: none;
                }

                .media-article-card .article-title {
                    font-family: "pingFangSC-Light";
                    font-size: 22px;
                    font-size: 18px;
                }

                .media-article-card .meta-line {
                    font-size: 14px;
                    font-weight: 600;
                }

                .media-article-card .publish-date {
                    font-weight: 400;
                    color: rgba(255, 255, 255, 0.5);
                    display: inline-block;
                }

                ._sepline {
                    background: rgba(255, 255, 255, 0.4);
                    height: 1px;
                    margin: 15px 0;
                }

                .listSpace {
                    margin-bottom: 4.5rem !important
                }
            </style>
            <div class="container-fluid">
                <div class="">
                    <div class="row">
                        <c:forEach items="${ShareByInfoTypeResult.list}" var="item">
	                        <div class="row listBg">
	                            
	                            <div class="col-lg-12  col-md-12 col-sm-12 col-xs-12">
	                                <div class="row" id="playImg">
										<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 listSpace">
								            <div class="media-article-card listImgWrap">
								                <a class="d-block" style="width:100%" target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}">
								                    <img style="width:100%" src="${item.infoPic}" />
								                </a>
								            </div>
								        </div>
								        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 closeWrap listSpace">
								            <div class="media-article-card closeBottom">
								                <a  class="d-block" target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}">
								                    <div class="article-title" data-height-control-group="media-article-card-title">
								                        <p>${item.infoTitle}</p>
								                    </div>
								                    <div class="leadBox" style="font-size:17px; margin-top:30px; color: rgba(255, 255, 255, 0.5);">
								                       <p>${item.infoDescribe}</p>
								                    </div>
								                    <div class="meta-line mt-2">
								                        <time class="publish-date">点赞：${item.support}&nbsp;&nbsp;&nbsp;&nbsp;</time>
								                    </div>
								                </a>
								            </div>
								        </div>
	                                </div>
	                            </div>
	                            
	                        </div>
                        </c:forEach>
                        <div class="row" style="text-align: center">
                             <div class="page">
					                <ul class="pagination pagination-self">
					          	<!--  上一页  -->
					          	<c:if test="${ShareByInfoTypeResult.currentPage == 1}">
					          		 <li>
					                    <span aria-hidden="true">&laquo;</span>
					               </li>
					          	</c:if>
					          	<c:if test="${ShareByInfoTypeResult.currentPage >1}">
					          		 <li>
					                   <a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${ShareByInfoTypeResult.currentPage-1}" aria-label="Previous">
					                       <span aria-hidden="true">&laquo;</span>
					                   </a>
					               </li>
					          	</c:if>
					             
					              <c:forEach begin="${ShareByInfoTypeResult.beginIndex }" end="${ShareByInfoTypeResult.endIndex }" varStatus="status">
					              	<c:if test="${status.index eq ShareByInfoTypeResult.currentPage}">
					              		<li><span style="color: black;">${status.index }</span></li>
					              	</c:if>
					              	<c:if test="${status.index ne ShareByInfoTypeResult.currentPage}">
					              		<li><a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${status.index}">${status.index }</a></li>
					              	</c:if>
					              </c:forEach>
					              
					              <!-- 下一页 -->
					              <c:if test="${ShareByInfoTypeResult.currentPage == ShareByInfoTypeResult.totalPages}">
					               <li>
					                     <span aria-hidden="true">&raquo;</span>
					               </li>
					              </c:if>
					              <c:if test="${ShareByInfoTypeResult.currentPage < ShareByInfoTypeResult.totalPages}">
					               <li>
					                   <a href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=${ShareByInfoTypeResult.infoType}&currentPage=${ShareByInfoTypeResult.currentPage+1}" aria-label="Next">
					                       <span aria-hidden="true">&raquo;</span>
					                   </a>
					               </li>
					              </c:if>
					       			</ul>
					       </div>
                        </div>
                    </div>
                </div>
            </div>
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
		
		if(infoTypeStr == 7){
			$("#myNav li:eq(0)").addClass('on');
		}else if(infoTypeStr == 8){
			$("#myNav li:eq(1)").addClass('on');
		}
	</script>
	</body>
</html>

