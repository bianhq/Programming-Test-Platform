<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Teacher teacher = (Teacher) request.getSession().getAttribute(
			"teac");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/Jsp/Teac/Sbj";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>题库管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="题库管理界面">
		<style type="text/css">
.lstsb { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstsb td {
	text-align: center;
}

.bt {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}

.inp {
	width: 260px;
	height: 80px;
	text-align: center;
	font-size: 14px;
	font-family: 华文楷体;
}
</style>
<script type="text/javascript" language="javascript"
			src="../../Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体" onload="Page(10,'subjects','content');">
		<h2>
			题库管理
		</h2>
		<div class="lstsb">
			<input type="button" class="bt" id="add" value="新增" onclick="Add()">
			<input type="button" class="bt" id="modify" value="修改"
				onclick="Modify()">
			<input type="button" class="bt" id="delete" value="删除"
				onclick="Delete()">
			<input type="button" class="bt" id="tdata" value="测试数据"
				onclick="Tdata()">
			<table id="subjects" width="100%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#A0A0A0"
				style="border-style: none;margin-left: 2px; margin-bottom: 2px">
				<caption>
					您已添加的题目
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
						题目
					</td>
					<td>
						类别
					</td>
					<td>
						可见
					</td>
					<td>
						测试数据/个
					</td>
				</tr>
				<tbody id="content">
				<s:iterator value="subjects" status="index">
					<tr>
						<td>
							<input type="radio" name="select" onclick="Select(this)"
								value='<s:property value="subjects[#index.index][0]" /> <s:property value="subjects[#index.index][1]" />' />
						</td>
						<td>
							<s:property value="#index.index+1" />
						</td>
						<td>
							<s:property value="subjects[#index.index][1]" />
						</td>
						<td>
							<s:property value="subjects[#index.index][2]" />
						</td>
						<td>
							<s:if test='subjects[#index.index][3]=="F"'>否</s:if>
							<s:else>是</s:else>
						</td>
						<td>
							<s:property value="subjects[#index.index][4]" />
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			<table>
				<tr>
					<td>
						<a href="list_subject.action#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="list_subject.action#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="list_subject.action#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="list_subject.action#" onclick="lastPage();">尾页</a>
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
	window.location.href = '<%=basePath%>' + "/sbj_add.jsp";
}
var par = ""; //获取选中项信息
function Modify() {
	if (par == "")
		alert("请先选择需要修改的项!");
	else {
		window.location.href = "mdPre_sbj.action?sbj=" + par;
	}
}
function Delete() {
	if (par == "")
		alert("请先选择需要删除的项!");
	else {
		alert("该操作将导致数据库中拥有此权限的所有用户信息的删除!\n请谨慎使用!!!");
		window.location.href = "del_subject.action?sbj=" + par;
	}
}
function Tdata() {
	if (par == "")
		alert("请先选择需要修改测试数据的项!");
	else {
		var base = '<%=basePath%>';
		window.location.href = base + "/sbj_data.jsp?sbj=" + par;
	}
}
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
