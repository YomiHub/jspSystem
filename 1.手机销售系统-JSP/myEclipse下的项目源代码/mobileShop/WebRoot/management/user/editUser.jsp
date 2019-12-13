<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content = "text/html;charset=utf-8">
    <title>添加用户</title>
    
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/assets/cssLibs/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/assets/JsLibs/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/JsLibs/bootstrap.min.js"></script>
    
</head>
<body>

<!--路径导航-->
<ol class="breadcrumb breadcrumb_nav">
    <li>首页</li>
    <li>用户管理</li>
    <li class="active">编辑用户</li>
</ol>
<!--路径导航-->

<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">编辑用户</div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath }/servlet/UserManage?method=edit"  method="post">
            	
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group clearfix">
                                <label>昵称：</label>
 								<input type="text" class="form-control" id="name" name="logname" value="${user.logname }" placeholder="请输入手机号">
                            </div>
                            <div class="form-group clearfix">
                                <label>联系电话</label>
 								<input type="text" class="form-control" id="phone" name="phone" value="${user.phone }" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group clearfix">
                                <label>邮寄地址：</label>
 								<input type="text" class="form-control" id="name" name="address" value="${user.address }" placeholder="请输入手机号">
                            </div>
                            <div class="form-group clearfix">
                                <label>真实姓名</label>
 								<input type="text" class="form-control" id="phone" name="realname" value="${user.realname }" placeholder="请输入手机号">
                            </div>
                        </div>
                        <c:if test="${user.logname==null||user.logname.length()==0}">
	                         <div class="col-md-12">
	                            <div class="form-group clearfix">
	                                <label>密码：</label>
	 								<input type="text" class="form-control" id="password" name="password"  placeholder="密码">
	                            </div>
	                            
	                        </div>
                        </c:if>
						<input type="hidden" name="isUpdate" value="${user.logname }"/> 
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>

    </div>

</div>
<%-- <script src="${pageContext.request.contextPath }/assets/js/pcasunzip.js"></script> --%>
<!-- <script type="text/javascript">
	new PCAS("province","city",$("#provinceId").val(),$("#cityId").val());
</script>  -->

</body>
</html>