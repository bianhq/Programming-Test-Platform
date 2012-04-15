<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String[] sbj = request.getParameter("sbj").split(" ");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>Test Data</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="测试数据页面">

		<style type="text/css">
.add {
	width: 80%;
}

.data {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}

.score {
	width: 30px;
	font-size: 16px;
	font-family: 华文楷体;
}
</style>
	</head>

	<body style="font-family: 华文楷体; font-size: 18px">
		<h2>
			测试数据管理
		</h2>
		<label style="font-family: 华文楷体; font-size: 13px; color: brown">
			说明:所有题目必须提供输出文件，对于有输入要求的题目还必须提供相应的输入文件!!!
		</label>
		<div class="add">
			<form method="post" action="add_data.action"
				enctype="multipart/form-data" onsubmit="return check()">
				<input type="hidden" name="sbId" value='<%=sbj[0]%>'>
				<table>
					<caption>
						<font color="red" size="4">题号:<%=sbj[0]%>&nbsp;&nbsp;题目:<%=sbj[1]%></font>
						<hr color="rgb(217,154,98)">
						<input type="radio" id="rd1" name="hasIn" value="none"
							onclick="setInput(this)">
						无输入数据
						<input type="radio" id="rd2" name="hasIn" value="have"
							onclick="setInput(this)">
						有输入数据
					</caption>
					<tr>
						<td>
							输入1:
						</td>
						<td>
							<input class="data" id="input1" type="file" name="inputs"
								readonly="readonly">
						</td>
						<td>
							输出1:
						</td>
						<td>
							<input class="data" id="output1" type="file" name="outputs"
								readonly="readonly">
						</td>
						<td>
							分值1:
						</td>
						<td>
							<input class="score" id="score1" type="text" name="score"
								maxlength="2">
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							输入2:
						</td>
						<td>
							<input class="data" id="input2" type="file" name="inputs"
								readonly="readonly">
						</td>
						<td>
							输出2:
						</td>
						<td>
							<input class="data" id="output2" type="file" name="outputs"
								readonly="readonly">
						</td>
						<td>
							分值2:
						</td>
						<td>
							<input class="score" id="score2" type="text" name="score"
								maxlength="2">
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							输入3:
						</td>
						<td>
							<input class="data" id="input3" type="file" name="inputs"
								readonly="readonly">
						</td>
						<td>
							输出3:
						</td>
						<td>
							<input class="data" id="output3" type="file" name="outputs"
								readonly="readonly">
						</td>
						<td>
							分值3:
						</td>
						<td>
							<input class="score" id="score3" type="text" name="score"
								maxlength="2">
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							输入4:
						</td>
						<td>
							<input class="data" id="input4" type="file" name="inputs"
								readonly="readonly">
						</td>
						<td>
							输出4:
						</td>
						<td>
							<input class="data" id="output4" type="file" name="outputs"
								readonly="readonly">
						</td>
						<td>
							分值4:
						</td>
						<td>
							<input class="score" id="score4" type="text" name="score"
								maxlength="2">
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td>
							输入5:
						</td>
						<td>
							<input class="data" id="input5" type="file" name="inputs"
								readonly="readonly">
						</td>
						<td>
							输出5:
						</td>
						<td>
							<input class="data" id="output5" type="file" name="outputs"
								readonly="readonly">
						</td>
						<td>
							分值5:
						</td>
						<td>
							<input class="score" id="score5" type="text" name="score"
								maxlength="2">
						</td>
					</tr>
				</table>
				<input class="data" type="submit" value="提交">
				<input class="data" type="button" value="重置" onclick="cleanUp()">
			</form>
		</div>
	</body>
	<script type="text/javascript">
var data = "none";
function setInput(obj) {
	with (document.all) {
		if (obj.value == "have") { //有输入数据
			input1.readOnly = input2.readOnly = input3.readOnly = input4.readOnly = input5.readOnly = false;
			output1.readOnly = output2.readOnly = output3.readOnly = output4.readOnly = output5.readOnly = false;
			data = "have";
		} else if (obj.value == "none") { //无输入数据
			input1.readOnly = input2.readOnly = input3.readOnly = input4.readOnly = input5.readOnly = true;
			output1.readOnly = output2.readOnly = output3.readOnly = output4.readOnly = output5.readOnly = false;
			data = "none";
			//清空输入控件值
			input1.outerHTML = input1.outerHTML;
			input2.outerHTML = input2.outerHTML;
			input3.outerHTML = input3.outerHTML;
			input4.outerHTML = input4.outerHTML;
			input5.outerHTML = input5.outerHTML;
		}
	}
}

function check() {
	with (document.all) {
		if (data == "none") { //	无输入数据
			if (output1.value == '' && output2.value == ''
					&& output3.value == '' && output4.value == ''
					&& output5.value == '') {
				alert("无上传文件!!!");
				return false;
			} else if (output1.value != '' && score1.value == '') {
				alert("数据1无分值!");
				return false;
			} else if (output2.value != '' && score2.value == '') {
				alert("数据2无分值!");
				return false;
			} else if (output3.value != '' && score3.value == '') {
				alert("数据3无分值!");
				return false;
			} else if (output4.value != '' && score4.value == '') {
				alert("数据4无分值!");
				return false;
			} else if (output5.value != '' && score5.value == '') {
				alert("数据5无分值!");
				return false;
			} else
				return true;
		} else if (data == "have") { //有输入数据
			if ((input1.value != '' && output1.value == '')
					|| (input1.value == '' && output1.value != '')
					|| (input1.value != '' && output1.value != '' && score1.value == '')) {
				alert("输入项1不匹配或无分值!");
				return false;
			} else if ((input2.value != '' && output2.value == '')
					|| (input2.value == '' && output2.value != '')
					|| (input2.value != '' && output2.value != '' && score2.value == '')) {
				alert("输入项2不匹配或无分值!");
				return false;
			} else if ((input3.value != '' && output3.value == '')
					|| (input3.value == '' && output3.value != '')
					|| (input3.value != '' && output3.value != '' && score3.value == '')) {
				alert("输入项3不匹配或无分值!");
				return false;
			} else if ((input4.value != '' && output4.value == '')
					|| (input4.value == '' && output4.value != '')
					|| (input4.value != '' && output4.value != '' && score4.value == '')) {
				alert("输入项4不匹配或无分值!");
				return false;
			} else if ((input5.value != '' && output5.value == '')
					|| (input5.value == '' && output5.value != '')
					|| (input5.value != '' && output5.value != '' && score5.value == '')) {
				alert("输入项5不匹配或无分值!");
				return false;
			} else
				return true;
		}
	}
}

function cleanUp() {
	with (document.all) {
		//清空控件值
		rd1.checked = rd2.checked = false;
		input1.outerHTML = input1.outerHTML;
		output1.outerHTML = output1.outerHTML;
		input2.outerHTML = input2.outerHTML;
		output2.outerHTML = output2.outerHTML;
		input3.outerHTML = input3.outerHTML;
		output3.outerHTML = output3.outerHTML;
		input4.outerHTML = input4.outerHTML;
		output4.outerHTML = output4.outerHTML;
		input5.outerHTML = input5.outerHTML;
		output5.outerHTML = output5.outerHTML;
		score1.value = score2.value = score3.value = score4.value = score5.value = '';
		input1.readOnly = input2.readOnly = input3.readOnly = input4.readOnly = input5.readOnly = true;
		output1.readOnly = output2.readOnly = output3.readOnly = output4.readOnly = output5.readOnly = true;
	}
}
</script>
</html>
