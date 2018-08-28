<%--
  Created by IntelliJ IDEA.
  User: Sqirt
  Date: 2018/4/18
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--/获取时间戳/--%>
<% java.util.Date date = new java.util.Date();
    long time = date.getTime();
    String timestamp = time + ""; %>
<% String error = (String) request.getAttribute("error");%>
<html>
<head>
    <title>注册</title>
</head>

<body>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <title>会员中心-磬苑电影网站</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <meta name="generator" content="MetInfo"
          data-variable="https://show.metinfo.cn/muban/M1156012/359/|cn||||M1156012"/>

    <link rel="stylesheet" type="text/css" href="https://show.metinfo.cn/muban/M1156012/359/app/system/include/public/bootstrap/css/bootstrap.min.css"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet"  href="../css/login.css"/>
</head>

<body>
<div class="container met-head">

    <div class="row">
        <div class="col-xs-6 col-sm-6 logo">
            <ul class="list-none">
                <li><a href="register.jsp" class="met-logo"><img src="../image/login/login_logo.jpg"/></a></li>
                <li>会员注册</li>

            </ul>
        </div>

        <div class="col-xs-6 col-sm-6 user-info">
            <ol class="breadcrumb pull-right">

                <li><a href="../index.jsp" title="返回首页">返回首页</a></li>
            </ol>
        </div>
    </div>

</div>

<div class="register_index met-member">
    <div class="container">
        <form class="form-register met-form" method="post" action="register">

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-id-card-o"></i></span>
                    <input type="text" name="user_id"  class="form-control" placeholder="会员id"
                           value="<%=timestamp%>" readonly="readonly"
                    >
                </div>
            </div>


                <div class=" form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="user_name" class="form-control" placeholder="会员名"/>

                    </div>
                </div>



                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
                        <input type="password" name="user_pswd" class="form-control" placeholder="密码">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-check-square"></i></span>
                        <input type="password" name="user_pswd1"  data-password="password" class="form-control" placeholder="重复密码">

                    </div>
                </div>
              <% if(error!=null) { %>
            <p align="center"><font color="red"><%=error%></font></p>
               <% }%>


                <div class="form-group met-more text-muted">
                    <hr/>
                    <span>更多资料</span>
                </div>


                <div class="form-group met-form-choice">
                    <div class="row">
                        <div class="met-form-file-title col-md-3">年龄</div>
                        <div class="col-md-9">
                            <input type="text" name="user_age" class="form-control" value="" placeholder="年龄">
                        </div>
                    </div>
                </div>


                <div class="form-group met-form-choice">
                    <div class="row">
                        <div class="met-form-file-title col-md-3">性别</div>
                        <div class="col-md-9">
                           <input type="text" name="user_sex" class="form-control" list="sex" placeholder="性别">
                            <datalist id="sex">
                                <option>男</option>
                                <option>女</option>
                            </datalist>

                        </div>
                    </div>
                </div>
                <div class="form-group met-form-choice">
                    <div class="row">
                        <div class="met-form-file-title col-md-3">联系方式</div>
                        <div class="col-md-9">
                            <input type="text" name="user_phone" class="form-control" value="" placeholder="联系方式">
                        </div>
                    </div>
                </div>





                <button class="btn btn-lg btn-primary btn-block" type="submit">立即注册</button>
                <div class="login_link"><a
                        href="login.jsp">已有账号？点击这里登陆</a></div>
        </form>
    </div>
</div>


<footer class="container met-footer">
    <p>磬苑电影有限公司</p>

</footer>

</body>
</html>

