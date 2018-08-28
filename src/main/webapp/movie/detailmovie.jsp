<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="cn.movie.beans.Movie" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="cn.movie.beans.Comment" %>
<%@ page import="cn.movie.beans.Show" %>
<%
    String movie_name=request.getParameter("movie_name");
    String user_name=request.getParameter("user_name");
    PreparedStatement ps;
    ResultSet rs;

    Movie movie = new Movie();
    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_movie where movie_name=?";
    try {
        ps = connection.prepareStatement(sql);
        ps.setString(1,movie_name);
        rs = ps.executeQuery();
        if(rs.next()) {
            movie_name = rs.getString("movie_name");
            String movie_type = rs.getString("movie_type");
            BigDecimal movie_price = new BigDecimal(rs.getString("movie_price"));
            String director = rs.getString("director");
            String roles = rs.getString("roles");
            String screentime = rs.getString("screentime");
            String movie_img = rs.getString("movie_img");
            String movie_info = rs.getString("movie_info");

            movie.setMovie_name(movie_name);
            movie.setDirector(director);
            movie.setRoles(roles);
            movie.setMovie_type(movie_type);
            movie.setMovie_price(movie_price);
            movie.setScreentime(screentime);
            movie.setMovie_img(movie_img);
            movie.setMovie_info(movie_info);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }


    List<Comment> comList= new ArrayList<>();
    String sql2 = "SELECT *FROM t_comment where movie_name=?";
    try {
        ps = connection.prepareStatement(sql2);
        ps.setString(1,movie_name);
        rs = ps.executeQuery();
        while (rs.next()) {
            int comment_id = rs.getInt("comment_id");
            String c_movie_name = rs.getString("movie_name");

            String c_user_name = rs.getString("user_name");
            String comment_content = rs.getString("comment_content");
            String comment_time = rs.getString("comment_time").substring(0,19);
            Comment com = new Comment();

            com.setComment_id(comment_id);
            com.setComment_content(comment_content);
            com.setComment_time(comment_time);
            com.setMovie_name(c_movie_name);
            com.setUser_name(c_user_name);

            comList.add(com);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    List<Show> showList = new ArrayList<>();
    String sql1 = "SELECT *FROM t_show where movie_name=?";
    try {
        ps = connection.prepareStatement(sql1);
        ps.setString(1,movie_name);
        rs = ps.executeQuery();
        while (rs.next()) {
            movie_name = rs.getString("movie_name");
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
    <title>movie detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <link href='http://googleapis/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>

    <!--End-top-nav-script-->
</head>
<script type="text/javascript">
    onload = function ()
    {
        setInterval (function ()
        {
            txt.value = new Date ().toLocaleString ('chinese',{hour12:false});
        }, 1000);
    }
</script>
<body>
<!--start-header-->
<div class="header" id="home">
    <div class="container">
        <div class="logo">
            <a href="#"><img src="img/logo.png" alt="" style="margin-top: 15px"></a>
        </div>
        <!--start-top-nav-->
        <nav class="top-nav">
            <ul class="top-nav">
                <li><a href="movieinfo.jsp" class="active">返回</a></li>
            </ul>

        </nav>
        <div class="clearfix"></div>
    </div>
</div>
<!--End-header-->
<!--End-header-->
<div class="single" style="margin-top: 10px">
    <div class="container" >
        <div class="single-main">
            <div class="col-md-8 single-left">
                <div class="single-top">
                    <h3 style="text-align: center"><%=movie.getMovie_name()%></h3>
                    <div style="text-align: center"><img src="<%=movie.getMovie_img()%> " width="400px" height="300px" alt=""/></div>
                    <br>
                    <strong>类型：<%=movie.getMovie_type()%></strong><br>
                    <strong>上映时间：<%=movie.getScreentime()%></strong><br>
                    <strong>导演：<%=movie.getDirector()%></strong><br>
                    <strong>主演：<%=movie.getRoles()%></strong><br>
                    <strong>票价：<%=movie.getMovie_price()%>元</strong><br>
                    <strong>剧情简介：<%=movie.getMovie_info()%></strong><br>

                </div>
                <div class="reply">
                    <form action="selectseat.jsp?showid=<%=request.getParameter("show_id")%>&user_name=<%=user_name%>" method="get">
                    <strong style="font-size: 18px">选择场次:</strong>
                    <select name="show_id" style="width:565px;font-size: 18px;font-family: 楷体,serif;">
                        <option value=""></option>
                        <%
                        for (int j = 0; j < showList.size(); j++){
                        Show show = showList.get(j);
                        %>
                        <option value="<%=show.getShow_id()%>"><%=show.getCinema_name()%>&nbsp;<%=show.getRoom_name()%>&nbsp;<%=show.getShow_time()%>&nbsp;
                        </option>

                        <% } %>
                       <input type="hidden" name="moviename" value="<%=movie_name%>"/>

                    </select>
                    <br>
                    <button style="margin-top:5px;background-color:#0099ff;margin-left: 600px" type="submit" id="submitButton" class="btn btn-primary">
                        购票选座</button>
                    </form>
                </div>
                <div class="comments" style="margin-top: 10px">
                    <h4>评论区</h4>
                    <%
                        for (int i = 0; i < comList.size(); i++)//循环打印

                        {
                            Comment com = comList.get(i);//循环打印

                    %>
                    <div class="comments-main">
                        <div class="col-md-2 cmts-main-left">
                           <%-- <img src="img/men.png" alt="">--%>
                        </div>
                        <div class="col-md-10 cmts-main-right">
                            <div class="cmts">
                                <div class="col-md-6 cmnts-left">
                                    <h5><%=com.getUser_name()%></h5>
                                </div>
                                <div class="col-md-6 cmnts-right">
                                    <a href="#"><%=com.getComment_time()%></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <p><%=com.getComment_content()%></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>


            <div class="col-md-4 single-right" style="margin-top: 50px">
                <strong style="font-size: 22px">评论</strong><br>
                <form  action="addcomment" method="post">
                    <input name="movie_name" type="hidden"  value="<%=movie_name%>"/>

                    <input name="user_name" type="hidden"  value="<%=user_name%>"/>
                   <input id="txt" name="comment_time" style="font-size:18px;text-align: center;border:none;width: 400px;text-align: right">
                   <textarea name="comment_content" id="comment_content" style="margin-top:5px;width:400px;height: 370px"  required placeholder="请输入您对这部电影的评价" ></textarea>
                    <button type="submit" style="margin-left: 183px" class="btn btn-primary ">提交</button>&nbsp;&nbsp;

                </form>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--End-header-->
<!--start-footer-->
<div class="footer">
    <p style="text-align: center">Copyright &copy; 2018.Qingyuan All rights reserved. </p> <br>
    <p style="text-align: center">磬苑电影网</p>
</div>
<!--End-footer-->
</body>
</html>