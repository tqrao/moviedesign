<%
    String username = request.getParameter("username");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电影预订系统</title>
    <script type="text/javascript">
        function showmenu(str) {
            var subdiv = document.getElementById(str);
            subdiv.style.display = "block";
        }

        function hidemenu(str) {
            var subdiv = document.getElementById(str);
            subdiv.style.display = "none";
        }
    </script>
    <style type="text/css"></style>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="css/roundphoto.css"/>

</head>

<body>
<!--网页导航栏板块-->
<div id="nav">
    <ul><!--无序列表-->
        <li><a></a></li>
        <li style="width: 183px;height:37px;"><a
        ></a></li>

        <li onmouseover="showmenu('bzsy')" onmouseout="hidemenu('bzsy')"><a
                href="javascript:location.reload();">本站首页</a></li>
        <li onmouseover="showmenu('ypgl')" onmouseout="hidemenu('ypgl')"><a href="#">影片管理</a>
            <ul id="ypgl">
                <li><a href="<%=basePath%>movie/movieinfo.jsp?username=<%=username%>">影片浏览</a></li>
            </ul>
        </li>
        <li onmouseover="showmenu('glrk')" onmouseout="hidemenu('glrk')"><a href="#">管理入口</a>
            <ul id="glrk">
                <li><a href="<%=basePath%>jsp/adlogin.jsp">管理登陆</a></li>
            </ul>
        </li>
        <li onmouseover="showmenu('ddgl')" onmouseout="hidemenu('ddgl')"><a href="#">我的订单</a>
            <ul id="ddgl">
                <li><a href="#">订单历史</a></li>
                <li><a href="#">未成订单</a></li>
                <li><a href="<%=basePath%>recharge/reindex.jsp?username=<%=username%>">余额充值</a></li>

            </ul>
        </li>
        <li onmouseover="showmenu('yhgl')" onmouseout="hidemenu('yhgl')"><a href="#">用户管理</a>
            <ul id="yhgl">
                <li><a href="<%=basePath%>jsp/register.jsp">用户注册</a></li>
                <li><a href="<%=basePath%>jsp/login.jsp">用户登陆</a></li>
                <li><a href="<%=basePath%>jsp/updateuser.jsp?username=<%=username%>">信息维护</a></li>
                <li><a href="<%=basePath%>jsp/canceluser.jsp?username=<%=username%>">用户注销</a></li>
            </ul>
        </li>

    </ul>
</div>


<div class="container">
    <div class="list" style="left:-1350px;">
        <img src="./image/firstpage/5.jpg">
        <img src="./image/firstpage/1.jpg">
        <img src="./image/firstpage/2.jpg">
        <img src="./image/firstpage/3.jpg">
        <img src="./image/firstpage/4.jpg">
        <img src="./image/firstpage/5.jpg">
        <img src="./image/firstpage/1.jpg">
    </div>
    <ul class="dots" style="margin-left:30px">
        <li class="active dot"></li>
        <li class="dot"></li>
        <li class="dot"></li>
        <li class="dot"></li>
        <li class="dot"></li>
    </ul>
    <div class="pre"><</div>
    <div class="next">></div>
</div>
<script type="text/javascript" src="js/roundphoto.js"></script>

</body>
</html>