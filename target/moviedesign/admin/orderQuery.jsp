<%@page import="cn.movie.beans.Movie" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="cn.movie.dao.impl.MovieDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="cn.movie.beans.Order" %>

<%
    String kd =request.getParameter("kd");
    PreparedStatement ps;
    ResultSet rs;
    List<Order> orderList = new ArrayList<>();

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_order where user_name or cinema_name or cinema_addr or room_name or order_id or showtime or order_date like '%"+kd+"%'";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            String order_id = rs.getString("order_id");
            String user_id = rs.getString("user_id");
            String cinema_id = rs.getString("cinema_id");
            String user_name = rs.getString("user_name");
            String cinema_name = rs.getString("cinema_name");
            String room_id = rs.getString("room_id");
            String room_name = rs.getString("room_name");
            String order_date = rs.getString("order_date").substring(0,19);
            String cinema_addr = rs.getString("cinema_addr");
            String movie_name = rs.getString("movie_name");
            String movie_type = rs.getString("movie_type");
            BigDecimal movie_price = new BigDecimal(rs.getString("movie_price"));
            String showtime = rs.getString("showtime").substring(0,19);
            int seat_row = rs.getInt("seat_row");
            int seat_col = rs.getInt("seat_col");
            int order_count = rs.getInt("order_count");


            Order order = new Order();

            order.setOrder_id(order_id);
            order.setMovie_name(movie_name);
            order.setCinema_name(cinema_name);
            order.setRoom_name(room_name);
            order.setCinema_addr(cinema_addr);
            order.setSeat_row(seat_row);
            order.setSeat_col(seat_col);
            order.setMovie_price(movie_price);
            order.setOrder_count(order_count);
            order.setShowtime(showtime);
            order.setMovie_type(movie_type);
            order.setOrder_date(order_date);
            orderList.add(order);
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
<form class="form-inline definewidth m20">
    <button type="submit" class="btn btn-primary btn-sm"> <a href="orderList.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">返回</a></button>
</form>

<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead>
    <tr>
        <th>订单号</th>
        <th>用户名</th>
        <th>电影名</th>
        <th>地点</th>
        <th>影院地址</th>
        <th>座位</th>
        <th>票价</th>
        <th>票数</th>
        <th>开场时间</th>
        <th>下单时间</th>
        <th>管理菜单</th>
    </tr>
    </thead>
    <%
        for (int i = 0; i < orderList.size(); i++)//循环打印

        {
            Order order= orderList.get(i);//循环打印
    %>
    <form action="handleorder?order_id=<%=order.getOrder_id()%>" method="post">
        <tr>
            <td><%=order.getOrder_id()%>
            </td>
            <td><%=order.getMovie_name()%>
            </td>
            <td> <a href="../jsp/detailmovie.jsp?moviename=<%=order.getMovie_name()%>"name="moviename"><%=order.getMovie_name()%>
            </td>
            <td><%=order.getCinema_name()%><%=order.getRoom_name()%>
            </td>

            <td><%=order.getCinema_addr()%>
            </td>

            <td><%=order.getSeat_row()+"排"+order.getSeat_col()+"列"%>
            </td>
            <td>￥<%=order.getMovie_price()%>
            </td>

            <td ><%=order.getOrder_count()%>
            </td>


            <td><%=order.getShowtime()%>

            </td>
            <td><%=order.getOrder_date()%>
            </td>
            <td>
                <button type="submit" class="btn btn-danger btn-sm">删除</button>
            </td>
        </tr>
    </form>
    <%
        }
    %>
</table>

</body>
</html>
