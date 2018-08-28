<%@page import="cn.movie.beans.Movie" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="cn.movie.dao.impl.MovieDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
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
            String movie_type = rs.getString("movie_type");
            BigDecimal movie_price = new BigDecimal(rs.getString("movie_price"));
            String director = rs.getString("director");
            String roles = rs.getString("roles");
            String screentime = rs.getString("screentime");
            String movie_img = rs.getString("movie_img");
            Movie movie = new Movie();

            movie.setMovie_name(movie_name);

            movie.setDirector(director);
            movie.setRoles(roles);
            movie.setMovie_type(movie_type);
            movie.setMovie_price(movie_price);
            movie.setScreentime(screentime);
            movie.setMovie_img(movie_img);
            movieList.add(movie);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>movie display</title>
    <!-- Bootstrap style -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen"/>
    <link href="css/base.css" rel="stylesheet" media="screen"/>
    <!-- Bootstrap style responsive -->
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
</head>

<body>


<div id="logoArea" class="navbar">
    <div class="navbar-inner">
        <a class="brand" href="#"><img src="img/logo.png" alt="电影"></a>
        <form class="form-inline navbar-search" method="post" action="#" style="margin-left: 320px;">
            <input id="srchFld" class="srchTxt" type="text" placeholder="请输入关键字" title="搜索"/>
            <button type="submit" id="submitButton" class="btn btn-primary">查询</button>
        </form>
        <ul id="topMenu" class="nav pull-right">
            <li class=""><a href="../index.jsp">返回首页</a></li>
        </ul>
    </div>
</div>

<ul class="thumbnails" style="margin-left: 60px">
    <%
        for (int i = 0; i < movieList.size(); i++)//循环打印

        {
            Movie movie = movieList.get(i);//循环打印
    %>
    <%-- <form action="order" method="post">--%>

    <li class="span3">
        <form>
            <div class="thumbnail">
                <a href="#"><img src="<%=movie.getMovie_img()%>" alt="" width="160px" height="160px"></a>
                <div class="caption">
                    <h5><%=movie.getMovie_name()%>
                    </h5>
                    <p>
                        类型：<%=movie.getMovie_type()%><br>
                        导演：<%=movie.getDirector()%><br>
                        <a class="btn btn-warning" >￥<%=movie.getMovie_price()%>  </a>
                        &nbsp;
                        <a class="btn btn-danger" href="<%=basePath%>movie/detailmovie.jsp?movie_name=<%=movie.getMovie_name()%>">详情</a>
                    </p>

                </div>

            </div>
        </form>
    </li>
    <%
        }
    %>


</ul>

</body>
</html>