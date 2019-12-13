<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="management.bean.User"%>
<jsp:useBean id="manageBean" class="management.bean.User" scope="session"/>

<%
String path = request.getContextPath();
String loginPath = path+"/management/login.jsp";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品类别列表</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/assets/cssLibs/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/assets/JsLibs/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/JsLibs/bootstrap.min.js"></script>

    
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"44058",secure:"44063"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-2" data-genuitec-path="/mobileShop/WebRoot/management/manageIndex.jsp">
	<% 
    	if(manageBean==null){
    		response.sendRedirect(loginPath);  //重定向到登录页
    	}else{
    		boolean b = manageBean.getLogname()==null||manageBean.getLogname().length()==0;
    		
    		if(b){
    			response.sendRedirect(loginPath);
    			return;
    		}
    	}
    %>
	<div class="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-2" data-genuitec-path="/mobileShop/WebRoot/management/manageIndex.jsp">
	   <div class="row" style="padding-top:16px">
			<div class="col-lg-12 col-md-12 col-sm-12 " style="padding:0">
				<nav class="navbar navbar-inverse" role="navigation">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="javascript:;">后台管理系统</a>
						</div>
						<ul class="nav navbar-nav navbar-right">
							<li class="navar-btn  navbar-right exist" style="margin-right:0;">
								<a href="${pageContext.request.contextPath }/index.jsp">返回商城 </a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	   
	
	    <!--main-->
	    <div class="container-fluid mybody">
	        <div class="main-wapper">
	            <!--菜单-->
	            <div id="siderbar" class="siderbar-wapper">
	
	                <div class="panel-group menu" id="accordion" role="tablist" aria-multiselectable="true">
	
	                    <div class="panel panel-inner">
	                        <div class="panel-heading panel-heading-self" role="tab" id="headingOne">
	                            <h4 class="panel-title">
	                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	                                    <span class="glyphicon glyphicon-user"></span> 用户管理
	                                </a>
	                            </h4>
	                        </div>
	                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	                            <div class="list-group list-group-self">
	                                <a href="${pageContext.request.contextPath }/UserManage?method=list" target="appiframe" class="list-group-item"><span class="glyphicon glyphicon-menu-right"></span> 用户列表</a>
	                               <!--  <a href="add_article.html" target="appiframe" class="list-group-item"><span class="glyphicon glyphicon-menu-right"></span> 权限管理</a> -->
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="panel panel-inner">
	                        <div class="panel-heading panel-heading-self" role="tab" id="headingSeven">
	                            <h4 class="panel-title">
	                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
	                                    <span class="glyphicon glyphicon-barcode"></span> 手机管理
	                                </a>
	                            </h4>
	                        </div>
	                        <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
	                            <div class="list-group list-group-self">
	                                <a href="${pageContext.request.contextPath }/GoodsTypeManage?method=list"  target="appiframe" class="list-group-item"><span class="glyphicon glyphicon-menu-right"></span> 手机类别</a>
	                                <a href="${pageContext.request.contextPath }/GoodsManage?method=list"  target="appiframe" class="list-group-item"><span class="glyphicon glyphicon-menu-right"></span> 手机列表</a>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="panel panel-inner">
	                        <div class="panel-heading panel-heading-self" role="tab" id="headingTwo">
	                            <h4 class="panel-title">
	                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	                                    <span class="glyphicon glyphicon-tasks"></span> 订单管理
	                                </a>
	                            </h4>
	                        </div>
	                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	                            <div class="list-group list-group-self">
	                                <a href="${pageContext.request.contextPath }/OrderFormManage?method=list" target="appiframe" class="list-group-item"><span class="glyphicon glyphicon-menu-right"></span> 订单列表</a>
	                            </div>
	                        </div>
	                    </div>
	
	                </div>
	
	            </div>
	            <!--菜单-->
	            <!--内容-->
	            <div id="content" class="main-content" style="padding-left:10px; background:#EEFFFF;">
	                <iframe src="${pageContext.request.contextPath }/management/manageFlash.jsp" style="width:100%;height: 100%;" id="appiframe" name="appiframe" frameborder="0"></iframe>
	            </div>
	            <!--内容-->
	        </div>
	
	    </div>
	
	    <!--main-->
	
	    <script type="text/javascript">
	        $(function(){
	            var options={
	                animation:true,
	                trigger:'hover' //触发tooltip的事件
	            }
	            $('.atip').tooltip(options);
	
	        });
	
	
	
	    </script>
    </div>
	</body>
</html>
