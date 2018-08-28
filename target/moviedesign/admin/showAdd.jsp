<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cn.movie.beans.Show" %>
<%@ page import="java.sql.SQLException" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

	PreparedStatement ps;
	ResultSet rs;
	List <String> movieList = new ArrayList<>();
	List <String> cinemaList = new ArrayList<>();
	Map <String,String> roomMap = new HashMap<>();


	Connection connection = DBUtil.getConnection();
	String sql = "SELECT movie_name FROM t_movie";
	String sql1 = "SELECT cinema_name FROM t_cinema";
	String sql2 = "SELECT cinema_name,room_name FROM t_room";

	try {
		ps = connection.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()) {
			String movie_name = rs.getString("movie_name");
			movieList.add(movie_name);
		}
		ps = connection.prepareStatement(sql1);
		rs = ps.executeQuery();
		while (rs.next()) {
			String cinema_name = rs.getString("cinema_name");
			cinemaList.add(cinema_name);
		}
        ps = connection.prepareStatement(sql2);
        rs = ps.executeQuery();
        while (rs.next()) {
            String room_name=rs.getString("room_name");
            String cinema_name = rs.getString("cinema_name");
            roomMap.put(cinema_name,room_name);
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
		body {

			padding-bottom: 40px;
			background-color:#e9e7ef;
			font-size:20px;
		}

		@media (max-width: 980px) {
			/* Enable use of floated navbar text */
			.navbar-text.pull-right {
				float: none;
				padding-left: 5px;
				padding-right: 5px;
			}
		}

		select{
			direction: rtl;
			width: 300px;


		}
		select,option,#datetime{
			font-size: 15px;
		}


	</style>
</head>
<body>
<form action="addshow" method="post">
	<table class="table table-bordered table-hover definewidth m10" style="margin-left:3%;margin-top:5%;">
		<tr>
			<td width="10%" class="tableleft"  >电影名</td>

			<td><select name="movie_name" required >
				<option value="null">请选择电影名</option>
				<%
					for (int i = 0; i < movieList.size(); i++)//循环打印

					{
						String  movie= movieList.get(i);//循环打印
				%>
				<option><%=movie%></option>
				<% } %>

			</select></td>

		</tr>
		<tr>
			<td class="tableleft"  >影院名</td>
			<td> <select name="cinema_name" id="cinema_name" >
				<option>请选择影院</option>

			<%
				for (int j = 0; j < cinemaList.size(); j++)//循环打印

				{
					String  cinema= cinemaList.get(j);//循环打印
			%>
			<option ><%=cinema%></option>
			<% } %>

			</select></td>

		</tr>
		<tr>
			<td class="tableleft"  >影厅名</td>
			<td><select name="room_name" id="room_name">

				<option value="null">请选择影厅</option>
                <option>1号厅</option>
				<option>2号厅</option>
				<option>3号厅</option>
				<option>4号厅</option>
				<option>5号厅</option>
				<option>6号厅</option>
			</select></td>
		</tr>
		<tr>
			<td class="tableleft" >时间</td>
			<td style="height: 40px;width: 430px ">
				<div style="margin:0 auto;">
					<input type="datetime-local"  id="datetime" name="show_time" style="width: 300px"/>
				</div>
			</td>
		</tr>

		<tr>
			<td class="tableleft"></td>
			<td>
				<button style="margin-left:46px;" type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
				<button type="button"  onClick="window.location.href='showList.jsp'"  class="btn btn-success" type="button">返回</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>

