<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/Jsp/Adm/Acnt";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>教师账号管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="教师账号分配界面">

		<style type="text/css">
.lstaut { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstaut td {
	text-align: center;
}

.bt {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}

.inp {
	width: 120px;
	height: 40px;
	text-align: center;
	line-height: 34px;
	font-size: 18px;
}
</style>
<script type="text/javascript" language="javascript"
			src="../../Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体" onload="Page(10,'accounts','content');">
		<h2>
			账号分配
		</h2>
		<div class="lstaut">
			<input type="button" class="bt" id="add" value="新增" onclick="Add()">
			<input type="button" class="bt" id="modify" value="修改"
				onclick="Modify()">
			<input type="button" class="bt" id="delete" value="删除"
				onclick="Delete()">
			<table id="accounts" width="100%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#A0A0A0"
				style="border-style: none;margin-left: 2px; margin-bottom: 2px">
				<caption>
					已有账号信息列表
					<hr color="rgb(217,154,98)">
				</caption>
				<tr>
					<td>
						选择
					</td>
					<td>
						教师姓名
					</td>
					<td>
						性别
					</td>
					<td>
						账号
					</td>
				</tr>
				<tbody id="content">
				<s:iterator value="teachers">
					<tr>
						<td>
							<input type="radio" name="select" onclick="Select(this)"
								value='<s:property value="tname" /> <s:property value="sex" /> <s:property value="regName" />' />
						</td>
						<td>
							<s:property value="tname" />
						</td>
						<td>
							<s:if test='sex=="M"'>男</s:if>
							<s:else>女</s:else>
						</td>
						<td>
							<s:property value="regName" />
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			<table>
				<tr>
					<td>
						<a href="lst_aut.action#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="lst_aut.action#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="lst_aut.action#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="lst_aut.action#" onclick="lastPage();">尾页</a>
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
	window.location.href = '<%=basePath%>' + "/acnt_add.jsp";
}
var par = ""; //获取选中项信息
function Modify() {
	if (par == "")
		alert("请先选择需要修改的项!");
	else {
		window.location.href = '<%=basePath%>'
				+ "/acnt_md.jsp?acnt=" + par;
	}
}
function Delete() {
	if (par == "")
		alert("请先选择需要删除的项!");
	else {
		alert("该操作将导致数据库中该账号用户所有信息的删除!\n请谨慎使用!!!");
		window.location.href = "del_aut.action?acnt=" + par;
	}
}
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
