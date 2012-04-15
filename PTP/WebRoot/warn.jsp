<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.getSession().invalidate();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Warn</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="未登录拦截说">

	</head>

	<body style="font-family: 华文楷体; font-size: 20px">
		<div align="center">
			<img alt="" src="./Res/warn.png">
			<br>
			你还没有登录，将在
			<label id="left" style="color: red"></label>
			秒之后返回首页……
			<br>
			<a href="./welcome.jsp">点我返回</a>
		</div>
		<br>
	</body>
	<script type="text/javascript">
var timer = window.setInterval(Timer, 1000);
var left = 5;
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
