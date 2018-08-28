<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.beans.Room" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.SQLException" %>
<%

    PreparedStatement ps;
    ResultSet rs;
    List<Room> roomList = new ArrayList<>();
    String kd =request.getParameter("kd");

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_room where cinema_name LIKE '%"+kd+"%'";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            int room_id = rs.getInt("room_id");
            String cinema_name = rs.getString("cinema_name");
            String room_name = rs.getString("room_name");
            int row = rs.getInt("row");
            int col = rs.getInt("col");

            Room room = new Room();

            room.setCinema_name(cinema_name);
            room.setRoom_id(room_id);
            room.setRoom_name(room_name);
            room.setRow(row);
            room.setCol(col);

            roomList.add(room);
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
            font-size: 16px;
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
<form class="form-inline definewidth m20" >
    <button type="button" class="btn btn-success btn-sm"><a href="roomList.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">返回</a></button>
</form>
<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead >
    <tr>
        <th>影厅编号</th>
        <th>影院名</th>
        <th>影厅名</th>
        <th>座位排数</th>
        <th>座位列数</th>
    </tr>
    </thead>
    <%
        for (int i = 0; i < roomList.size(); i++)//循环打印

        {
            Room room = roomList.get(i);//循环打印

    %>
    <form action="handleroom?room_id=<%=room.getRoom_id()%>" method="post">
        <tr>
            <td><%=room.getRoom_id()%></td>
            <td><%=room.getCinema_name()%></td>
            <td><%=room.getRoom_name()%></td>
            <td><%=room.getRow()%></td>
            <td><%=room.getCol()%></td>
        </tr>
    </form>
    <%
        }
    %>



</table>

</body>
</html>

