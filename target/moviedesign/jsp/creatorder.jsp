<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Sqirt
  Date: 2018/5/16
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String movie_name = request.getParameter("moviename");
    String show_id = request.getParameter("show_id");
    String user_name = request.getParameter("user_name");

    PreparedStatement ps;
    ResultSet rs;
    String price="";
    String type="";
    Connection connection = DBUtil.getConnection();
    String sql = "SELECT * FROM t_movie WHERE movie_name=?";
    try {
        ps = connection.prepareStatement(sql);
        ps.setString(1, movie_name);
        rs = ps.executeQuery();
        if(rs.next()){
            price = rs.getString("movie_price");
            type =rs.getString("movie_type");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }


    String sql1 = "select room_name,cinema_name,show_time from t_show where show_id=? ";
    String  room_name="",cinema_name="",show_time="";
    try {
        ps = connection.prepareStatement(sql1);
        ps.setInt(1, Integer.parseInt(show_id));
        rs = ps.executeQuery();
        if (rs.next()) {

            room_name = rs.getString("room_name");
            cinema_name = rs.getString("cinema_name");
            show_time=rs.getString("show_time");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>订单信息</title>
    <link rel="stylesheet" href="../css/creatorder.css">
</head>
<body>

<div id="content">
    <!-- InstanceEndEditable -->
    <div class="side">
        <div class="movie-info clearfix">
            <div class="content">
                <p class="name text-ellipsis"><%=movie_name%></p>
                <div class="info-item">
                    <span>类型 :</span>
                    <span class="value"><%=type%></span>
                </div>
            </div>
        </div>

        <div class="show-info">
            <div class="info-item">
                <span>用户名:</span>
                <span class="value text-ellipsis screen">ahu</span>
            </div>
            <div class="info-item">
                <span>影院 :</span>
                <span class="value text-ellipsis"><%=cinema_name%></span>
            </div>
            <div class="info-item">
                <span>影厅 :</span>
                <span class="value text-ellipsis"><%=room_name%></span>
            </div>
            <div class="info-item">
                <span>时间 :</span>
                <span class="value text-ellipsis"><%=show_time.substring(0,16)%></span>
            </div>
            <div class="info-item">
                <span>座号 :</span>
                <span class="value text-ellipsis">1排3座</span>
            </div>


            <div class="info-item">
                <span>票价 :</span>
                <span class="value text-ellipsis">￥<%=price%>/张</span>
            </div>
            <div class="info-item">
                <span>数量 :</span>
                <span class="value text-ellipsis">1张</span>
            </div>
        </div>

        <div class="ticket-info">

            <div class="total-price">
                <span>总价 :</span>
                <span class="price">￥55.00</span>
            </div>
        </div>
        <br>

        <div class="confirm-order">
            <button  onClick="window.location.href='../index.jsp'" style="height:20px;width:100px;float: left;margin-left: 10px">返回</button>
        </div>
    </div>
</div>

</body>
</html>
