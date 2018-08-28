<%@page import="cn.movie.beans.Movie" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="cn.movie.dao.impl.MovieDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.utils.DBUtil" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    PreparedStatement ps;
    ResultSet rs;
    List<Movie> movieList = new ArrayList<>();

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_movie";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            String movie_name = rs.getString("movie_name");
            String movie_id = rs.getString("movie_id");
            String movie_type = rs.getString("movie_type");
            String movie_info = rs.getString("movie_info");
            BigDecimal movie_price = new BigDecimal(rs.getString("movie_price"));
            String director = rs.getString("director");
            String roles = rs.getString("roles");
            String screentime = rs.getString("screentime");
            Movie movie = new Movie();

            movie.setMovie_id(movie_id);
            movie.setMovie_name(movie_name);
            movie.setDirector(director);
            movie.setMovie_type(movie_type);
            movie.setMovie_price(movie_price);
            movie.setScreentime(screentime);
            movie.setRoles(roles);
            movie.setMovie_info(movie_info);
            movieList.add(movie);
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
<form class="form-inline definewidth m20" action="movieQuery.jsp?kd=<%=request.getParameter("kd")%>"  method="get">
    <font color="#000000"><strong style="font-size: 16px">关键字：</strong></font>
    <input type="text" name="kd" size="18px" class="abc input-default" required  placeholder="输入电影名，导演，主演，类型等搜索" >&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary btn-sm">查询</button>
    &nbsp;&nbsp;
    <button type="button" class="btn btn-success btn-sm"><a href="movieAdd.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">添加电影</a></button>
</form>

<table class="table table-bordered table-hover definewidth m10" style="table-layout:fixed;">
    <thead>
    <tr>
        <th style="width:50px;">id</th>
        <th style="width:110px;">电影名</th>
        <th style="width:100px;">类别</th>
        <th style="width:90px;">导演</th>
        <th>主演</th>
        <th style="width:60px;">票价</th>
        <th style="width:100px;">上映时间</th>
        <th >简介</th>
        <th style="width:95px;">管理菜单</th>
    </tr>
    </thead>
   <%
        for (int i = 0; i < movieList.size(); i++)//循环打印

        {
            Movie movie = movieList.get(i);//循环打印    
    %>
    <form  action="handlemovie?movie_id=<%=movie.getMovie_id()%>" method="post"><tr>
        <td><%=movie.getMovie_id()%>
        </td>
        <td> <a href="../jsp/detailmovie.jsp?moviename=<%=movie.getMovie_name()%>"name="moviename"><%=movie.getMovie_name()%>
        </td>
        <td><%=movie.getMovie_type()%>
        </td>

        <td><%=movie.getDirector()%>
        </td>

        <td style="width:200px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;"><%=movie.getRoles()%>
        </td>

        <td>￥<%=movie.getMovie_price()%>
        </td>
        <td><%=movie.getScreentime()%>

        </td>
        <td style="width:200px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;"><%=movie.getMovie_info()%>
        </td>
         <td>
             <button type="submit" style="float: left;text-align: left" class="btn btn-warning btn-xs" name="edit">编辑</button>
             <button type="submit" style="float: right;text-align: right" class="btn btn-danger btn-xs" name="del">删除</button>
         </td>
    </tr></form>
    <%
        }
    %>
</table>

</body>
</html>
