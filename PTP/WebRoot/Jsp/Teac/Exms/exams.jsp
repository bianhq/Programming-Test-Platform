<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/Jsp/Teac/Exms";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="考试设置之信息显示">
		<style type="text/css">
.lstex { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstex td {
	text-align: center;
}

.bt {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}
</style>
<script type="text/javascript" language="javascript"
			src="../../Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体" onload="Page(10,'exams','content');">
		<h2>
			考试设置
		</h2>
		<div class="lstex">
			<input type="button" class="bt" id="add" value="新增" onclick="Add()">
			<input type="button" class="bt" id="modify" value="修改"
				onclick="Modify()">
			<input type="button" class="bt" id="delete" value="删除"
				onclick="Delete()">
			<input type="button" class="bt" id="ques" value="试题" onclick="Ques()">
			<input type="button" class="bt" id="tdata" value="考生数据"
				onclick="Sdata()">
			<table id="exams" width="100%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#A0A0A0"
				style="border-style: none;margin-left: 2px; margin-bottom: 2px">
				<caption>
					您已添加的考试
					<hr color="rgb(217,154,98)">
				</caption>
				<tr>
					<td>
						选择
					</td>
					<td>
						序号
					</td>
					<td>
						考试
					</td>
					<td>
						开始时间
					</td>
					<td>
						结束时间
					</td>
					<td>
						类别
					</td>
					<td>
						状态
					</td>
				</tr>
				<tbody id="content">
				<s:iterator value="exams" status="index">
					<tr>
						<td>
							<input type="radio" name="select" onclick="Select(this)"
								value='<s:property value="exams[#index.index][0]" /> <s:property value="exams[#index.index][1]" />' />
						</td>
						<td>
							<s:property value="#index.index+1" />
						</td>
						<td>
							<s:property value="exams[#index.index][1]" />
						</td>
						<td>
							<s:date name="exams[#index.index][2]"
								format="yyyy/MM/dd HH:mm:ss" />
						</td>
						<td>
							<s:date name="exams[#index.index][3]"
								format="yyyy/MM/dd HH:mm:ss" />
						</td>
						<td>
							<s:property value="exams[#index.index][4]" />
						</td>
						<td>
							<s:property value="exams[#index.index][5]" />
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			<table>
				<tr>
					<td>
						<a href="list_exam.action#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="list_exam.action#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="list_exam.action#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="list_exam.action#" onclick="lastPage();">尾页</a>
					</td>
					<td>
						<span id="pageindex"></span>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
function Add() {
	window.location.href = '<%=basePath%>' + "/exams_add.jsp";
}
var par = ""; //获取选中项信息
function Modify() {
	if (par == "")
		alert("请先选择需要修改的项!");
	else {
		window.location.href = "mdPre_exam.action?exam=" + par;
	}
}
function Delete() {
	if (par == "")
		alert("请先选择需要删除的项!");
	else {
		alert("该操作将导致数据库中拥有此权限的所有用户信息的删除!\n请谨慎使用!!!");
		window.location.href = "del_exam.action?exam=" + par;
	}
}
function Ques() {
	if (par == "")
		alert("请先选择需要添加试题的项!");
	else
		window.location.href = "all_sbjs.action?exam=" + par;
}
function Sdata() {
	if (par == "")
		alert("请先选择需要添加考生数据的项!");
	else {
		var base = '<%=basePath%>';
		window.location.href = base + "/stu_data.jsp?exam=" + par;
	}
}
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
