<%@ page import="com.wordmanage.bean.Word" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: eit
  Date: 2019-11-21
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="userBean" class="com.wordmanage.bean.User" scope="session"/>
<jsp:useBean id="wordBean" class="com.wordmanage.bean.Word" scope="session"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        body{
            background-size:cover;
            background:#000000;
            font-size: 16px;
        }

        .detail_main{
            background:#ffffff;
        }

        .none{
            height:2px;
            width:100%;
            margin-top:20px;
            margin-bottom:5px;
            background:rgba(192,192,192,0.2);
        }
        body .container{
            margin-top:100px;
            margin-bottom:50px;
        }

        .detail_main{
            padding:0;
            border-radius: 6px;
        }

        .hot li a{
            text-align:center;
        }
        .select{
            margin-bottom:20px;
        }
        .wait_result td,.wait_result th,.history td,.history th,.returnsure td,.returnsure th{
            text-align:center;
        }

        .createhotborrow td,.createhotborrow th, td,th{
            text-align:center;
        }

        tr{
            height:40px;
            line-height:40px;
        }

        tr:hover{
            cursor:pointer;
            background:rgba(217,255,255,0.7);
        }

        .radio label{
            width:100px;
        }

        .nullTip{
            height:50px;
            line-height:50px;
            text-align:center;
            font-size:1em;
            color:red;
        }

        #b{
            height:300px;
        }

        .return{
            margin:100px 100px;
        }

        .returnTip{
            width:281px;
            text-align:center;
            margin: 0 auto;
        }

        .returnNull{
            margin-top:40px;
            text-align:center;
            color:red;
        }

        .iamcircle{
            padding:50px;
            margin:auto;
            width:300px;
            height:300px;
            border-radius: 50%;
            border:1px solid rgba(255,174,201,0.7);
        }
        .iamcircle text{
            display:inline-block;
            width:60px;
            height:28px;
            line-height: 28px;
        }

        .commentdetail li{
            list-style-type:none;
            margin-top:5px;
            padding:2px;
        }

        .deletecomment{
            cursor:pointer;
        }

        td input{
            max-width: 100px;
        }

        .insert_comment{
            margin-top:20px;
        }

        .tip{
            text-align:center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row detail">
        <div class="detail_main col-lg-10 col-md-10 col-sm-10 col-sm-offset-1 col-md-offset-1 col-sm-offset-1" style="padding:0">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/listWord?currentPage=1&pageSize=5&type=a">英语单词查询系统</a>
                    </div>
                    <ul class="nav navbar-nav navbar-left">
                        <!-- 可以通过toogle这个方法进行显示隐藏的切换 -->
                        <li id="aP" class="active"><a href="#a" data-toggle="tab">词汇汇总</a></li>
                        <li id="bP"><a href="#b" data-toggle="tab">查询单词</a></li>
                        <li id="cP"><a href="#c" data-toggle="tab">单词管理</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="navar-btn  navbar-right exist"><a href="/index.jsp">退出登录    </a></li>
                        <p class="navbar-text navbar-right welcom"><jsp:getProperty name="userBean" property="username"/></p>
                    </ul>
                </div>
            </nav>
            <ul class="tab-content">
                <div id="a" class="tab-pane fade in active">
                    <div id="text" class="row">
                        <table class="row table table-hover table-striped table-bordered">
                            <caption style="text-align:center">词汇</caption>
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>英文</th>
                                <th>翻译</th>
                                <th>类型</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageResult.list}" var="item">
                                <tr class="tr_content">
                                    <td class="td_content1">${item.id}</td>
                                    <td class="td_content1">${item.english}</td>
                                    <td class="td_content1">${item.chinese}</td>
                                    <td class="td_content1">${item.type}</td>
                                    <td class="td_content1">${item.comm}</td>
                                    <td class="td_content1">
                                        <a href="/deleteWord?id=${item.id}"><button class="btn btn-default suredelete" type="button">delete</button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </thead>
                        </table>
                        <div class="page" style="text-align:center">
                            <ul class="pagination pagination-self center">
                                <!--  上一页  -->
                                <c:if test="${pageResult.currentPage == 1}">
                                    <li>
                                        <span aria-hidden="true">前一页</span>
                                    </li>
                                </c:if>
                                <c:if test="${pageResult.currentPage >1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/listWord?currentPage=${pageResult.currentPage-1}&pageSize=5&type=a" aria-label="Previous">
                                            <span aria-hidden="true">前一页</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${pageResult.beginIndex }" end="${pageResult.endIndex }" varStatus="status">
                                    <c:if test="${status.index eq pageResult.currentPage}">
                                        <li><span style="color: black;">${status.index }</span></li>
                                    </c:if>
                                    <c:if test="${status.index ne pageResult.currentPage}">
                                        <li><a href="${pageContext.request.contextPath }/listWord?currentPage=${status.index}&pageSize=5"&type=a>${status.index }</a></li>
                                    </c:if>
                                </c:forEach>

                                <!-- 下一页 -->
                                <c:if test="${pageResult.currentPage == pageResult.totalPages}">
                                    <li>
                                        <span aria-hidden="true">后一页</span>
                                    </li>
                                </c:if>
                                <c:if test="${pageResult.currentPage < pageResult.totalPages}">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/listWord?currentPage=${pageResult.currentPage+1}&pageSize=5&type=a" aria-label="Next">
                                            <span aria-hidden="true">后一页</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="b" class="tab-pane fade">
                    <div class="return row">
                        <form action="/searchWord" class="col-lg-8 col-md-8 col-sm-8 col-sm-offset-2 col-md-offset-2 col-sm-offset-2">
                            <div class="returnTip"><label>请输入查询的单词</label></div>
                            <div class="input-group input-group-md">
                                <input type="text" name="key" class="form-control slectsureumbrellaId" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="createsureList" type="submit">Go!</button>
                                  </span>
                            </div><!-- /input-group -->
                        </form>

                        <div  class="row">
                            <table class="col-lg-6 col-md-6 col-sm-6 table table-hover table-striped table-bordered">
                                <caption style="text-align:center">查询结果</caption>
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>英文</th>
                                    <th>翻译</th>
                                    <th>类型</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${searchList}" var="item">
                                    <form action="/updateWord?id=${item.id}" method="post">
                                        <tr class="tr_content">
                                            <td class="td_content1">${item.id}</td>
                                            <td class="td_content1"><input value="${item.english}" name="english"></td>
                                            <td class="td_content1"><input value="${item.chinese}" name="chinese"></td>
                                            <td class="td_content1"><input value="${item.type}" name="type"></td>
                                            <td class="td_content1"><input value="${item.comm}" name="comm"></td>
                                            <td class="td_content1">
                                                <button class="btn btn-default" type="submit">修改</button>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <view class="col-lg-10 col-md-10 col-sm-10 col-sm-offset-1 col-md-offset-1 col-sm-offset-1 returnsure"></view>
                </div>
                <div id="c" class="tab-pane fade">

                    <div class="row">
                        <div class="span2  col-xs-12 col-sm-3 col-md-2">
                            <ul class="nav nav-pills nav-stacked hot">
                                <li id="dP" class="hot_queue active"><a href="#d" data-toggle="tab">添加单词</a></li>
                                <li id="eP" class="pastBorrow"><a href="#e" data-toggle="tab">单词考核</a></li>
                                <li id="fP" class="wait_return"><a href="#f" data-toggle="tab">错词本</a></li>
                                <li id="gP" class="see_active_user"><a href="#g" data-toggle="tab">热门词汇</a></li>
                                <li id="hP" class="user_comment"><a href="#h" data-toggle="tab">反馈</a></li>
                            </ul>
                        </div>
                        <div class="tab-content col-xs-12 col-sm-9 col-md-10">
                            <div id="d" class="tab-pane fade in active">
                                <form action="/addWord" method="post" class="form-horizontal row">
                                    <div class=" col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">

                                        <div class="form-group">

                                            <label class="col-lg-2 col-md-2 col-sm-2 control-label">英文 </label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <input class="form-control required" type="text" placeholder="英文" name="english"
                                                       autofocus="autofocus" maxlength="20" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-sm-2 control-label">中文</label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <input class="form-control required" type="text" placeholder="中文" name="chinese"
                                                       autofocus="autofocus" maxlength="20" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-sm-2 control-label">类型 </label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <input class="form-control required" type="text" placeholder="词汇类型" name="type"
                                                       autofocus="autofocus" maxlength="20" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-sm-2 control-label">说明</label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <input class="form-control required" type="text" placeholder="词汇用途" name="comm"
                                                       autofocus="autofocus" maxlength="20" />
                                            </div>
                                        </div>
                                        <div>
                                            <hr />
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-success pull-right" value="确定增加" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="e" class="tab-pane fade history">
                                <div class="row">
                                <form action="/checkWord" method="post" class="form-horizontal col-lg-8 col-md-8 col-sm-8 col-sm-offset-2 col-md-offset-2" id="login_form">
                                    <a class="col-lg-8 col-md-8 col-sm-8  col-lg-offset-4 col-md-offset-4 col-sm-offset-4" style="margin-bottom: 10px;" href="/getWord"><button class="btn btn-success" type="button">开始考核</button></a>
                                    <div class=" col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                                        <div class="form-group">
                                            <label  class="col-lg-3 col-md-3 col-sm-3 control-label">英文 </label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <c:if test="${word!=null}">
                                                    <input class="form-control required inputnum" type="text" placeholder="英文" name="english"
                                                           autofocus="autofocus" maxlength="20" value="${word.english}" />
                                                </c:if>
                                                <c:if test="${word==null}">
                                                    <input class="form-control required inputnum" type="text" placeholder="英文" name="english"
                                                           autofocus="autofocus" maxlength="20" value="" />
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-lg-3 col-md-3 col-sm-3 control-label">中文</label>
                                            <div class=" col-lg-8 col-md-8 col-sm-8">
                                                <input class="form-control required passW" type="text" placeholder="中文" name="chinese"
                                                       autofocus="autofocus" maxlength="20" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-success pull-right login" value="提交" />
                                        </div>
                                    </div>
                                </form>
                                </div>
                                <div class="tip row">考核反馈：<jsp:getProperty name="wordBean" property="infoBackNews"/></div>
                            </div>
                            <div id="f" class="tab-pane fade wait_result">

                            </div>
                            <div id="g" class="tab-pane fade user_active">

                            </div>
                            <div id="h" class="tab-pane fade comment">
                                <form action="/addComment" method="post">
                                <div><textarea class="cmt-text" placeholder="你的宝贵建议，是我的无限动力，请说出你的心声吧~" style="width:90%; height:150px" name="comment"></textarea></div>
                                <input style="display: none" type="text" name="username" value="<jsp:getProperty name="userBean" property="username"/>">
                                <button class="btn btn-default insert_comment" type="submit">提交评论</button>
                                <div class="none"></div>
                                <div class="commentdetail"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </ul>
        </div>
    </div>
</div>
<%
    List<Word> searchList = (List<Word>) request.getAttribute("searchList");
    if(searchList!=null){
%>
<script>
    var aP = document.getElementById("aP");
    var bP = document.getElementById("bP");
    var cP = document.getElementById("cP");
    var a = document.getElementById("a");
    var b = document.getElementById("b");
    var c = document.getElementById("c");
    aP.className ="";
    bP.className ="active";
    cP.className ="";
    a.className ="tab-pane fade";
    b.className ="tab-pane fade in active";
    c.className ="tab-pane fade";
</script>
<%
    }
%>

<%
    Word word= (Word) request.getAttribute("word");
    if(word!=null){
%>
<script>
    var aP = document.getElementById("aP").className ="";
    var bP = document.getElementById("bP").className ="";
    var cP = document.getElementById("cP").className ="active";
    var dP = document.getElementById("dP").className ="";
    var eP = document.getElementById("eP").className ="active";
    var fP = document.getElementById("fP").className ="";
    var gP = document.getElementById("gP").className ="";
    var hP = document.getElementById("hP").className ="";
    var a = document.getElementById("a").className ="tab-pane fade";
    var b = document.getElementById("b").className ="tab-pane fade";
    var c = document.getElementById("c").className ="tab-pane fade in active";
    var d = document.getElementById("d").className ="tab-pane fade";
    var e = document.getElementById("e").className ="tab-pane fade in active";
    var f = document.getElementById("f").className ="tab-pane fade";
    var g = document.getElementById("g").className ="tab-pane fade";
    var h = document.getElementById("h").className ="tab-pane fade";
    //天啊噜，太残暴了，但是不想用类！！！！
</script>
<%
    }
%>

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
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js"></script>
</html>
