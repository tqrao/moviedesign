<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.beans.User" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    PreparedStatement ps;
    ResultSet rs;
    List<User> userList = new ArrayList<>();

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_user";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            String user_id = rs.getString("user_id");
            String user_name = rs.getString("user_name");

            String user_sex = rs.getString("user_sex");
            int user_age = rs.getInt("user_age");
            BigDecimal user_money = new BigDecimal(rs.getString("user_money"));
            String user_pswd = rs.getString("user_pswd");
            String user_phone = rs.getString("user_phone");

            User user = new User();

            user.setUser_name(user_name);
            user.setUser_id(user_id);
            user.setUser_age(user_age);
            user.setUser_sex(user_sex);
            user.setUser_money(user_money);
            user.setUser_phone(user_phone);
            user.setUser_pswd(user_pswd);

            userList.add(user);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="Css/style.css"/>

    <style type="text/css">
        body {
            font-size: 15px;
            padding-bottom: 40px;
            background-color: #e9e7ef;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
        th,td{
            text-align: center;
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="userQuery.jsp?kd=<%=request.getParameter("kd")%>" method="get">
    <font color="#000000"><strong>用户昵称：</strong></font>
    <input type="text" name="kd" id="require" class="abc input-default"  required >&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary btn-sm" id="search_btn">查询</button>
</form>

<table class="table table-bordered table-hover definewidth m10" name="usertab">
    <thead >
    <tr >
        <th>昵称</th>
        <th>id</th>
        <th>性别</th>
        <th>年龄</th>
        <th>余额</th>
        <th>密码</th>
        <th>联系方式</th>
        <th style="width: 80px">注销用户</th>

    </tr>
    </thead>
    <%
        for (int i = 0; i < userList.size(); i++)//循环打印

        {
            User user = userList.get(i);//循环打印
            String username = user.getUser_name();
    %>
    <tbody id="show_tbody">
    <form action="deluser?user_name=<%=username%>" method="post">

        <tr id="trr">
            <td><a href="../jsp/detailuser.jsp?username=<%=user.getUser_name()%>" name="user_name"
                   id="uid"><%=user.getUser_name()%>
            </a></td>
            <td><%=user.getUser_id()%>
            </td>
            <td><%=user.getUser_sex()%>
            </td>
            <td><%=user.getUser_age()%>
            </td>
            <td><%=user.getUser_money()%>元
            </td>
            <td><%=user.getUser_pswd()%>
            </td>
            <td><%=user.getUser_phone()%>
            </td>
            <td>
                <button id="del" type="submit" class="btn-danger btn btn-sm">注销</button>
            </td>

        </tr>
    </form>
    </tbody>
    <%
        }
    %>
</table>

</body>
</html>