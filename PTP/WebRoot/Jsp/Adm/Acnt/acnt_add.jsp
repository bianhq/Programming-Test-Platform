<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>教师账号管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="教师账号新增界面">

		<style type="text/css">
.addaut { /*background-color: gray;*/
	width: 70%;
}

.addautt td {
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
}
</style>

	</head>

	<body style="font-family: 华文楷体">
		<h2>
			账号分配
		</h2>
		<div class="addaut">
			<form method="post" action="add_aut.action" onsubmit="return check()">
				<table border="0" class="addautt">
					<caption>
						新增教师账号
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							教师姓名:
						</td>
						<td colspan="2">
							<input type="text" class="inp" id="id_tname" name="tname"
								maxlength="10" />
							<span style="color: red">*</span>
						</td>
						<td>
							教师性别:
						</td>
						<td>
							<input type="radio" name="sex" id="male" value="M"
								checked="checked">
							男
						</td>
						<td>
							<input type="radio" name="sex" id="female" value="W">
							女
							<span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;*</span>
						</td>
					</tr>
					<tr>
						<td>
							账号:
						</td>
						<td colspan="2">
							<input type="text" class="inp" id="id_reg" name="regname"
								maxlength="5" />
							<span style="color: red">*</span>
						</td>
						<td>
							密码:
						</td>
						<td colspan="2">
							<input type="text" class="inp" id="id_pwd" name="pwd"
								maxlength="5" />
							<span style="color: red">*</span>
						</td>
					</tr>
					<tr>
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
				<input type="submit" id="sbt" value="新增"
					style="font-size: 16px; font-family: 华文楷体" />
			</form>
		</div>
	</body>
	<script type="text/javascript">
function check() {
	with (document.all) {
		if (id_tname.value == '' || id_reg.value == '' || id_pwd.value == '') {
			alert("信息不完整，请完善!!");
			return false;
		} else
			return true;
	}
}
</script>
	</body>
</html>
