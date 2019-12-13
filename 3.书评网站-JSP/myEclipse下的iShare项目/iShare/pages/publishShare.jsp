<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="mybean.data.Login"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%
    String path = request.getContextPath();
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
    <link href="${pageContext.request.contextPath }/libs/cssLibs/cropper.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath }/libs/cssLibs/wangEditor.min.css" rel="stylesheet">
     
    <script src="${pageContext.request.contextPath }/libs/jsLibs/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/libs/jsLibs/jquery.cookie.js"></script>
    
    <script src="${pageContext.request.contextPath }/libs/jsLibs/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/libs/jsLibs/cropper.js"></script>
    <script src="${pageContext.request.contextPath }/libs/jsLibs/canvas-to-blob.min.js"></script>
    <script src="${pageContext.request.contextPath }/libs/jsLibs/wangEditor.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="styles/public.css">
    
    <link rel="stylesheet" type="text/css" href="styles/publish/publish.css">
    <link rel="stylesheet" type="text/css" href="styles/index/index.css">
  </head>
  
<body>
	 <!-- 提示信息 -->
	<div class="tips">
		<p><jsp:getProperty name="loginBean" property="addInfoBacknews"/></p>
	</div> 
	
	    
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
            
            <li class="no_dot"><a href="#">关于我们</a></li>
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
        <li class="navActive"><a href="${pageContext.request.contextPath }/pages/publishShare.jsp"><strong><span>发布分享</span></strong></a></li>
        <li><a target="_blank" href="${pageContext.request.contextPath }/servlet/QueryMyInfo?infoType=7"><strong><span>个人中心</span></strong></a></li>
        <li><a href="${pageContext.request.contextPath }/servlet/QueryInfo?method=listAll"><strong><span>待扩展</span></strong></a></li>
    </ul>
    
    <div id="content" style="display:relactive; padding-bottom:50px;">
       <div class="container-fluid">

        <div class="row">
 

            <div class="form row login_form" style="padding:20px 0 20px 0; background:#ffffff;">  
                    <form id="myForm" enctype="multipart/form-data" class="form-horizontal col-lg-12 col-md-12 col-sm-12 " id="login_form">  
                        <div class=" col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-sm-offset-1 col-md-offset-1">
                            <div class="form-group">
                                <label for="articleTitleCn" class="col-lg-2 col-md-2 col-sm-8 control-label">分享标题 </label>  
                                <div class=" col-lg-8 col-md-8 col-sm-12">
                                    <input id="articleTitleCn" class="upData form-control required inputnum" type="text" placeholder="中文标题" name="articleTitleCn" autofocus="autofocus"/>  
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="articleTitleEn" class="col-lg-2 col-md-2 col-sm-8 control-label">文章类型 </label>  
                                <div class=" col-lg-8 col-md-8 col-sm-12">
	                              <table style="margin-top:6px;">
               						<tbody>
                                    	<tr>
					                       <td class="form_right">
					                            <input id="firstType" type="radio" name="type" checked value="0">
					                            <label class="type" for="firstType">文学     </label>
					                            <input id="secondType" type="radio" name="type" value="1">
					                            <label class="type" for="secondType">流行      </label>
					                            <input id="thirdType" type="radio" name="type" value="2">
					                            <label class="type" for="thirdType">文化      </label>
					                            
					                            <input id="fourthType" type="radio" name="type" value="3">
					                            <label class="type" for="fourthType">生活      </label>
					                            <input id="fifthType" type="radio" name="type" value="4">
					                            <label class="type" for="fifthType">经管      </label>
					                            <input id="sixthType" type="radio" name="type" value="5">
					                            <label class="type" for="sixthType">科技      </label>
					                            <input id="seventhType" type="radio" name="type" value="6">
					                            <label class="type" for="seventhType">日记      </label>
					                        </td>
					                    </tr>
					                  </tbody>
					              </table>
                                </div>
                            </div>
                          
                            <div class="form-group">
                                <div class="field-label-container" >
                                    <label class="field-label font-family-heiti" for="articlePrefaceCn">
                                        分享简述 
                                    </label>
                                </div>
                                <div class="field-content">
                                    <textarea rows="3" name="articlePrefaceCn" id="articlePrefaceCn" style="width:100%;height:136px;">
                                    </textarea>
                                </div>
                            </div>
                         
                            
                            <p>分享内容：</p>
                            <div id="div1">
                             
                            </div>
                            <p style="height:50px;"></p>

                         

                            <div style="height:50px;"></div>
                            <div class="form-group">
                                <label for="file" class="col-lg-4 col-md-4 col-sm-8 control-label">上传内容主题图片： </label>  
                                <div id="div_insect_file" class="col-lg-8 col-md-8 col-sm-12">  
                                    <input style="margin-bottom:30px;" class=" col-lg-12 col-md-12 col-sm-12 btn fileUp" type="file" id="fileUp" name="fileUp" onchange="beginCut()"/>
                                    <div class="form-group loginBtn" style="text-align:center;">  
                                        <input type="button" id="dataSubmit" class=" col-lg-6 col-md-6 col-sm-6 btn btn-success login" value="提交"/>     
                                    </div> 
                                   
                                    <script type="text/javascript">
                                    	var base='http://localhost:8080/iShare/';
                                   		var url={
											'upload':base+'servlet/PublishPic',
											'upEssayPic':base+'servlet/UploadEssayPic',
											'upEssay':base+'servlet/AddInfo',
											
										}
										
										var router = {
											'toIndex':function toIndex(){
												setTimeout(function(){
													window.location.href=base+"QueryInfo?method=listAll";
												},2000)
											}
										}
										
										
                                        var E = window.wangEditor
                                        
                                        var editor1 = new E('#div1')
                                        //editor1.customConfig.uploadImgShowBase64 = true;
                                        editor1.customConfig.uploadFileName = 'file'
                                        editor1.customConfig.uploadImgServer = url.upEssayPic;
                                        editor1.customConfig.uploadImgMaxLength = 1;
                                       /*  editor1.customConfig.uploadImgHeaders = {
                                            Authorization: $.cookie('token')
                                        } */
                                        editor1.create();
                                        
                                        var picScale={width:170,height:113,bWidth:170,bHeight:113};
                                        var cutView=$(".cropper-cut-view");
                                        var $fileUp=$("#fileUp");
                                        //兼容性判定
                                        var support={
                                            fileList: !!$('<input type="file">').prop('files'),
                                            blobURLs: !!window.URL && URL.createObjectURL,
                                            formData: !!window.FormData
                                        };
                                        support.datauri = support.fileList && support.blobURLs;
                                    
                                        var files,file;
                                        function beginCut()
                                        {
                                            //不兼容的情况未做处理，可自行参考官方php example中的解决方法
                                            if(support.datauri)
                                            {
                                               files= document.getElementById("fileUp").files;
                                               if(files.length>0){
                                                    file=files[0];
                                                }
                                                if(isImageFile(file)){
                                                    picUrl=URL.createObjectURL(file);
                                                    console.log(picUrl);
                                                    
                                                    setTimeout(this.startCropper(),2000);
                                                }
                                            }
                                        }
                                    
                                        function isImageFile(file) {
                                            if (file.type) {
                                                return /^image\/\w+$/.test(file.type);
                                            } else {
                                                return /\.(jpg|jpeg|png|gif)$/.test(file);
                                            }
                                        }
                                    
                                            var active=false;
                                            var $img;
                                            function startCropper()
                                            {
                                                var _this=this;
                                                if(active){
                                                    $img.cropper('replace',picUrl);
                                                }else{
                                    
                                                    $img=$('<img src="' + picUrl + '">');
                                                    $(".cut-container").empty().html($img);
                                                    console.log($img.width());
                                                    console.log($img.height());
                                                    $img.cropper({
                                                        aspectRatio:picScale.width/picScale.height,
                                                        autoCrop:false,
                                                        minCropBoxWidth:94,
                                                        minCropBoxHeight:50,
                                                        zoomable:false,
                                                        scalable:false,
                                                        rotatable:false,
                                                        aspectRatio:940/500,
                                                        //autoCropArea:0.01,
                                                        ready:function(){
                                                            var result = $img.cropper("getImageData");
                                                            $img.cropper('crop');
                                                            $img.cropper('setData',{
                                                                width:picScale.bWidth,
                                                                height:picScale.bHeight
                                                            });
                                                        }
                                                    });
                                                    $img.on('cropmove',function(e){
                                                        var data=$img.cropper('getData');
                                                        if(data.width<picScale.width||data.height<picScale.height){
                                                            e.preventDefault();
                                                        }
                                                    });
                                                    $img.on('cropend',function(e){
                                                        var data=$img.cropper('getData');
                                                        if(data.width<picScale.width||data.height<picScale.height){
                                                            $img.cropper('setData',{ width:picScale.width,
                                                                height:picScale.height});
                                                        }
                                                    });
                                    
                                                    active=true;
                                                }
                                            }
                                    
                                            function stopCropper()
                                            {
                                                if(active){
                                                    $img.cropper("destroy");
                                                    $img.remove();
                                                    $fileUp.val("");
                                                    active = false;
                                                }
                                            }


                                            $("#dataSubmit").on('click',function(){
                                        
                                                var articleTitleCn = $('#articleTitleCn').val();
                                    

                                                var articlePrefaceCn = $('#articlePrefaceCn').val();
                                       

                                                var articleContentCn= editor1.txt.html();
                                             
                                                
                                                var picPath;

                                                if(!articleTitleCn||!articlePrefaceCn ||!articleContentCn){
                                                    $('.tips p').html('请完善文章内容！');
                                                    $('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
                                                    return;
                                                }

                                                if(!$img){
                                                    $('.tips p').html('请上传图片！');
                                                    $('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
                                                    return;
                                                }

                                                var canvas = document.createElement('canvas');
                                                /* ... your canvas manipulations ... */
                                                if (canvas.toBlob) {
                                                    $img.cropper("getCroppedCanvas").toBlob(
                                                        function (blob) {
                                                            var formData = new FormData();
                                                            formData.append('file', blob, file.name);
                                                            /* ... */
                                                            
                                                            console.log(blob)
                                                            $('.tips p').html('正在上传，请稍后！');
                                                            $('.tips').fadeIn(1000);

                                                            $.ajax({
                                                                url: url.upload,
                                                                data: formData,
                                                                type: "POST",
                                                                dataType: "json",
                                                                cache: false,//上传文件无需缓存
                                                                processData: false,//用于对data参数进行序列化处理 这里必须false
                                                                contentType: false, //必须
                                                                success: function (result) {
                                                                    console.log(result);
                                                                     $('.tips p').html(result);
                                                                    //$('.tips').delay(1000).fadeOut(1000);
                                                                    
                                                                },
                                                                error:function(result){
                                                                  $('.tips').delay(1000).fadeOut(1000); 
                                                                  upLoadAll(result.responseText.toString());    //应该是后台逻辑处理有问题，上传成功了但是走的是error
                                                                  console.log(result.responseText);
                                                                }
                                                            });
                                                            
                                                            
                                                        },
                                                        'image/jpeg'
                                                    );
                                                }
                                             
                                            });
                                            
                                            function replaceSymbol(str){
                                                if(str){
                                                    return str.replace(/'/g, '"'); 
                                                }
                                            }
                                            function upLoadAll(picPath){
                                                var articleTitleCn = $('#articleTitleCn').val();
                   
 												var articleType = $("input[name='type']:checked").val();
 												
 												
                                                var articlePrefaceCn = $('#articlePrefaceCn').val();

                                                var articleContentCn= replaceSymbol(editor1.txt.html());
                                                
                                                var articleAuthor = $('.userInfo p').text();
                                                
                                                $.ajax({
													'url':url.upEssay,
													'type':"POST",
													'dataType':"json",
													'data':{
		                                                    'infoTitle':String(articleTitleCn),
		                                                    
		                                                    'type':String(articleType),
		                                             
		
		                                                    'infoDescribe':String(articlePrefaceCn),
		                                                   
		
		                                                    'infoDetail':articleContentCn,
		                                                    
		                                                    'infoAuthor':String(articleAuthor),
		                                             
		
		                                                    'infoPic':String(picPath),
		                                                    
		                                                },
												  	/*  beforeSend: function(xhr) {  
														xhr.setRequestHeader("Authorization", token);  
														xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
													 }, */
													'success': function (message) {
														console.log(message);
	                                                    $('.tips p').html("稍后再试");
	                                                    $('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
	                                                    $(".upData").val("");
	                                                    console.log('图片路径'+String(picPath))
													},
													'error': function (message) {
														console.log(message);
	                                                    $('.tips p').html("发布成功，正在跳转");
	                                                    $('.tips').fadeIn(1000).delay(1000).fadeOut(1000);
	                                                    $(".upData").val("");
	                                                    router.toIndex();//回到首页
	                                                    console.log('图片路径'+String(picPath))
													}
												})
                                            }
                                    </script>
                                </div>
                            </div>
                              <!-- 显示图片剪裁层 -->
                            <div class="cropper-cut-view" >
                                <div class="classification-layer" >
                                    <div class="classification-layer-main" style="font-size:16px;">
                                        <div class="cut-container" style="width: 750px;height: 400px;margin:0 auto;border:dashed #cacaca 1px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </form>
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
	function toLogin(){
	    var logname = document.getElementById("logname").value;
	    var password = document.getElementById("logPass").value;
		document.location.href="${pageContext.request.contextPath }/servlet/HandleLogin?logname="+logname+"&password="+password;
	}
	
	var articleAuthor = $('.userInfo p').text();
	console.log(articleAuthor.toString());
</script>
</body>
</html>
