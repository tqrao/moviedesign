<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String error = (String) request.getAttribute("error");%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <title>会员中心-磬苑电影网站</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>


    <link rel="stylesheet" type="text/css" href="https://show.metinfo.cn/muban/M1156012/359/app/system/include/public/bootstrap/css/bootstrap.min.css" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/login.css"/>


</head>

<body>
<div class="container met-head">

    <div class="row">
        <div class="col-xs-6 col-sm-6 logo">
            <ul class="list-none">
                <li><a href="login.jsp" class="met-logo"><img src="../image/login/login_logo.jpg"/></a>
                </li>

                <li>会员登录</li>

            </ul>
        </div>

        <div class="col-xs-6 col-sm-6 user-info">
            <ol class="breadcrumb pull-right">

                <li><a href="../index.jsp" title="返回首页">返回首页</a></li>
            </ol>
        </div>
    </div>

</div>

<div class="login_index met-member">
    <div class="container">
        <form method="post" action="login" >
            <input type="hidden" name="gourl" value=""/>
            <div class="form-group">
                <input type="text" name="username" class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码">
            </div>
            <% if(error!=null) { %>
            <p align="center"><font color="red"><%=error%></font></p>
            <% }%>

            <button class="btn btn-lg btn-primary btn-block" type="submit" >登录</button>
            <button class="btn btn-lg btn-primary btn-block" type="reset" >重置</button>

            <a class="btn btn-lg btn-info btn-block" href="register.jsp">没有账号？现在去注册</a>

        </form>
    </div>
</div>

<footer class="container met-footer">
    <p>磬苑电影有限公司</p>

</footer>


</body>

</html>