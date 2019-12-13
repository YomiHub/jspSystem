<%--
  Created by IntelliJ IDEA.
  User: eit
  Date: 2019-11-20
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="com.wordmanage.bean.User" scope="session"/>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>单词考核系统</title>
    <base href="<%=basePath%>">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        body {
            background-size: cover;
            background: #000000;
            font-size: 16px;
        }

        body .container {
            margin-top: 150px;
        }

        .container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .form-group .control-label {
            text-align: center;
        }

        .form-control {
            display: inline-block;
        }

        .form-horizontal {
            background: rgba(162, 199, 247, 0.5);
        }

        form {
            border-radius: 6px;
        }

        .a_color {
            color: #ffffff;
        }

        .a_color:hover {
            color: #ffffff;
        }

        .tip{
            color:#ffffff;
            text-align:center;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="form row login_form">
        <form action="/login" method="post" class="form-horizontal col-lg-4 col-md-4 col-sm-4 col-sm-offset-4 col-md-offset-4" id="login_form">
            <!--  在<form>元素上使用类名“form-horizontal”主要有以下几个作用：
    　　        1、设置表单控件padding和margin值。
    　　        2、改变“form-group”的表现形式，类似于网格系统的“row”。  -->
            <h3 class="form-title">欢迎登录单词查询系统</h3>
            <div class=" col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                <!-- 把标签和控件放在一个带有 class .form-group 的 <div> 中。这是获取最佳间距所必需的。 -->
                <div class="form-group">
                    <!-- 为了避免 屏幕识读设备抓取非故意的和可能产生混淆的输出内容（尤其是当图标纯粹作为装饰用途时），我们为这些图标设置了 aria-hidden="true" 属性 -->
                    <label  class="col-lg-4 col-md-4 col-sm-4 control-label">登录号 <span
                            class="glyphicon glyphicon-user" aria-hidden="true"></span> </label>
                    <div class=" col-lg-8 col-md-8 col-sm-8">
                        <input class="form-control required inputnum" type="text" placeholder="账号" name="username"
                               autofocus="autofocus" maxlength="20" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-lg-4 col-md-4 col-sm-4 control-label">密码 <span
                            class="glyphicon glyphicon-lock span_label" aria-hidden="true"></span></label>
                    <div class=" col-lg-8 col-md-8 col-sm-8">
                        <input class="form-control required passW" type="password" placeholder="密码" name="password"
                               autofocus="autofocus" maxlength="20" />
                    </div>
                </div>

                <div class="form-group">
                    <a href="javascript:;" id="register_btn" class="btn a_color">还未注册</a>
                    <input type="submit" class="btn btn-success pull-right login" value="登录" />
                </div>
            </div>
        </form>
    </div>
    <div class="form row register_form" style="display:none">
        <form action="/register" method="post" class="form-horizontal col-lg-4 col-md-4 col-sm-4 col-lg-offset-4 col-sm-offset-4 col-md-offset-4"
              id="register_form">
            <h3 class="form-title">注册账号</h3>
            <div class=" col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                <!-- 把标签和控件放在一个带有 class .form-group 的 <div> 中。这是获取最佳间距所必需的。 -->
                <div class="form-group">
                    <!-- 为了避免 屏幕识读设备抓取非故意的和可能产生混淆的输出内容（尤其是当图标纯粹作为装饰用途时），我们为这些图标设置了 aria-hidden="true" 属性 -->
                    <label class="col-lg-4 col-md-4 col-sm-4 control-label">注册号 <span
                            class="glyphicon glyphicon-user" aria-hidden="true"></span> </label>
                    <div class=" col-lg-8 col-md-8 col-sm-8">
                        <input class="form-control required userId" type="text" placeholder="账号" name="username"
                               autofocus="autofocus" maxlength="20" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-4 col-md-4 col-sm-4 control-label">密码 <span
                            class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
                    <div class=" col-lg-8 col-md-8 col-sm-8">
                        <input class="form-control required passWord" type="password" placeholder="密码" name="password"
                               autofocus="autofocus" maxlength="20" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-4 col-md-4 col-sm-4 control-label">确认密码 </label>
                    <div class=" col-lg-8 col-md-8 col-sm-8">
                        <input class="form-control required surePassWord" type="password" placeholder="再次输入密码" name="rePass"
                               autofocus="autofocus" maxlength="20" />
                    </div>
                </div>
                <div>
                    <hr />
                </div>
                <div class="form-group">
                    <a href="javascript:;" class="btn pull-left Back a_color">返回登录</a>
                    <input type="submit" class="btn btn-success pull-right Register" value="注册" />
                </div>
            </div>
        </form>
    </div>
</div>
<div class="tip">注册反馈：<jsp:getProperty name="userBean" property="infoBackNews"/></div>
</body>
<script>
    window.onload = function () {
        $('#register_btn').bind('click', function () {
            $('.login_form').css('display', 'none');
            $('.register_form').css('display', 'block');
        });

        $('.Back').bind('click', function () {
            $('.login_form').css('display', 'block');
            $('.register_form').css('display', 'none');
            return false;
        });
    }
</script>

</html>

