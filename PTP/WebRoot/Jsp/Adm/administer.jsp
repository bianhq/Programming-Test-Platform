<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
<%@page import="java.sql.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Teacher teacher;
	if (session.getAttribute("fail") == "session ended") {
		response.sendRedirect("./warn.jsp");
		return;
	} else if (session.getAttribute("adm") == null) {
		teacher = null;
		response.sendRedirect("../../warn.jsp");
		return;
	} else
		teacher = (Teacher) session.getAttribute("adm");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>PTP后台管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="cache-control" content="no-store">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="管理员主界面">

		<link rel="stylesheet" type="text/css" href="./Css/app_style.css">
		<style type="text/css">
#user {
	border: 0;
	font-family: 华文楷体;
	font-style: oblique;
	font-size: 18px;
	width: 120px;
	text-align: center;
	font-family: 华文楷体;
	font-size: 18px;
}
</style>
	</head>

	<body onload="check()">
		<%
			response.setHeader("pragma", "no-cache");
			response.setHeader("cache-control", "no-cache");
			response.setHeader("cache-control", "no-store");
			response.setDateHeader("expires", 0);
		%>
		<div class="content">
			<div class="head">
				<div class="logo">
					<a href="./Jsp/Adm/administer.jsp"><img src="./Res/Ptp.png"
							border="0"> </a>
				</div>
				<div class="sign" style="margin-left: 82%">
					<input type="text" id="user" readonly="readonly" />
					<input type="button" id="logout" value="[退出]" onclick="logout()" />
				</div>
			</div>
			<hr>
			<div class="main">
				<div class="left">
					<iframe id="items" src="./Jsp/Adm/left.jsp" width="100%"
						height="100%" frameborder="0"></iframe>
				</div>

				<div class="right">
					<iframe id="show" name="show" src="logs.action" width="100%"
						frameborder="0" onload="setHeight(this)" scrolling="no"></iframe>
				</div>
			</div>
			<hr>
			<div class="footer">
				CopyRight &copy 2011 HHUC Computer & Information College
			</div>
		</div>
	</body>
	<script type="text/javascript">
function setHeight(obj) {
	var win = obj;
	if (document.getElementById) {
		if (win && !window.opera) {
			if (win.contentDocument && win.contentDocument.body.offsetHeight)
				win.height = win.contentDocument.body.offsetHeight;
			else if (win.Document && win.Document.body.scrollHeight)
				win.height = win.Document.body.scrollHeight;
		}
	}
}
function logout() {
	window.location.href = "A_logout.action";
}
function check() {
	with (document.all) {
		var tname = "<%=teacher.getTname()%>";
		var str = "欢迎 ";
		user.value = str + tname;
	}
}
</script>
</html>

