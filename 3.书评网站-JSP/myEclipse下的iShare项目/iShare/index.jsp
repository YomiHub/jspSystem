<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- （JSP标准标签库JSTL）是一个JSP标签集合，JSTL支持通用的、结构化的任务，比如迭代，条件判断，XML文档操作，国际化标签，SQL标签。 除了这些，它还提供了一个框架来使用集成JSTL的自定义标签 -->
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

 <!--  2019-5-28 BY 何燕梅 -->
<%
    String ifLogin = "No";
	if(loginBean==null){
 		ifLogin = "No";
 	}else{
 		boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
 		
 		if(b){
 			ifLogin = "Faile";
 		}else{
 			ifLogin = "Yes";
 		}
 	}
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <script src="${pageContext.request.contextPath }/libs/jsLibs/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="styles/public.css">
    <link rel="stylesheet" type="text/css" href="styles/index/index.css">
  </head>
  <style>
  .tips {
		/*固定定位*/
		position: fixed;
		top: 0;
		width: 100%;
		height: 40px;
		text-align: center;
		display:none;
	}
	.tips p {
		min-width: 300px;
		max-width: 400px;
		margin: 0 auto;
		line-height: 40px;
		color: #fff;
		background-color: #C91623;

	}
</style>
<body>
	<!-- 提示信息 -->
	<div class="tips">
		<p><jsp:getProperty name="loginBean" property="backnews"/></p>
	</div>
	
    <div id="top">
        <ul class="topMenu">
        
         <% 
    		if(ifLogin!="Yes"){
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
       <!--  <ul class="topBar">
            <li class="phone">131 41414 820</li>
            <li class="help"><a href="">Live Help</a></li>
            <li>
                <a href="" class="space"><img src="images/top_img1.gif"></a>
            </li>
            <li>
                <a href=""><img src="images/top_img2.gif"></a>
            </li>
        </ul> -->
    </div>
    <div id="header">
	    <% 
    		if(ifLogin!="Yes"){
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
                <input type="text" id="searchOne" class="searchText" value="Search website" />
                <input type="submit" class="searchBtn" value="" />
            </form>
        </div>
    </div>
    <ul id="nav">
        <li class="navActive"><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll"><strong><span>首 页</span></strong></a></li>
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
    <div id="content">
        <div class="contentTop">
            <div class="contentBottom">
                <div id="contentAd">
                    <a class="prev" href="javascript:;" id=""></a>
                    <a class="next" href="javascript:;" id=""></a>
                    <span class="prevBg"></span>
                    <span class="nextBg"></span>
                    <ul id="imgUl">
                      <!--   查询最近20条记录中点赞数排前三的内容 -->
                    	<c:forEach items="${bannerResult.list}" var="item">
	                        <li>
	                            <a target="_blank" style="width:100%" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}"><img style="width:100%" src="${item.infoPic}" /></a>
	                        </li>
                        </c:forEach>

                    </ul>
                    <div class="tipBack"></div>
                    
                    <ul id="tipUl">
                    	<c:forEach items="${bannerResult.list}" var="item">
	                        <li>
		                        <div class="tipStyle">
		                            <h2>${item.infoTitle}</h2>
		                   			<p>${item.infoDescribe}</p>
		                        </div>
	                        </li>
                    
						</c:forEach>
                    </ul>
                   
                </div>


                <div id="main" class="clear">
                    <div id="mainLeft">
                        <div class="browseCmenu">
                            <h2><strong><span>热门排行</span></strong></h2>
                            <div class="BCList BCList1">
                                <ul>
                                	<c:forEach items="${hotSupportResult.list}" var="item">
                                   		 <li><a target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}">${item.infoTitle}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        
                      
						<div class="browseCmenu">
                            <h2><strong><span>热门收藏</span></strong></h2>
                            <div class="BCList BCList1">
                                <ul>
                                	<c:forEach items="${hotFocusResult.list}" var="item">
                                   		 <li><a target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}">${item.infoTitle}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="mainRight">
                        <div class="rightTop">
                            
							<div class="panel-body">
							 <!--search-->
                        
					            <div class="">
					            <div class="row">
		                            <div class="col-lg-4 offset-lg-8 col-md-4 offset-lg-8 col-sm-10 col-xs-10 pull-right">
		                                <div class="input-group searchWrap">
		                                    <input type="text" id="keyWord" placeholder="search"  class="form-control searchInput" style="border-right:1px solid transparent">
		                                    <span class="input-group-addon btn searchW" id="searchBtn" onclick="queryByPages()"></span>
		                                </div>
		                            </div>
		                        </div>
					                
					               
					            </div>
					        </div>	
                        </div>

                        <div class="productsList">
                            <h2>SHARE</h2>
                            <ul class="clear">
                            	<c:forEach items="${pageResult.list}" var="item">
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
	                                    	<c:if test="${item.type== 4}">
	                                    		<span>经管</span>
	                                    	</c:if>
	                                    	<c:if test="${item.type== 5}">
	                                    		<span>科技</span>
	                                    	</c:if>
	                                    	<c:if test="${item.type== 6}">
	                                    		<span>日记</span>
	                                    	</c:if>
	                                    </p>
	                                    <p>点赞数：${item.support}</p>
	                                </li>
                               </c:forEach>
                            </ul>
                          
                        </div>

                        <div class="page">
                            <ul class="pagination pagination-self">
		                    	<!--  上一页  -->
		                    	<c:if test="${pageResult.currentPage == 1}">
		                    		 <li>
			                             <span aria-hidden="true">&laquo;</span>
			                        </li>
		                    	</c:if>
		                    	<c:if test="${pageResult.currentPage >1}">
		                    		 <li>
			                            <a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll&currentPage=${pageResult.currentPage-1}" aria-label="Previous">
			                                <span aria-hidden="true">&laquo;</span>
			                            </a>
			                        </li>
		                    	</c:if>
		                       
		                        <c:forEach begin="${pageResult.beginIndex }" end="${pageResult.endIndex }" varStatus="status">
		                        	<c:if test="${status.index eq pageResult.currentPage}">
		                        		<li><span style="color: black;">${status.index }</span></li>
		                        	</c:if>
		                        	<c:if test="${status.index ne pageResult.currentPage}">
		                        		<li><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll&currentPage=${status.index}">${status.index }</a></li>
		                        	</c:if>
		                        </c:forEach>
		                        
		                        <!-- 下一页 -->
		                        <c:if test="${pageResult.currentPage == pageResult.totalPages}">
			                        <li>
			                              <span aria-hidden="true">&raquo;</span>
			                        </li>
		                        </c:if>
		                        <c:if test="${pageResult.currentPage < pageResult.totalPages}">
			                        <li>
			                            <a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll&currentPage=${pageResult.currentPage+1}" aria-label="Next">
			                                <span aria-hidden="true">&raquo;</span>
			                            </a>
			                        </li>
		                        </c:if>
                   			 </ul>
                        </div>
					    <%
					      if(ifLogin=="Yes"){
					    %>
			
	                        <div class="scrollList">
	                            <h2>最近收藏</h2>
	                            <div class="listWrapContent">
	                                <div class="listWrapLeft">
	                                    <div id="listWrapRight">
	                                        <a class="prev" href="javascript:;"></a>
	                                        <a class="next" href="javascript:;"></a>
	                                        <div class="wrapBox">
	                                            <ul>
	                                           		<c:forEach items="${myFocusResult.list}" var="item">
		                                                <li>
		                                                    <a target="_blank" href="${pageContext.request.contextPath}/servlet/QueryInfo?method=listDetail&infoId=${item.infoId}"><img src="${item.infoPic}" alt="" /></a>
		                                                    <p>${item.infoTitle}</p>
		                                                </li>
	                                                </c:forEach>
	                                               
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                     
                        <%
                           }
                         %>
                    </div>
                </div>
            </div>
        </div>

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
	function queryByPages(){
		//设置当前浏览器的地址
		var keyWord = document.getElementById("keyWord").value;
		document.location.href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll&currentPage=1&pageSize=12&keyWord="+keyWord;
	}
	
	function toLogin(){
	    var logname = document.getElementById("logname").value;
	    var password = document.getElementById("logPass").value;
		document.location.href="${pageContext.request.contextPath }/servlet/HandleLogin?logname="+logname+"&password="+password;
	}
	
	
	var tip = $('.tips p').text();
	if(tip.length==0){
		$('.tips p').html('登录会有更多惊喜！');
		$('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
	}else{
		$('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
    }
	
           
</script>
</body>
<script src="js/index/index.js"></script>
</html>
