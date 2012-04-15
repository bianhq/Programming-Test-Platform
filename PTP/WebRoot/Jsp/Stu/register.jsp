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
		<title>注册</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="注册页面">
		<style type="text/css">
table {
	font-family: Sans-serif;
	font-size: 18px;
}
</style>
	</head>

	<body>
		<h1 align="center">
			注册----Be a new user!
		</h1>
		<form method="post" action="sturegister.action"
			onsubmit="return onSubmit()" target="_parent">
			<table align="center" border="0">
				<tr>
					<td align="center" width="80px">
						用户名
					</td>
					<td>
						<input type="text" id="uname" name="uname" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						密码
					</td>
					<td>
						<input type="text" id="upwd" name="upwd" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						学号
					</td>
					<td>
						<input type="text" id="stuNo" name="stuNo" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						姓名
					</td>
					<td>
						<input type="text" id="rname" name="rname" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						性别
					</td>
					<td align="right">
						<input type="radio" name="sex" id="male" value="B"
							checked="checked" />
						男
						<input type="radio" name="sex" value="G" id="female" />
						女 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						年级
					</td>
					<td>
						<input type="text" id="grade" name="grade" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						专业
					</td>
					<td>
						<input type="text" id="major" name="major" />
						<span style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td align="center">
						座右铭
					</td>
					<td>
						<input type="text" id="motto" name="motto" />
					</td>
				</tr>
				<tr>
					<td height="40px">
					</td>
					<td>
						<input type="submit" id="sbt" value="注册"style="font-size: 16px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="cancel" value="取消" onclick="onCancel()"
							style="font-size: 16px" />
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
function onSubmit() {
	with (document.all) {
		if (uname.value == '' || upwd.value == '' || stuNo.value == ''
				|| rname.value == '' || grade.value == '' || major.value == '') {
			alert("信息不完整<除座右铭外均为必填!>\n 请完善信息");
			return false;
		} else
			return true;
	}
}
function onCancel() {
	window.parent.document.getElementById("show").src = "listNews.action";
}
</script>
</html>
