<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="stu.entity.Student"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Student student;
	String register = "";
	if (session.getAttribute("fail") == "session ended") {
		response.sendRedirect("./warn.jsp");
		return;
	} else if (session.getAttribute("register") == "success") {
		register = "success";
		student = new Student();
		session.removeAttribute("register");
	} else {
		student = (Student) session.getAttribute("stu");
		if (student == null)
			student = new Student();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Programming Test Platform</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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

	<body onload="showTips()">
		<%
			response.setHeader("pragma", "no-cache");
			response.setHeader("cache-control", "no-cache");
			response.setHeader("cache-control", "no-store");
			response.setDateHeader("expires", 0);
		%>
		<div class="content">
			<div class="head">
				<div class="logo">
					<a href="welcome.jsp"><img src="./Res/Ptp.png" border="0">
					</a>
				</div>
				<div class="sign" id="sign">
					<input type="text" id="user" readonly="readonly"
						style="display: none" />
					<input type="button" id="logout" value="[退出]" onclick="logout()"
						style="display: none" />
					<input type="button" id="login" value="[登录]" onclick="login()" />
					<input type="button" id="register" value="[注册]"
						onclick="register()" />
				</div>
			</div>
			<hr>
			<div class="main">
				<div class="left">
					<iframe id="items" src="./Jsp/Stu/left.jsp" width="100%"
						height="100%" frameborder="0">
					</iframe>
				</div>

				<div class="right">
					<div id="tips" class="tips"
						style="font-family: 华文楷体; width: 600px; height: 20px; padding-top: 10px; display: none">
						<font color="black" size="5px">你的信息已经成功注册，请登录 ( ^_^ )</font>
					</div>
					<iframe id="show" name="show" src="showNews.action" width="100%"
						frameborder="0" onload="setHeight(this)" scrolling="no">
					</iframe>
				</div>
			</div>
			<hr>
			<div class="footer">
				<table>
					<tr>
						<td style="color: blue" align="center">
							Programming Test Platform Version-1.0
							<br>
							Designer & Developer:
							<a href="mailto:shawzt@gmail.com">Shawzt</a>				
						</td>
					</tr>
					<tr>
						<td align="center">
							A CopyRight &copy 2011 HHUC Computer & Information College
						</td>
					</tr>
				</table>
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
function showTips() {
	var name = "<%=student.getUname()%>";
	var tag = "<%=register%>";
	with (document.all) {
		if (String(tag) == "success") {
			tips.style.display = "";
		} else if (String(name) != "null") {
			tips.style.display = "";
			tips.innerHTML = "欢迎使用 Programming Online Test Platform &nbsp (^_^)";
			sign.style.marginLeft = "83%";
			user.style.display = "";
			login.style.display = "none";
			user.value = "欢迎 " + name;
			register.style.display = "none";
			logout.style.display = "";
		}
	}
}
var timer = window.setInterval(Timer, 1000);
var left = 2;
function Timer() {
	if (left == 0) {
		document.getElementById("tips").style.display = "none";
		window.clearInterval(timer);
	} else
		left--;
}
function login() {
	document.getElementById("show").src = "./Jsp/Stu/login.jsp";
}

function register() {
	document.getElementById("show").src = "./Jsp/Stu/register.jsp";
}
function logout() {
	window.location.href = "logout.action";
}
</script>
</html>
