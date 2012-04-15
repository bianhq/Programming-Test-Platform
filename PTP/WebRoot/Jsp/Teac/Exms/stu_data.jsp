<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String[] exam = new String(request.getParameter("exam").getBytes(
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
		<meta http-equiv="description" content="考生信息页面">
		<style type="text/css">
.addex { /*background-color: gray;*/
	width: 40%;
}

.addex td {
	text-align: center;
}

.inp {
	font-size: 14px;
	font-family: 华文楷体;
}
</style>
	</head>
	<body style="font-family: 华文楷体">
		<h2>
			考试设置
		</h2>
		<div class=" addex ">
			<form method="post" action="add_stus.action"
				enctype="multipart/form-data" onsubmit="return check ()">
				<input type="hidden" name="exId" value='<%=exam[0]%>'>
				<table width="100%" border="0"
					style="margin-left: 2px; margin-bottom: 2 px">
					<caption>
						<font size="4px" color="red">【<%=exam[0]%>。<%=exam[1]%>】</font>之考生信息
						<hr color="rgb(217,154,98)">
					</caption>
					<tr style="color: brown">
						<td>
							提示:
						</td>
						<td>
							设置参加该考试的人员信息，您可以选择以下格式的文件导入
						</td>
					</tr>
					<tr>
						<td>
							EXCEL文件:
						</td>
						<td>
							<input class="inp" type="file" id="id_excel" name="stufile"
								onmouseover="show(this)">
						</td>
					</tr>
				</table>
				<input type="submit" id="sbt" value="提交"
					style="font-size: 16px; font-family: 华文楷体" />
			</form>
		</div>
	</body>
	<script type="text/javascript">
function show(obj) {
	obj.title = obj.value;
}

function check() {
	with (document.all) {
		if (id_excel.value == '') {
			alert("无上传文件!!!");
			return false;
		} else
			return true;
	}
}
</script>
</html>