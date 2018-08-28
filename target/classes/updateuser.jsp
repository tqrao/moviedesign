<%@ page import="cn.movie.beans.User" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String error = (String) request.getAttribute("error");
    String username =request.getParameter("username");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="text/javascript">
    if(!<%=username%>){
        alert("请先登陆！");
        window.location.href='login.jsp';
    }
</script>

<%
        PreparedStatement ps;
        ResultSet rs;
        User user=new User();

        Connection connection = DBUtil.getConnection();
        String sql = "select *from t_user where user_name=?";
        try{
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if(rs.next()) {
                user.setUser_id(rs.getString("user_id"));

                user.setUser_sex(rs.getString("user_sex"));
                user.setUser_age(Integer.parseInt(rs.getString("user_age")));
                user.setUser_phone(rs.getString("user_phone"));

                BigDecimal money = new BigDecimal(rs.getString("user_money"));
                user.setUser_money(money);
                user.setUser_pswd(rs.getString("user_pswd"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();

        }

    %>
<html>
<head>
    <title>信息维护</title>
</head>

<body>

<!DOCTYPE HTML>
<html>
<head>
    <meta charequestet="utf-8"/>
    <title>会员中心-磬苑电影网站</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/login.css"/>
</head>

<body>
<div class="container met-head">

    <div class="row">
        <div class="col-xs-6 col-sm-6 logo">
            <ul class="list-none">
                <li><a href="register.jsp" class="met-logo"><img src="../image/login/login_logo.jpg"/></a></li>
                <li>会员信息变更</li>

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
        <form class="form-register met-form" method="post" action="updateuser">


            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">用户id</div>
                    <div class="col-md-9">
                        <input type="text" name="user_id" class="form-control" readonly="readonly"  value="<%=user.getUser_id()%>">
                    </div>
                </div>
            </div>


            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">用户名</div>
                    <div class="col-md-9">
                        <input type="text" name="user_name" class="form-control" value="<%=username%>">

                    </div>
                </div>
            </div>


            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">年龄</div>
                    <div class="col-md-9">
                        <input type="text" name="user_age" class="form-control" value="<%=user.getUser_age()%>">
                    </div>
                </div>
            </div>


            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">密码</div>
                    <div class="col-md-9">
                        <input type="text" name="user_pswd" class="form-control" value="<%=user.getUser_pswd()%>">
                    </div>
                </div>
            </div>
            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">账户余额</div>
                    <div class="col-md-9">
                        <input type="text" name="user_money" class="form-control" readonly="readonly" value="<%=user.getUser_money()%>">

                    </div>
                </div>
            </div>


            <div class="form-group met-form-choice">
                <div class="row">
                    <div class="met-form-file-title col-md-3">联系方式</div>
                    <div class="col-md-9">
                        <input type="text" name="user_phone" class="form-control" value="<%=user.getUser_phone()%>">
                    </div>
                </div>
            </div>


            <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
            <button class="btn btn-lg btn-primary btn-block" onclick=window.open('../index.jsp','_self')>返回</button>

        </form>
    </div>
</div>
<footer class="container met-footer">
    <p>磬苑电影有限公司</p>
</footer>

</body>
</html>

