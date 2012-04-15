<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
<%@page import="adm.entity.Lang"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Teacher teacher = (Teacher) request.getSession().getAttribute(
			"teac");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>课程信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="课程信息新增页面">

		<style type="text/css">
.addcst {
	/*background-color: gray;*/
	width: 50%;
}

.addcst td {
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
	font-family: 华文楷体;
}

#id_tname {
	border-style: ridge;
	background-color: gray;
}
</style>
	</head>
	<body style="font-family: 华文楷体">
		<h2>
			课程信息设置
		</h2>
		<div class="addcs">
			<form method="post" action="add_course.action"
				onsubmit="return check()">
				<table border="0" class="addcst">
					<caption>
						新增课程
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							授课班号:
						</td>
						<td>
							<input type="text" class="inp" id="id_course" name="courid"
								maxlength="10" />
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							课程名称:
						</td>
						<td>
							<input type="text" class="inp" id="id_cname" name="cname"
								maxlength="10" />
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
					</tr>
					<s:select name="lgid" list="langs" listKey="langId"
						listValue="lname" cssClass="inp" label="语言类别" value="langId">
					</s:select>
					<tr>
						<td>
							教师姓名:
						</td>
						<td>
							<input type="text" class="inp" id="id_tname" name="tname"
								value="<%=teacher.getTname()%>" readonly="readonly" />
							<input type="hidden" id="id_teacid" name="teacid"
								value="<%=teacher.getTeacherId()%>" />
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
		if (id_course.value == '' || id_cname.value == '') {
			alert("信息不完整，请完善!!");
			return false;
		} else
			return true;
	}
}
</script>
</html>
