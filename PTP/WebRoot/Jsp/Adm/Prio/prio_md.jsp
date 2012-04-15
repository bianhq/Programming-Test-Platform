<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String[] pars = new String(request.getParameter("prior").getBytes(
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
		<meta http-equiv="description" content="权限修改页面">
		<style type="text/css">
.addp { /*background-color: gray;*/
	width: 70%;
}

.addt td {
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
}
</style>
	</head>

	<body style="font-family: 华文楷体">
		<h2>
			权限管理
		</h2>
		<div class="addp">
			<form method="post" action="md_prior.action"
				onsubmit="return check()">
				<table border="0" class="addt">
					<caption>
						权限修改
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							权限标识:
						</td>
						<td>
							<input type="text" class="inp" id="id_prior" name="prior"
								value="<%=pars[0]%>" maxlength="1" readonly="readonly" />
							<td>
								权限名称:
							</td>
							<td>
								<input type="text" class="inp" id="id_pname" name="pname"
									value="<%=pars[1]%>" maxlength="5" />
							</td>
					</tr>
				</table>
				<input type="submit" id="sbt" value="更新"
					style="font-size: 16px; font-family: 华文楷体">
			</form>
		</div>
	</body>
	<script type="text/javascript">
function check() {
	with (document.all) {
		if (id_prior.value == '' || id_pname.value == '') {
			alert("权限标识、权限名称均不可为空!");
			return false;
		} else if (id_prior.value >= 'A' && id_prior.value <= 'E') {
			alert(id_prior.value + " " + id_pname.value);
			return true;
		} else {
			alert("信息有误!");
			return false;
		}
	}
}
</script>
</html>
