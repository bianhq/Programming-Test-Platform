<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String[] pars = new String(request.getParameter("acnt").getBytes(
			"iso8859-1"), "utf-8").split(" ");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>教师账号管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="教师账号修改界面">

		<style type="text/css">
.mdaut { /*background-color: gray;*/
	width: 70%;
}

.mdautt td {
	height: 40px;
	font-size: 18px;
	text-align: center;
}

.inp {
	width: 120px;
	height: 40px;
	text-align: center;
	line-height: 34px;
	font-size: 18px;
	font-family: "华文楷体";
}

.rst { /*background-color: gray;*/
	width: 432px;
}
</style>
	</head>

	<body style="font-family: 华文楷体" onload="setSex()">
		<h2>
			账号分配
		</h2>
		<div class="mdaut">
			<form method="post" action="md_aut.action" onsubmit="return check()">
				<table border="0" class="mdautt">
					<caption>
						修改教师账号
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							教师姓名:
							<input type="hidden" name="tname" value="<%=pars[0]%>">
						</td>
						<td colspan="2">

							<input type="text" class="inp" id="id_tname" name="new_tname"
								maxlength="10" value="<%=pars[0]%>" />
							<span style="color: red">*</span>
						</td>
						<td>
							教师性别:
							<input type="hidden" name="sex" value="<%=pars[1]%>">
						</td>
						<td>
							<input type="radio" name="new_sex" id="male" value="M"
								checked="checked">
							男
						</td>
						<td>
							<input type="radio" name="new_sex" id="female" value="W">
							女
							<span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;*</span>
						</td>
					</tr>
					<tr>
						<td>
							账号:
							<input type="hidden" name="regname" value="<%=pars[2]%>">
						</td>
						<td colspan="2">
							<input type="text" class="inp" id="id_reg" name="new_regname"
								maxlength="5" value="<%=pars[2]%>" />
							<span style="color: red">*</span>
						</td>
						<td>
							级别:
						</td>
						<td colspan="2">
							<input type="text" class="inp" id="id_prior" name="prior"
								maxlength="1" value="B" readonly="readonly"
								style="border-style: ridge; background-color: gray; color: red" />
							<span style="color: red">*</span>
						</td>
					</tr>
				</table>
				<input type="submit" id="sbt" value="更新以上域"
					style="font-size: 16px; font-family: 华文楷体" />
				<input type="button" id="rstPwd" value="重置密码"
					style="font-size: 16px; font-family: 华文楷体; color: red"
					onclick="RstPwd()">
		</div>
		<div id="rstDiv" class="rst" style="display: none">
			<hr color="rgb(217,154,98)">
			<table>
				<tr>
					<td>
						新密码
					</td>
					<td>
						<input type="password" class="inp" id="id_newPwd" name="newPwd">
					</td>
				</tr>
				<tr>
					<td>
						确认新密码
					</td>
					<td>
						<input type="password" class="inp" id="id_rptPwd" name="rptPwd">
					</td>
				</tr>
			</table>
			<input type="submit" value="更新账号信息"
				style="font-size: 16px; font-family: 华文楷体; color: red">
		</div>
		</form>
	</body>
	<script type="text/javascript">
function check() {
	with (document.all) {
		if (cnt % 2 == 1) { //"更新账号信息"按钮可用时
			if (id_tname.value == '' || id_reg.value == ''
					|| id_Pwd.value == '' || id_newPwd.value == ''
					|| id_rptPwd.value == '') {
				alert("信息不完整，请完善!!");
				return false;
			} else if (id_newPwd.value != id_rptPwd.value) {
				alert("新密码不一致,请重新输入!!");
				return false;
			} else
				return true;
		} else { //"更新账号信息"按钮不可用时
			if (id_tname.value == '' || id_reg.value == '') {
				alert("信息不完整，请完善!!");
				return false;
			} else
				return true;
		}
	}
}
function setSex() {
	with (document.all) {
		if ('<%=pars[1]%>' == "M")
			male.checked = "checked";
		else
			female.checked = "checked";
	}
}
var cnt = 0;
function RstPwd() {
	with (document.all) {
		if (cnt % 2 == 0) { //单击"重置密码"偶数次时"更新以上域"按钮可用
			sbt.disabled = "disabled";
			rstDiv.style.display = "";
			window.parent.document.getElementById("show").onload();
		} else {
			sbt.disabled = "";
			rstDiv.style.display = "none";
			window.parent.document.getElementById("show").onload();
		}
		cnt++;
	}
}
</script>
	</body>
</html>
