<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="cn.movie.beans.Movie" %>
<!DOCTYPE html>
<html>
<%
    Movie movie =(Movie)request.getAttribute("movie");
%>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />


    <style type="text/css">
        body {font-size: 15px;
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


    </style>
</head>
<body>
<script  src="js/ckform.js"></script>
<form class="form-inline definewidth m20" >
    <button type="button" class="btn btn-warning btn-sm"><a href="#" style="text-decoration:none;color: #FFFFFF;font-weight: bold">编辑</a></button>
</form>
<form action="updatemovie?movie_id=<%=movie.getMovie_id()%>" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">
        <tr>
            <td class="tableleft">电影名</td>
            <td><input type="text" name="movie_name" value="<%=movie.getMovie_name()%>"/></td>

            <td class="tableleft">类型</td>
            <td>
                <input type="text" name="movie_type" value="<%=movie.getMovie_type()%>" />
            </td>
        </tr>

        <tr>
            <td class="tableleft">导演</td>
            <td>
                <input type="text" name="director" value="<%=movie.getDirector()%>"/>
            </td>

            <td class="tableleft"  >主演</td>
            <td>
                <input type="text" name="roles" value="<%=movie.getRoles()%>"/>
            </td>
        </tr>

        <tr>
            <td class="tableleft">票价</td>
            <td>￥<input type="text" name="movie_price" value="<%=movie.getMovie_price()%>"/></td>

            <td class="tableleft">电影图片</td>
            <td style="width: 196px; ">
                <input type="text" name="movie_img"  value="<%=movie.getMovie_img()%>" /><td>
        </tr>



        <tr>
            <td class="tableleft">上映时间</td>
            <td><input type="date" name="screentime" value="<%=movie.getScreentime()%>"/></td>
        </tr>

        <tr>
            <td class="tableleft">电影简介</td>
            <td><textarea name="movie_info" id="movie_info"  style="width:available;height:200px;resize: vertical;" ><%=movie.getMovie_info()%></textarea></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button style="margin-left:5px;"  class="btn btn-primary" type="submit">保存</button>
                &nbsp;&nbsp;<button type="reset" class="btn btn-danger" name="reset" id="reset">重置</button>
                &nbsp;&nbsp;<button type="button" class="btn btn-success" name="back" onclick="javascript :history.back(-1);">返回</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
