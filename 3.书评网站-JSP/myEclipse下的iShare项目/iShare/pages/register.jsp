<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<jsp:useBean id="userBean" class="mybean.data.FindPeople" scope="request"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String handleRegisterPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/servlet/HandleRegister";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style media="screen">
    body{
        color: #552100;
    }
    .mask{
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: url(/iShare/images/bg.jpg) no-repeat;
        background-size: cover;
        filter: blur(5px);
        z-index: -1;
    }
    .popup{
        position: absolute;
        width: 520px;
        height: 540px;
        background: rgba(255,255,255,.8);
        left: 50%;
        top: 50%;
        margin-left: -260px;
        margin-top: -320px;
        border: 1px solid #fff;
        padding:15px 5px 5px 5px;
        background-clip: content-box;
        border-radius: 10px;
    }
    .title{
        text-align: center;
        font-size: 28px;
        color: #362e2b;
        display: flex;
    }
    .title .tip{
        padding: 0 20px;
    }
    .title .line{
        flex: 1;
        background:linear-gradient(
        to bottom,
        rgba(0,0,0,0) 49%,
        #000 49%,
        #000 51%,
        rgba(0,0,0,0) 51%
        );
    }
    table{
        width: 100%;
    }
    input,select,textarea{
        padding:0;
        outline: none;
    }
    .form_left{
        text-align: right;
        font-size: 18px;
        width: 150px;
    }
    .form_right input[type="text"],
    .form_right input[type="password"]{
        height: 40px;
        width: 230px;
        background: transparent;
        border: none;
        border-bottom: 2px solid #999;
        text-indent: 20px;
        transition: .3s;
    }
    .form_right input[type="text"]:hover,
    .form_right input[type="password"]:hover{
        border-color:#888;
    }
    .popup tr{
        height: 65px;
    }
    .form_right input[type="textarea"]{
        width: 254px;
        height: 100px;
    }
    .btn input{
        width:100px;
        height: 30px;
        background: #362e2b;
        color: #fff;
    }
    tr.des{
        height: 120px;
    }
    .form_right input[type="text"]:focus,
    .form_right input[type="password"]:focus{
        border-bottom-color: #562d2b;
    }
    .form_right input[type="text"]:focus~.move:after{
        transform: translateX(220px);
    }
    .form_right input[type="password"]::-webkit-input-placeholder,
    .form_right input[type="text"]::-webkit-input-placeholder
    {
        transition: .5s;
        font-size: 14px;
        transform-origin: top left;
    }
    .form_right input[type="password"]:focus::-webkit-input-placeholder,
    .form_right input[type="text"]:focus::-webkit-input-placeholder{
        transform: scale(.8) translateY(-14px);
    }
 
</style>

  </head>
  
  <body>
    <div class="mask"></div>
    <section class="popup">
        <h2 class="title">
            <span class="line">
            </span><span class="tip">用户注册</span>
            <span class="line"></span>
        </h2>
        <form action="<%=handleRegisterPath%>" method="post" name="form">
            <table>
                <tbody>
                    <tr>
                        <td class="form_left">昵称：</td>
                        <td class="form_right">
                            <input type="text" name="username" placeholder="请输入4-12个字符">
                        </td>
                    </tr>
                    <tr>
                        <td class="form_left">密码：</td>
                        <td class="form_right">
                            <input type="password" name="password" placeholder="请输入密码">
                        </td>
                    </tr>
                    <tr>
                        <td class="form_left">验证密码：</td>
                        <td class="form_right"><input type="password" name="again_password" placeholder="请再次输入密码"></td>
                    </tr>
                    <tr class="des">
                        <td class="form_left">个性签名</td>
                        <td class="form_right">
                            <input type="textarea" name="signature">
                        </td>
                    </tr>
                    <tr>
                        <td class="form_left"></td>
                        <td class="form_right btn">
                            <input type="submit" value="注册">
                            <input type="button" onclick="toLogin()" value="已经注册">
                        </td>
                    </tr>
                </tbody>
            </table>
            
             <div align="center">
		    	<p>注册反馈：<jsp:getProperty name="userBean" property="backnews"/></p>
		    <%-- 	<table>
		    		<tr>
		    			<td>会员名称：</td>
		    			<td><jsp:getProperty name="userBean" property="userName"/></td>
		    		</tr>
		    	</table> --%>
		    </div>
        </form>
    </section>
    <script type="text/javascript">
		function toLogin(){
			document.location.href="${pageContext.request.contextPath }/pages/login.jsp";
		}
	</script>
</body>
</html>
