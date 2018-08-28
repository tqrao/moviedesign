<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    PreparedStatement ps;
    ResultSet rs;
    List <String> cinemaList = new ArrayList<>();
    Connection connection = DBUtil.getConnection();
    String sql1 = "SELECT cinema_name FROM t_cinema";
    try {
        ps = connection.prepareStatement(sql1);
        rs = ps.executeQuery();
        while (rs.next()) {
            String cinema_name = rs.getString("cinema_name");
            cinemaList.add(cinema_name);
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
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.sorted.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/showdate.js"></script>
    <style type="text/css">
        body {font-size: 20px;
             padding-bottom: 40px;
             background-color:#e9e7ef;
             font-size:17px;
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
<form action="addroom" method="post">
<table class="table table-bordered table-hover definewidth m10" style="margin-left:3%;margin-top:5%;">
    <tr>
        <td width="10%" class="tableleft"  >影院名</td>
        <td> <select name="cinema_name" required style="width:222px;" >
            <option></option>
            <%
                for (int j = 0; j < cinemaList.size(); j++)//循环打印

                {
                    String  cinema= cinemaList.get(j);//循环打印
            %>
            <option  style="text-align: right"><%=cinema%></option>
            <% } %>

        </select></td>
     
    </tr>
    <tr>
        <td class="tableleft" class="tableleft" >影厅名</td>
        <td><input type="text" name="room_name" /></td>
    </tr> 
    <tr>
        <td class="tableleft" >座位行数</td>
        <td style="height: 40px;width: 430px ">
            <div style="margin:0 auto;">
	             <input type="text" id="row" name="row" placeholder="请输入行数" />
             </div> 
        </td>
    </tr> 
    <tr>
        <td class="tableleft">座位列数</td>
        <td style="height: 40px;width: 430px ">
            <div style="margin:0 auto;">
	             <input type="text" id="col" name="col" placeholder="请输入列数" />
             </div> 
        </td>
    </tr>  
    <tr>
        <td class="tableleft"></td>
        <td>
            <button style="margin-left:46px;" type="submit" class="btn btn-primary btn-sm" type="button">保存</button>&nbsp;&nbsp;
            <button type="button"  onClick="window.location.href='roomList.jsp'"  class="btn btn-success btn-sm" type="button">返回</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
