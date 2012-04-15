<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Teacher teacher = (Teacher) request.getSession().getAttribute(
			"teac");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>题库管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="题库修改界面">
		<style type="text/css">
.addsb { /*background-color: gray;*/
	width: 70%;
}

.addsbt td {
	height: 40px;
	font-size: 16px;
	text-align: center;
}

.inp {
	width: 260px;
	height: 80px;
	text-align: center;
	font-size: 14px;
	font-family: 华文楷体;
}
</style>
	</head>

	<body style="font-family: 华文楷体" onload="setVisi()">
		<h2>
			题库管理
		</h2>
		<div class="addsb">
			<form method="post" action="md_subject.action"
				onsubmit="return check()">
				<input type="hidden" name="teacid"
					value="<%=teacher.getTeacherId()%>">
					<input type="hidden" name="subno"
					value="<s:property value='subno'/>">
				<table border="0" class="addsbt" width="100%">
					<caption>
						修改题目
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							题目:
						</td>
						<td colspan="3">
							<input type="text" id="id_title" name="title"
								value="<s:property value='title'/>"
								style="width: 260px; height: 80px; text-align: center; line-height: 60px; font-family: 华文楷体;font-size: 18px;" />
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							描述:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_desc" name="desc"><s:property value='desc' /></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
					</tr>
					<tr>
						<td>
							输入说明:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_input" name="input"><s:property value='input' /></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							输出说明:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_output" name="output"><s:property value='output' /></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
					</tr>
					<tr>
						<td>
							输入样例:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_spinput" name="spinput"><s:property value='spinput' /></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							输出样例:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_spoutput" name="spoutput"><s:property value='spoutput' /></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
					</tr>
					<tr>
						<td>
							类别:
						</td>
						<td>
							<textarea id="id_cate" name="cate"
								style="width: 158px; text-align: center; font-family: 华文楷体; font-size: 14px;"><s:property value='cate' /></textarea>
						</td>
						<td>
							练习集可见:
						</td>
						<td>
							<input type="hidden" id="vis"
								value="<s:property value='visible' />">
							<select id="visible" name="visible"
								style="font-family: 华文楷体; font-size: 14px">
								<option value="F">
									否
								</option>
								<option value="T" style="color: red">
									是
								</option>
							</select>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
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
		if (id_title.value == '' || id_desc.value == '' || id_input.value == ''
				|| id_output.value == '' || id_spinput.value == ''
				|| id_spoutput.value == '') {
			alert("信息不完整，请完善!!");
			return false;
		} else
			return true;
	}
}
function setVisi() {
	with (document.all) {
		if (vis.value == "F")
			visible.value = "F";
		else if (vis.value == "T")
			visible.value = "T";
	}
}
</script>
</html>
