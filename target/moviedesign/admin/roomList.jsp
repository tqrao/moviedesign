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

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_room";
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
<form class="form-inline definewidth m20" action="roomQuery.jsp?kd=<%=request.getParameter("kd")%>" method="get">
    <font color="#000000"><strong>关键字：</strong></font>
    <input type="text" name="kd" id="kd" class="abc input-default" required placeholder="输入影院相关的关键字">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary btn-sm">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success btn-sm">
        <a href="roomAdd.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">添加影厅</a></button>
</form>
<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead >
    <tr>
        <th>影厅编号</th>
        <th>影院名</th>
        <th>影厅名</th>
        <th>座位排数</th>
        <th>座位列数</th>
        <th style="width:120px;">菜单</th>

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
        <td>
            <button type="submit" style="text-align: center;" class="btn btn-danger btn-sm" name="del" >删除</button>
        </td>
    </tr>
    </form>
    <%
        }
    %>



</table>

</body>
</html>

