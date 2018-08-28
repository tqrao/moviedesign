<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String adminname=request.getParameter("adminname");%>
<html>
<head>
    <meta charset="utf-8">
    <title>磬苑电影网站</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="./Css/adminStyle.css" rel="stylesheet" type="text/css"/>

    <title>磬苑电影管理系统</title>
    <script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                $(".div2").click(
                    function () {
                        $(this).next("div").slideToggle("slow").siblings(
                            ".div3:visible").slideUp("slow");
                    });
            });

        function openurl(url) {
            var rframe = parent.document.getElementById("rightFrame");
            rframe.src = url;
        }
    </script>
    <style>
        body {
            margin: 0;
            font-family: 微软雅黑;
            /*background-image: url(./images/.jpg);*/
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-color: #DDDDDD

        }



        .title {
            float: left;
            margin: -32px 20px;
            font-size: 40px;
            color: black;
            font-height: 55px;
            font-family:楷体;
        }

        .top2 {
            position: absolute;
            /*top: 20px; */
            width: 100%;
            height:97px;
            text-align: center;
            color: #ccffff;
            background-color: #a6e1ec;
        }

        .left {
            position: absolute;
            left: 0px;
            top: 97px;
            width: 200px;
            height: 85%;
            border-right: 1px solid #9370DB;
            color: #000000;
            font-size: 20px;
            text-align: center;
            background-color: #a6e1ec;
        }

        .right {
            position: absolute;
            left: 200px;
            top: 97px;
            width: 85.2%;
            height: 85%;
            border-top: 0px solid #484860;
            font-size: 14px;
            text-align: center;
        }


        .div1 {
            text-align: center;
            width: 200px;
            padding-top: 10px;
        }

        .div2 {
            height: 40px;
            line-height: 40px;
            cursor: pointer;
            font-size: 18px;
            position: relative;
            border-bottom: #ccc 0px dotted;
        }

        .spgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/1.png);
        }

        .yhgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .gggl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .zlgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .pjgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .tcht {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/2.png);
        }



        .div3 ul {
            margin: 0;
            padding: 0;
        }

        .div3 li {
            height: 30px;
            line-height: 30px;
            list-style: none;
            border-bottom: #ccc 1px dotted;
            text-align: center;
        }

        .a {
            text-decoration: none;
            color: #000000;
            font-size: 15px;
        }

        .a1 {
            text-decoration: none;
            color: #000000;
            font-size: 18px;
        }
    </style>
</head>
<body>


<div class="top2">
    <div class="title">
        <h3>磬苑电影管理系统</h3>
    </div>
    <div class="fr top-link">
        <a href="#" target="mainCont" title="DeathGhost"><i
                class="adminIcon"></i><span>管理员：<%=adminname%></span></a>
    </div>
</div>

<div class="left">
    <div class="div1">
        <div class="left_top">
            <img src="images/leftficon/icon1.jpg">
            <img src="images/leftficon/icon2.jpg" >
            <img src="images/leftficon/icon3.jpg">
            <img src="images/leftficon/icon4.jpg">
        </div>

        <a class="a" href="javascript:void(0);" onClick="openurl('userList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="yhgl"></div>
                用户管理
            </div>
        </a>

        <a class="a" href="javascript:void(0);" onClick="openurl('movieList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="spgl"></div>
                电影管理
            </div>
        </a>
        <a class="a" href="javascript:void(0);" onClick="openurl('cinemaList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="spgl"></div>
                影院管理
            </div>
        </a>

        <a class="a" href="javascript:void(0);" onClick="openurl('roomList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="spgl"></div>
                影厅管理
            </div>
        </a>

        <a class="a" href="javascript:void(0);" onClick="openurl('orderList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="zlgl"></div>
                订单管理
            </div>
        </a>
        <a class="a" href="javascript:void(0);" onClick="openurl('showList.jsp?adminname=<%=adminname%>');">
            <div class="div2">
                <div class="pjgl"></div>
                排片管理
            </div>
        </a>

        <a class="a" href="javascript:void(0);" onClick="openurl('commentList.jsp');">
            <div class="div2">
                <div class="gggl"></div>
                评论管理
            </div>
        </a>



        <a class="a1" href="../index.jsp">
            <div class="div2">
                <div class="tcht"></div>
                退出后台
            </div>
        </a>
    </div>
</div>

<div class="right">
    <iframe id="rightFrame" name="rightFrame" width="100%" height="100%"
            scrolling="auto" marginheight="0" marginwidth="0" align="center"
            style="border: 0px solid #CCC; margin: 0; padding: 0;"></iframe>
</div>


</body>
</html>
