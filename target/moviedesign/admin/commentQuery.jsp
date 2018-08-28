<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.beans.Comment" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.SQLException" %>
<%
    PreparedStatement ps;
    ResultSet rs;
    List<Comment> comList= new ArrayList<>();
    String kd =request.getParameter("kd");

    Connection connection = DBUtil.getConnection();
    String sql = "SELECT *FROM t_comment where movie_name or user_name or comment_content like '%"+kd+"%'";
    try {
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            int comment_id = rs.getInt("comment_id");
            String movie_name = rs.getString("movie_name");
            String user_name = rs.getString("user_name");
            String comment_content = rs.getString("comment_content");

            String comment_time = rs.getString("comment_time").substring(0,19);
            Comment com = new Comment();

            com.setComment_id(comment_id);
            com.setComment_content(comment_content);
            com.setComment_time(comment_time);
            com.setMovie_name(movie_name);
            com.setUser_name(user_name);

            comList.add(com);
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
    <script type="text/javascript" src="js/jquery2.js"></script>
    <script type="text/javascript" src="js/jquery.sorted.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>

    <style type="text/css">
        body {
            font-size: 15px;
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
        th,td{
            text-align: center;
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20">

    <button type="submit" class="btn btn-primary btn-sm"> <a href="commentList.jsp" style="text-decoration:none;color: #FFFFFF;font-weight: bold">返回</a></button>&nbsp;&nbsp;

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>id</th>
        <th>电影名</th>
        <th>评论者</th>
        <th>评论时间</th>
        <th>评论内容</th>
        <th>删除</th>

    </tr>
    </thead>
    <%
        for (int i = 0; i < comList.size(); i++)//循环打印

        {
            Comment com = comList.get(i);//循环打印

    %>
    <form action="handlecomment?comment_id=<%=com.getComment_id()%>" method="post">
        <tr>
            <td><%=com.getComment_id()%></td>
            <th><a href="studentdetail.html"><%=com.getMovie_name()%></a></th>
            <td><a href="studentdetail.html"><%=com.getUser_name()%></a></td>
            <td><%=com.getComment_time()%></td>
            <td><%=com.getComment_content()%></td>
            <td><button id="del" type="submit" class="btn-danger btn btn-sm">删除</button></td>
        </tr>
    </form>
    <%
        }
    %>
</table>

</body>
</html>
