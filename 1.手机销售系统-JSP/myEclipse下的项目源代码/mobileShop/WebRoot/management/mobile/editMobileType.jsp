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
    <li>手机类别管理</li>
    <li class="active">手机类别编辑</li>
</ol>
<!--路径导航-->

<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">编辑手机类别</div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath }/servlet/GoodsTypeManage?method=edit"  method="post">
            	
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group clearfix">
                                <label>类别名称：</label>
 								<input type="text" class="form-control" id="name" name="goodsTypeName" value="${goodsType.name}" placeholder="请输入手机号">
                            </div>
                            <div class="form-group clearfix">
 								<input type="hidden" class="form-control" id="typeId" name="goodsTypeId" value="${goodsType.gtId}" placeholder="请输入手机号">
                            </div>
                        </div>
                        
              
						<input type="hidden" name="isUpdate" value="${goodsType.name}"/> 
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>

    </div>

</div>

</body>
</html>