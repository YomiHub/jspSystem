<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%
    String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String logName="";
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
 			logName = loginBean.getLogname();
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
    <script src="${pageContext.request.contextPath }/libs/jsLibs/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="styles/public.css">
    <link rel="stylesheet" type="text/css" href="styles/index/index.css">
  </head>
  <style>
  .tips {
		/*固定定位*/
		position: fixed;
		bottom: 200px;
		z-index:100;
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
	
	.commentBtn{
	    background: url(images/comment_icon.png) no-repeat center;
        background-size: 100%;
	}
	
	.commentdetail li{
		list-style-type:none;
		margin-top:5px;
	    padding:2px;
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
    
    </div>

   
	<div class="section" style="background: rgb(255,255,255); color:rgb(0,0,0); padding-bottom:30px;">
        <div class="container">
       	 <div class="row" style="padding-bottom: 40px;">
        	   <div class="col-lg-1 col-md-1 col-sm-1 col-1"></div>
               <div class="col-lg-10  col-md-10  col-sm-10  col-10 offset-1">
		             <div id="contentAd">
		                  <ul id="imgUl">
		                   	<c:forEach items="${infoDetailResult.list}" var="item">
		                        <li style="opacity:1;filter:alpha=(opacity=100)">
		                            <a target="_blank" href="${item.infoPic}" style="width:100%"><img src="${item.infoPic}" style="width:100%"/></a>
		                        </li>
		                       </c:forEach>
		
		                  </ul>         
		              </div>
		              <c:forEach items="${infoDetailResult.list}" var="item">
		                 <div class="row" style="margin-top:32px; text-align: left; margin-bottom: 10px;">
		                 	 
		                     <div class="col-lg-6 col-md-12 col-sm-12" id="titleWrap">
		                         <h2 class="text-center" style="font-size:29px; float: left;text-align: left;">${item.infoTitle}</h2>
		                     </div>
		                     
		                     <div class="col-lg-6 col-md-12 col-sm-12" id="timeWrap">
		                         <p style="text-align:right; line-height:88px; font-size: 15px;">作者：${item.infoAuthor}</p>
		                     </div>
		                    
		                 </div>
		                
		                 
		                 <div class="row">
		                     <div class="col-lg-12 col-md-12 col-sm-12 col-12">
		                         <div id="leadWrap">
		                             <p style="padding: 20px 0 10px 0;line-height:40px;">
		                             	  ${item.infoDescribe}
		                             </p>
		                         </div>
		                     </div>
		                 </div>
		                 
						 <div class="row blankLine" style="padding-bottom: 20px;">
		                     <img src="images/info_detail/node_bar_1@2x.png" style="height: 2px; width: 100%;">
		                 </div>
		                 <div class="row">
		                     <div class="col-lg-12 col-md-12 col-sm-12 col-12">
		                         <div id="essayContent">
		                         		${item.infoDetail}
		                         </div>
		                     </div>
		                 </div>
		               </c:forEach>
                  </div>
       	     </div>
       	     
       	     
              <c:forEach items="${infoDetailResult.list}" var="item">
               <div class="row" style="margin-bottom:20px">
               	 <div class="col-lg-1 col-md-1 col-sm-1 col-1"></div>
       	     	 <div class="col-lg-11 col-md-11 col-sm-11 col-11 offset-1" style="margin-right:10px">
       	     	 
	       	    	<div class="col-lg-2 col-md-2 col-sm-2 col-2">
	       	    		<div class="col-lg-4 col-md-4 col-sm-4 col-4 pull-right">
		       	    		<li class="no_dot" style="width:100%;">
				                <a onclick="addSupport()" class="space" style="cursor:pointer;"><span id="supportInfoId" style="display:none">${item.infoId}</span><img id="addSupportIcon" src="images/info_detail/no_add_support.png"></a>
				            </li>
			            </div>
	       	    	</div> 
	       	    	
	       	    	
	       	    	
	       	    	<div class="col-lg-9 col-md-9 col-sm-9 col-9">
	       	    		<div class="col-lg-2 col-md-2 col-sm-2 col-2 pull-right">
	       	    	
	       	    		<c:if test="${item.infoAuthor==loginBean.getLogname()}">
		       	    		<li class="no_dot" style="width:100%;">
				                <a  style="cursor:pointer;" onclick="deleteInfo()" class="space"><img src="images/info_detail/delete_icon.png"></a>
				            </li>
				        </c:if>
			            </div>
	       	    	</div> 
	       	   
	       	    	
	       	    	<div class="col-lg-1 col-md-1 col-sm-1 col-1">
	       	    		<div class="col-lg-12 col-md-12 col-sm-12 col-12 pull-right">
		       	    		<li class="no_dot" style="width:100%;">
				                <a onclick="changeFocus()" class="space" style="cursor:pointer;"></span><img id="addFocusIcon" src="images/info_detail/no_add_focus.png"></a>
				            </li>
			            </div>
	       	    	</div> 
	       	    </div>
	       	    	
               </div>
              </c:forEach>
              <div class="row">
       	    	<div class="col-lg-1 col-md-1 col-sm-1 col-1"></div>
       	     	<div class="col-lg-11 col-md-11 col-sm-11  col-11 offset-1" style="margin-right:10px">
	       	     	
	                <div class="col-lg-8 offset-lg-4 col-md-8 offset-lg-4 col-sm-2 col-xs-2 pull-right" >
	                    <div class="input-group searchWrap">
	                        <input type="text" id="commment" placeholder="评论"  class="form-control searchInput" style="border-right:1px solid transparent">
	                        <span class="input-group-addon btn commentBtn" id="searchBtn" onclick="addComment()" ></span>
	                    </div>
	                </div>
                </div>
              </div>
               <div class="row">
       	    	<div class="col-lg-1 col-md-1 col-sm-1 col-1"></div>
       	     	<div class="col-lg-10 col-md-10 col-sm-10  col-10 offset-1" style="margin-right:10px">
	       	     	<div class="col-lg-12 col-md-12 col-sm-12  col-12 pull-right" style="margin-right:10px">
	                 <div class="commentdetail" style="margin-top:16px">
	                  	<c:forEach items="${commentResult.list}" var="item">
	                
		                 <li class="row f-clear" style="border-top:4px solid #ccc; margin-top:16px">
						      <div class="head col-xs-1 col-sm-1 col-md-1 offset-1" display:"inline-block">
						         <img src="serviceImages/userImg.png" style="width:30px; height:30px; border-radius=50%"/>
						      </div>
						      <div class="content col-xs-9 col-sm-9 col-md-9">
						         <div class="f-clear">
						            <span class="username f-float-left" style="color:blue">${item.commentUser}</span>
						         </div>
						         <span class="parent-content">${item.commentDetail}</span>
						       </div>
						       <div class="respone-box col-xs-2 col-sm-2 col-md-2">
						       <c:if test="${item.commentUser==loginBean.getLogname()}">
						         <a href="${pageContext.request.contextPath }/servlet/DeleteComment?commentId=${item.commentId}&infoId=${item.commentInfo}" class="f-show deletecomment" data-id="' +${item.commentId}+ '">[删除]</a>
						       </c:if>
						       </div>
						       
						  </li>
	           			 </c:forEach>
	                 </div>
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
		
		/* var tip = $('.tips p').text();
		if(tip.length==0){
			$('.tips p').html('请先登录！');
			$('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
		}else{
			$('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
		
	    }  */   
	    
	    var infoId = $('#supportInfoId').text();
	    var username = '${loginBean.getLogname()}';
		var addSupportUrl="${pageContext.request.contextPath }/servlet/AddSupport?infoId="+infoId;
		var ifAddFocus = "${pageContext.request.contextPath }/servlet/IfAddFocus?infoId="+infoId+"&username="+username;
		var addFocusUrl="${pageContext.request.contextPath }/servlet/AddFocus?infoId="+infoId+"&username="+username;
		
		var removeFocusUrl="${pageContext.request.contextPath }/servlet/RemoveFocus?infoId="+infoId+"&username="+username;
		var deleteInfoUrl="${pageContext.request.contextPath }/servlet/DeleteInfo?infoId="+infoId;
		
		var addCommentUrl="${pageContext.request.contextPath }/servlet/AddComment?infoId="+infoId+"&username="+username+"&commentDetail=";
		
		var focus = false;
		
	    $.ajax({
            url:ifAddFocus,
            type: "GET",
            dataType: "json",
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (result) {
                console.log(result.focusId);
                focus = result.isFocus;
                if(result.isFocus){
                  $('#addFocusIcon').attr("src", 'images/info_detail/add_focus.png');
                }
                 /* $('.tips p').html(result.responseText);
                
                 $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
                
            },
            error:function(result){    //实际上error已经请求成功
             	 console.log(result);
                /*  $('.tips p').html(result.responseText);
                  $('#addSupportIcon').attr("src", 'images/info_detail/add_support.png');
                 $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
            }
        });
            
	    function addSupport() {
			//设置当前浏览器的地址
			
			$.ajax({
                url: addSupportUrl,
                type: "GET",
                dataType: "json",
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (result) {
                    console.log(result);
                     $('#addSupportIcon').attr("src", 'images/info_detail/add_support.png');
                     $('.tips p').html(result.responseText);
                     $('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
                    
                },
                error:function(result){    //实际上error已经请求成功,因为后台返回的不是Json
                 	 console.log(result);
                    
                     $('#addSupportIcon').attr("src", 'images/info_detail/add_support.png');
                     /* $('.tips p').html(result.responseText);
                     $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
                }
            });
			
		}
		
		 function deleteInfo() {
			//设置当前浏览器的地址
			var base='http://localhost:8080/iShare/';
			$.ajax({
                url: deleteInfoUrl,
                type: "GET",
                dataType: "json",
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (result) {
                    console.log(result);
                    if(result.deleteOk){
                    	$('.tips p').html("删除成功，正在跳转");
                    	$('.tips').fadeIn(500).delay(1000).fadeOut(1000);
                    	setTimeout(function(){
							window.location.href=base+"QueryInfo?method=listAll";
						},3000)
                    }
                     
                    
                },
                error:function(result){    //实际上error已经请求成功,因为后台返回的不是Json
                 	 console.log(result);
                   
                     /* $('.tips p').html(result.responseText);
                     $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
                }
            });
			
		}
		
		function changeFocus() {
			//已经收藏的时候
			var changeFocusUrl;
			var endResult;
			if(focus){
				changeFocusUrl = removeFocusUrl;
			}else{
				 changeFocusUrl = addFocusUrl
			}
			
			$.ajax({
                url:changeFocusUrl,
	            type: "GET",
	            dataType: "json",
	            cache: false,//上传文件无需缓存
	            processData: false,//用于对data参数进行序列化处理 这里必须false
	            contentType: false, //必须
	            success: function (result) {
	                console.log(result);
	                endResult = result;
	                /* if(result.isFocus){
	                  $('#addFocusIcon').attr("src", 'images/info_detail/no_add_focus.png');
	                } */
	                 /* $('.tips p').html(result.responseText);
	                
	                 $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
	                 
	                  if(focus){
			             if(endResult.removeOk){
			             	focus = false;
			                $('#addFocusIcon').attr("src", 'images/info_detail/no_add_focus.png');
			             }
			         }else{
			         	if(endResult.addOk){
			         		focus = true;
			             	$('#addFocusIcon').attr("src", 'images/info_detail/add_focus.png');
			             }
			         }
	                
	            },
	            error:function(result){    //实际上error已经请求成功
	             	 console.log(result);
	             	 endResult = result;
	                /*  $('.tips p').html(result.responseText);
	                  $('#addSupportIcon').attr("src", 'images/info_detail/add_support.png');
	                 $('.tips').fadeIn(1000).delay(1000).fadeOut(1000); */
	            }
	         });
		}
		
		 function addComment() {
			var base='http://localhost:8080/iShare/';
			var commentDetail = $('#commment').val();
			
			$.ajax({
                url: addCommentUrl+commentDetail,
                type: "GET",
                dataType: "json",
                cache: false,//上传文件无需缓存
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (result) {
                    console.log(result);
                    if(result.addOk){
                    	$('.tips p').html("评论成功，正在跳转");
                    	$('.tips').fadeIn(500).delay(1000).fadeOut(1000);
                    	setTimeout(function(){
							window.location.href=base+"servlet/QueryInfo?method=listDetail&infoId="+$('#supportInfoId').text();
						},3000)
                    }
                },
                error:function(result){    //实际上error已经请求成功,因为后台返回的不是Json
                 	 console.log(result);
                    
                }
            });
		}
		
	</script>
</body>
</html>
