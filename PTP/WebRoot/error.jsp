<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Error</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body style="font-family: 华文楷体; font-size: 20px; color: red">
		<div align="center">
			<img alt="" src="./Res/fail.png">
			抱歉,出错了 (⊙o⊙)？
			<br>
			<br>
			<table
				style="width: 38%; font-family: 华文楷体; color: green; border-style: none"
				bordercolor="firebrick" border="1">
				<tr>
					<td width="30%">
						注册出错?
					</td>
					<td>
						<ul>
							<li>
								用户名已经存在
							</li>
							<li>
								学号已被注册
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						登录出错?
					</td>
					<td>
						<ul>
							<li>
								登录选项不正确:管理员、教师、学生
							</li>
							<li>
								用户名or密码不正确
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						提交代码出错?
					</td>
					<td>
						<ul>
							<li>
								好像会有很多问题
							</li>
							<li>
								请反馈具体情况至shawzt@gmail.com。务必描述清楚
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						其他?
					</td>
					<td>
						<ul>
							<li>
								请反馈具体情况至shawzt@gmail.com。务必描述清楚
							</li>
						</ul>
					</td>
				</tr>
			</table>
			<br>
			你将在
			<label id="left" style="color: red"></label>
			秒之后返回首页……
			<br>
			<a href="./welcome.jsp">点我返回</a>
		</div>
		<br>
	</body>
	<script type="text/javascript">
var timer = window.setInterval(Timer, 1000);
var left = 10;
function Timer() {
	document.getElementById("left").innerHTML = left + " ";
	left--;
	if (left == 0) {
		window.clearInterval(timer);
		window.location.href = "./welcome.jsp";
	}
}
</script>
</html>
