<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="cn.movie.beans.Show" %>

<%
    PreparedStatement ps;
    ResultSet rs;
    List<Show> showList = new ArrayList<>();
    String kd =request.getParameter("kd");

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_show where movie_name or cinema_name or room_name or show_time LIKE '%"+kd+"%' ";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            String movie_name = rs.getString("movie_name");
            int show_id = rs.getInt("show_id");
            String cinema_name = rs.getString("cinema_name");
            String room_name = rs.getString("room_name");
            String show_time = rs.getString("show_time").substring(0,16);
            Show show = new Show();

            show.setShow_id(show_id);
            show.setMovie_name(movie_name);
            show.setRoom_name(room_name);
            show.setCinema_name(cinema_name);
            show.setShow_time(show_time);

            showList.add(show);
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
            font-size: 12px;
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
<form class="form-inline definewidth m20" >
    <button type="button" class="btn btn-success btn-sm"><a href="showList.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">返回</a></button>
</form>

<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead>
    <tr>
        <th style="width:50px;">id</th>
        <th>电影名</th>
        <th>影院名</th>
        <th>影厅名</th>
        <th>放映时间</th>
    </tr>
    </thead>
    <%
        for (int i = 0; i < showList.size(); i++)//循环打印

        {
            Show show= showList.get(i);//循环打印
    %>
    <form action="handleshow?show_id=<%=show.getShow_id()%>" method="post">
        <tr>
            <td ><%=show.getShow_id()%>
            </td>
            <td> <a href="../jsp/detailmovie.jsp?moviename=<%=show.getMovie_name()%>"name="moviename"><%=show.getMovie_name()%>
            </td>
            <td><%=show.getCinema_name()%>
            </td>
            <td><%=show.getRoom_name()%>
            </td>

            <td ><%=show.getShow_time()%>
            </td>

            </td>

        </tr>
    </form>
    <%
        }
    %>
</table>

</body>
</html>
