<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.movie.beans.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="cn.movie.utils.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String username =request.getParameter("username");
%>
<script type="text/javascript">
    if(!<%=username%>){
        alert("请先登陆！");
        window.location.href='../jsp/login.jsp';
    }
</script>

<%
	PreparedStatement ps;
	ResultSet rs;
	User user=new User();

	Connection connection = DBUtil.getConnection();
	String sql = "select *from t_user where user_name=?";
	try{
		ps = connection.prepareStatement(sql);
		ps.setString(1, username);
		rs = ps.executeQuery();
		if(rs.next()) {
			user.setUser_id(rs.getString("user_id"));
            user.setUser_name(rs.getString("user_name"));
			user.setUser_sex(rs.getString("user_sex"));
			user.setUser_age(Integer.parseInt(rs.getString("user_age")));
			user.setUser_phone(rs.getString("user_phone"));
			BigDecimal money = new BigDecimal(rs.getString("user_money"));
			user.setUser_money(money);
			user.setUser_pswd(rs.getString("user_pswd"));

		}
	}
	catch (SQLException e) {
		e.printStackTrace();

	}

%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>用户充值</title>

<link rel="stylesheet" type="text/css" href="css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>
<body>
<div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<div class="tr_rechtext">
			<p class="te_retit"><img src="images/coin.png" alt="" />充值中心</p>
			<p>1.充值前请确认您帐号信息正确无误</p>
			<p>2.充值完成后请及时查看账户余额，确认充值成功</p>
		</div>
		<form action="recharge?user_name=<%=username%>" class="am-form" id="doc-vld-msg" method="post">
			<div class="tr_rechbox">
				<div class="tr_rechhead">
					<img src="images/ys_head2.jpg" />
					<p>充值帐号：<input type="text" name="user_name" style="display: none"/><%=user.getUser_name()%></p>

					<div class="tr_rechheadcion">
						<img src="images/coin.png" alt="" />
						<span>当前余额：<span><%=user.getUser_money()%>元</span></span>
					</div>
				</div>

				<div class="tr_rechcho am-form-group">
					<span>充值方式：</span>
					<label class="am-radio">
							<input type="radio" name="radio1"  data-am-ucheck required data-validation-message="请选择一种充值方式" value="vx"><img src="images/wechatpay.png">
						</label>
					<label class="am-radio" style="margin-right:30px;">
							<input type="radio" name="radio1" data-am-ucheck data-validation-message="请选择一种充值方式" value="zfb"><img src="images/zfbpay.png">
						</label>
				</div>
				<div>
                   <span>账 号：</span><input type="text" name="account" required style="width: 300px;display:inline-block"/>
				</div>
				<br>
				<div>
                   <span>密 码：</span><input type="password" name="pswd" required style="width: 300px;display:inline-block"/>
				</div>
				<br>
				<div><span>金 额：</span><input type="text"  name="number" required style="width: 300px;display:inline-block"  placeholder="温馨提示：请注意充值额度"/>
				</div>
			</div>
			<div class="tr_paybox">
				<input type="submit" value="确认支付" class="tr_pay am-btn"  style="margin-left: 50px;"/>
                &nbsp;&nbsp;&nbsp;
                <input type="button" value="取消" class="tr_pay am-btn" />
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/ui-choose.js"></script>
<script type="text/javascript">
	$(function() {
		$('#doc-vld-msg').validator({
			onValid: function(validity) {
				$(validity.field).closest('.am-form-group').find('.am-alert').hide();
			},
			onInValid: function(validity) {
				var $field = $(validity.field);
				var $group = $field.closest('.am-form-group');
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg = $field.data('validationMessage') || this.getValidationMessage(validity);
				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	});


</script>
<div style="text-align:center;">
<p>磬苑电影网充值中心</p>
</div>
</body>
</html>