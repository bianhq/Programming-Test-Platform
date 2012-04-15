<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String[] pars = new String(request.getParameter("lang").getBytes(
			"iso8859-1"), "utf-8").split(" ");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="程序设计语言修改界面">
		<style type="text/css">
.mdlg { /*background-color: gray;*/
	width: 50%;
}

.mdlg td {
	width: 80px;
	height: 40px;
	font-size: 18px;
	text-align: center;
}

.inp {
	width: 100px;
	height: 40px;
	text-align: center;
	line-height: 36px;
	font-size: 18px;
	font-family: 华文楷体;
}
</style>
	</head>

	<body style="font-family: 华文楷体">
		<h2>
			程序设计语言管理
		</h2>
		<div class="mdlg">
			<form method="post" action="md_lang.action"
				onsubmit="return check()">
				<table border="0" class="mdlg">
					<caption>
						修改程序设计语言
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							语言名称:
							<input type="hidden" name="langId" value="<%=pars[0]%>">
						</td>
						<td>
							<input type="text" class="inp" id="id_lname" name="lname"
								maxlength="8" value="<%=pars[1]%>" />
					</tr>
				</table>
				<input type="submit" id="sbt" value="更新"
					style="font-size: 16px; font-family: 华文楷体" />
			</form>
		</div>
	</body>
	<script type="text/javascript">
function check() {
	with (document.all) {
		if (id_lname.value == '') {
			alert("信息不完整，请完善!");
			return false;
		} else
			return true;
	}
}
</script>
</html>
