<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
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
    <li>手机管理</li>
    <li class="active">手机编辑</li>
</ol>
<!--路径导航-->

<div class="page-content">
    <div class="panel panel-default">
        <div class="panel-heading">编辑手机</div>
        <div class="panel-body">
            <form id="mobileForm" method="post" enctype="multipart/form-data">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                      		
                            <div class="form-group clearfix">
                                <label>版本号：</label>
 								<input type="text" class="form-control" id="mobileVersion" name="mobileVersion" value="${goods.mobile_version}" placeholder="请输入版本号">
                            </div>
                         
                            <div class="form-group clearfix">
 								<label>手机名称：</label>
 								<input type="text" class="form-control" id="mobileName" name="mobileName" value="${goods.mobile_name}" placeholder="请输入手机名称">
                            </div>
                            <div class="form-group clearfix">
 								<label>制造商：</label>
 								<input type="text" class="form-control" id="mobileMade" name="mobileMade" value="${goods.mobile_made}" placeholder="请输入制造商">
                            </div>
                            <div class="form-group clearfix">
 								<label>价格：</label>
 								<input type="text" class="form-control" id="mobilePrice" name="mobilePrice" value="${goods.mobile_price}" placeholder="请输入价格">
                            </div>
                            <div class="form-group clearfix">
 								<label>详情：</label>
 								<input type="text" class="form-control" id="mobileMess" name="mobileMess" value="${goods.mobile_mess}" placeholder="请输入手机介绍详情">
                            </div>
                           
                            <div class="form-group clearfix">
                           	 <label>照片：</label>
	                             <c:if test="${goods.mobile_pic.length()>0}">
		 							<input type="text" class="form-control" id="mobilePic" name="mobilePic" value="${goods.mobile_pic}" placeholder="请输入照片链接">
	                             </c:if>
	                             <c:if test="${goods.mobile_pic.length()==0||goods.mobile_pic==null}">
		 							<input type="hidden"  class="form-control" id="mobilePic" name="mobilePic" value="empty" placeholder="请输入照片链接">
	                             </c:if>
	                             <div class="form-group clearfix" id="updatebox">
	                            	<input type="file" id="file"  name="mobilePic" />
	                            </div>
                            </div> 
                           
                             
                            <div class="form-group clearfix">
 								<label>类别：</label>
 								<input type="text" class="form-control" id="id" name="id" value="${goods.id}" placeholder="请输入手机类别">
                            </div>
                            
                            <input type="hidden" id="isUpdate" name="isUpdate" value="${goods.mobile_version}"/> 
                        </div>
                        
              
						<input type="hidden" name="isUpdate" value="${goods.mobile_version}"/> 
                    </div>
                    <div class="form-group clearfix col-sm-4" id="updatebox">
                       <a class="btn btn-primary" onclick="submit()">保存</a>
                     </div>
                </div>
            </form>
        </div>

    </div>

</div>
<script type="text/javascript">
	function submit(){
		var mobileForm = document.getElementById("mobileForm");
		var mobileVersion = document.getElementById("mobileVersion").value;
		var mobileName = document.getElementById("mobileName").value;
		var mobileMade = document.getElementById("mobileMade").value;
		var mobilePrice = document.getElementById("mobilePrice").value;
		var mobileMess = document.getElementById("mobileMess").value;
		var isUpdate = document.getElementById("isUpdate").value;
		var mobilePic = document.getElementById("mobilePic").value;
	    var ifSelect;
	    var selectFile = $('#file').get(0).files[0];
	    console.info(selectFile);
        if(selectFile.length!=0){
        	ifSelect = 1;  //有选择文件
        }else{
        	ifSelect = 0;
        }
     
        
       if(isUpdate==null||isUpdate.length==0){
		    isUpdate = 0;   //不是更新，是增加
		}else{
			isUpdate = 1;
		}

		var id = document.getElementById("id").value;
		mobileForm.action="${pageContext.request.contextPath}/servlet/GoodsManage?method=edit&mobileVersion="+mobileVersion+"&mobileName="+mobileName+"&mobileMade="+mobileMade+"&mobilePrice="+mobilePrice+"&mobileMess="+mobileMess+"&mobilePic="+mobilePic+"&ifSelect="+ifSelect+"&id="+id+"&isUpdate="+isUpdate;
		mobileForm.submit();
	}

</script>
</body>
</html>