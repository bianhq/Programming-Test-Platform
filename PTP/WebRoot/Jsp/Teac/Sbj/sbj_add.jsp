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
		<meta http-equiv="description" content="题库新增界面">
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

	<body style="font-family: 华文楷体">
		<h2>
			题库管理
		</h2>
		<div class="addsb">
			<form method="post" action="add_subject.action"
				onsubmit="return check()">
				<input type="hidden" name="teacid"
					value="<%=teacher.getTeacherId()%>">
				<table border="0" class="addsbt" width="100%">
					<caption>
						新增题目
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							题目:
						</td>
						<td colspan="3">
							<input type="text" id="id_title" name="title"
								style="width: 260px; height: 80px; text-align: center; line-height: 60px;font-family: 华文楷体; font-size: 18px;" />
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							描述:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_desc" name="desc"></textarea>
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
							<textarea class="inp" id="id_input" name="input"></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							输出说明:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_output" name="output"></textarea>
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
							<textarea class="inp" id="id_spinput" name="spinput"></textarea>
						</td>
						<td>
							<span style="color: red">*</span>
						</td>
						<td>
							输出样例:
						</td>
						<td colspan="3">
							<textarea class="inp" id="id_spoutput" name="spoutput"></textarea>
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
								style="font-family:华文楷体;width: 158px; text-align: center; font-size: 14px;"></textarea>
						</td>
						<td>
							练习集可见:
						</td>
						<td>
							<select name="visible" style="font-family: 华文楷体; font-size: 14px">
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
				<input type="submit" id="sbt" value="新增"
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
</script>
</html>
