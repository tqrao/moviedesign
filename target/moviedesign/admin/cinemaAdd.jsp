<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
            font-size: 15px;
            padding-bottom: 40px;
            background-color:#e9e7ef;

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

    <form class="form-inline definewidth m20" >
        <button type="button" class="btn btn-warning"><a style="text-decoration:none;color: #FFFFFF;font-weight: bold">新增</a></button>
    </form>
<form action="addcinema" method="post">
    <table class="table table-bordered table-hover definewidth m10" style="margin-left:3%;margin-top:5%;">
        <tr>
            <td width="10%" class="tableleft"  >影院名</td>
            <td><input type="text" name="cinema_name" /></td>

        </tr>
        <tr>
            <td class="tableleft" class="tableleft" >地址</td>
            <td><input type="text" name="cinema_addr" /></td>
        </tr>
        <tr>
            <td class="tableleft">简介</td>
            <td style="height: 40px;width: 430px ">
                <div style="margin:0 auto;">
                    <textarea  id="cinema_info" cols="30" rows="10" name="cinema_info" placeholder="影院简介" /></textarea>
                </div>
            </td>
        </tr>

        <tr>
            <td class="tableleft"></td>
            <td>
                <button style="margin-left:46px;" type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
                <button type="button"  onClick="window.location.href='cinemaList.jsp'"  class="btn btn-success" type="button">返回</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
