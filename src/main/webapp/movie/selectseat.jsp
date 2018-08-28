<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String movie_name = request.getParameter("moviename");
    String user_name = request.getParameter("username");
    String show_id = request.getParameter("show_id");

    PreparedStatement ps;
    ResultSet rs;
    String price = "";
    Connection connection = DBUtil.getConnection();
    String sql = "SELECT movie_price FROM t_movie WHERE movie_name=?";

    try {
        ps = connection.prepareStatement(sql);
        ps.setString(1, movie_name);
        rs = ps.executeQuery();
        if (rs.next()) {
            price = rs.getString("movie_price");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    String sql1 = "select row,col,t_show.room_name,t_show.cinema_name from t_show,t_room " +
            "where show_id=? and t_show.room_name=t_room.room_name " +
            "and t_show.cinema_name=t_room.cinema_name";
           int  row=0,col=0;String  room_name="",cinema_name="";
    try {
        ps = connection.prepareStatement(sql1);
        ps.setInt(1, Integer.parseInt(show_id));
        rs = ps.executeQuery();
        if (rs.next()) {
           row = rs.getInt("row");
           col = rs.getInt("col");
           room_name = rs.getString("room_name");
            cinema_name = rs.getString("cinema_name");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>select seat</title>
    <link rel="stylesheet" href="css/selectbase.css">
    <link rel="stylesheet" href="css/selectapp.css" type="text/css"/>
</head>
<body>
<div class="wrap">
    <div class="box">
        <div class="header">
            <p style="text-align: center"><%=movie_name%></p>
        </div>
        <div class="tittle">
            <div class="t_1">
                <span class="sp1"></span>
                <p>可选</p>
            </div>
            <div class="t_2">
                <span class="sp2"></span>
                <p>已选</p>
            </div>
            <div class="t_3">
                <span class="sp3"></span>
                <p>已售</p>
            </div>
        </div>
        <img src="../image/pingmu.png" class="pingmu">
        <div class="content">
            <div class="content">
                <% for (int i = 1; i <= row; i++) { %>

                <div class="<%=i%>row" pai="<%=i%>">
                    <ul>
                        <%

                            double y = (1088 - ((double)col - 1) * 10) * 1.0 / col;
                            for (int j = 1; j <=col; j++) {
                                int typ=0;

                                String sql2 = "SELECT seat_type FROM t_seat WHERE show_id=? and " +
                                        "seat_row=? and seat_col=?";
                                try {
                                    ps = connection.prepareStatement(sql2);
                                    ps.setInt(1, Integer.parseInt(show_id));
                                    ps.setInt(2, i);
                                    ps.setInt(3, j);
                                    rs = ps.executeQuery();
                                    if (rs.next()) {
                                        typ = rs.getInt("seat_type");

                                    }

                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }

                        %>
                                <li typ="<%=typ%>" onClick="check(this)" style="width:<%=(int)y-2%>px"></li>

                        <%}%>

                    </ul>
                </div>

                <% }%>
            </div>
        </div>
            <div class="zw">
                <p>已选座位<span>最多可以选择5个座位</span></p>
                <div class="yxz"></div>
            </div>
        </div>
        <div class="footer">
            <div class="f_left">
                <div class="t_left">合计：<span class="rmb">¥<span>0</span></span>
                </div>
                <div class="t_right">¥<span class="danjia"></span>*<span class="num">0</span></div>
            </div>
            <div class="f_right"><a href='../jsp/creatorder.jsp?moviename=<%=movie_name%>&user_name=<%=user_name%>&show_id=<%=show_id%>'>确认选座</a></div>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/common1.js"></script>
    <script type="text/javascript">
        //判断页面加载完成
        window.onload = function () {
            if (document.readyState == "complete") {
                $("body").show();
            }
        };
        var arr = []; //已选座位数组
        var dj =<%=price%>; //电影票单价 number
        $(".danjia").text(dj);
        /*
         遍历检查售票状态
         typ ==0 可选
         typ ==1 已选
         typ ==2 已售
         */
        $(".content li").each(function (index) {
            var typ = $(".content li").eq(index).attr("typ");
            if (typ == "2") {
                $(".content li").eq(index).css("background", "#0099ff");
            }
        });

        //已选座位添加
        function add(msg) {
            var html = '<div>' + msg + '</div>';
            return html;
        }

        //选座点击事件
        function check(dom) {
            var txt = $(dom).parent().parent().attr('pai') + "排" + parseInt($(dom).index() + 1) + "座";
            var typ = $(dom).attr("typ");
            if (typ == "0") {
                if (arr.length > 4) {
                    alert("一人只能选择5个座位！");
                    return false;
                } else {
                    $(dom).css("background", "#fe3f55");
                    $(dom).attr("typ", "1");
                    arr.push(txt);
                    $(".yxz").append(add(txt));
                    $(".num").text(arr.length);//已选电影票数量
                    $(".rmb span").text(dj * arr.length);//已选电影票总价
                }
            } else if (typ == "2") {
                alert("该座位已售出！");
                return false;
            } else {
                $(dom).css("background", "#f5f5f5");
                $(dom).attr("typ", "0");
                var index = arr.indexOf(txt);
                arr.removeByValue(txt);//指定数组删除
                $(".yxz div").eq(index).remove();
                $(".num").text(arr.length);//已选电影票数量
                $(".rmb span").text(dj * arr.length);//已选电影票总价
            }
        }

        //数组删除指定元素方法
        Array.prototype.removeByValue = function (val) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == val) {
                    this.splice(i, 1);
                    break;
                }
            }
        }
    </script>
</body>
</html>