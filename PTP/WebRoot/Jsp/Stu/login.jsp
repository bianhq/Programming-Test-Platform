<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Date"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%long time = System.currentTimeMillis(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
.content {
	margin-left: 120px;
	width: 240px;
}

.admin {
	color: red;
}

.ts {
	color: blue;
}

table {
	font-family: Sans-serif;
	font-size: 18px;
}
</style>
	</head>

	<body onload="chose()">
		<div class="content">
			<h1>
				登录&nbsp;&nbsp;As
				<select id="cates" name="cates" style="width: 80px; font-size: 18px"
					onchange="chose()">
					<option class="admin" value="1">
						管理员
					</option>
					<option class="ts" value="2">
						教师
					</option>
					<option class="ts" value="3">
						学生
					</option>
				</select>

			</h1>
			<form method="post" action="ulogin.action"
				onsubmit="return login()" target="_parent">
				<input type="hidden" id="cate" name="cate">
				<input type="hidden" name="time" value="<%=time %>">
				<table border="0">
					<tr>
						<td>
							用户名
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id="uname" name="uname" maxlength="10" />
						</td>
					</tr>
					<tr>
						<td>
							密码
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="upwd" name="upwd" maxlength="20" />
						</td>
					</tr>
					<tr>
						<td>
							记住我
							<input type="checkbox" id="rem" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" id="sbt" value="登录" style="font-size: 16px" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
	<script type="text/javascript">
function login() {
	with (document.all) {
		if (uname.value == '') {
			alert("登录失败!\n用户名Or密码为空!");
			return false;
		} else
			return true;
	}
}
function chose() {
	with (document.all) {
		cate.value = cates[cates.selectedIndex].value;
	}
}
</script>
</html>
