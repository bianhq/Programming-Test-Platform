<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
body {
	font-family: Sans-serif;
	font-size: 20px;
}
</style>
	</head>

	<body>
		<ul>
			<li>
				<a target="show" href="listNews.action">主页</a>
			</li>
			<li>
				<a target="show" href="subjects.action">训练集</a>
			</li>
			<li>
				<a target="show" href="lastBack.action">提交反馈</a>
			</li>
			<li>
				<a target="show" href="exams.action">考试集</a>
			</li>
			<li>
				<a target="show" href="./Jsp/Stu/help.jsp">帮助</a>
			</li>
		</ul>
	</body>
</html>
