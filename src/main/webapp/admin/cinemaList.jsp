<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="cn.movie.beans.Cinema" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.SQLException" %>
<%

    PreparedStatement ps;
    ResultSet rs;
    List<Cinema> cinemaList = new ArrayList<>();

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_cinema";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            int cinema_id = rs.getInt("cinema_id");
            String cinema_name = rs.getString("cinema_name");
            String cinema_addr = rs.getString("cinema_addr");
            String cinema_info = rs.getString("cinema_info");

            Cinema cinema = new Cinema();

            cinema.setCinema_name(cinema_name);
            cinema.setCinema_id(cinema_id);
            cinema.setCinema_addr(cinema_addr);
            cinema.setCinema_info(cinema_info);


            cinemaList.add(cinema);
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
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />

    <style type="text/css">
        body {
            font-size: 14px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
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
        /*文字居中显示*/
        th,td{
            text-align: center;
        }
    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="cinemaQuery.jsp?kd=<%=request.getParameter("kd")%>" method="get">
    <font color="#000000"><strong>关键字：</strong></font>
    <input type="text" name="kd" id="kd" class="abc input-default" required placeholder="输入关键字">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary bt-sm">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success bt-sm">
        <a href="cinemaAdd.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">添加影院</a></button>
</form>
<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead >
    <tr>
        <th style="width:80px">影院编号</th>
        <th style="width:180px">影院名</th>
        <th>地址</th>
        <th>简介</th>
        <th style="width:120px;">删除</th>

    </tr>
    </thead>
    <%
        for (int i = 0; i < cinemaList.size(); i++)//循环打印

        {
            Cinema cinema = cinemaList.get(i);//循环打印

    %>
    <form action="handlecinema?cinema_id=<%=cinema.getCinema_id()%>" method="post">
    <tr>
        <td ><%=cinema.getCinema_id()%></td>
        <td ><%=cinema.getCinema_name()%></td>
        <td style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;"><%=cinema.getCinema_addr()%></td>
        <td style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;"><%=cinema.getCinema_info()%></td>

        <td>
            <button type="submit" style="text-align: center;" class="btn btn-danger btn-xs" name="del">删除</button>
        </td>
    </tr>
    </form>
    <%
        }
    %>

</table>

</body>
</html>


