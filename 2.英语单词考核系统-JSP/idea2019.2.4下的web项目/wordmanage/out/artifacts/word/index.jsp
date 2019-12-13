<%--
  Created by IntelliJ IDEA.
  User: eit
  Date: 2019-11-20
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>单词考核系统</title>
    <base href="<%=basePath%>">
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jQuery.js"></script>
    <script type="text/javascript" src="js/fun.base.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</head>

<body>
<div class="login">
    <div class="login-box">
        <div class="logo png"></div>
        <div class="login-form">
            <form action="/lookWord" method="post" class="form">
                <div class="name">
                    <label>英文释义</label><input type="text" class="text" id="english"
                                              placeholder="英文" name="english" value="${word}" tabindex="1" required="required"></br>
                </div>
                <div class="pwd">
                    <label>中文释义</label><input  class="text"
                                               placeholder="中文" name="chinese" tabindex="2" required="required"></br>
                    <input class="submit" type="submit" value="翻译完成！" />
                </div>
            </form>
        </div>
    </div>
    <div class="air-balloon ab-1 png"></div>
    <div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>
</body>
</html>

