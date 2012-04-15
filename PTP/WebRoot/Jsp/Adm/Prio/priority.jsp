<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/Jsp/Adm/Prio";
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
		<meta http-equiv="description" content="权限设置界面">
		<style type="text/css">
.lstp { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstp td {
	text-align: center;
}

.bt {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}

.inp {
	width: 100px;
	height: 40px;
	text-align: center;
	line-height: 36px;
	font-size: 18px;
}
</style>
<script type="text/javascript" language="javascript"
			src="../../Js/PageSplit.js">
</script>
	</head>
	<body style="font-family: 华文楷体" onload="Page(10,'priors','content');">
		<h2>
			权限管理
		</h2>
		<div class="lstp">
			<input type="button" class="bt" id="add" value="新增" onclick="Add()">
			<input type="button" class="bt" id="modify" value="修改"
				onclick="Modify()">
			<input type="button" class="bt" id="delete" value="删除"
				onclick="Delete()">
			<table id="priors" width="100%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#A0A0A0"
				style="border-style: none;margin-left: 2px; margin-bottom: 2px">
				<caption>
					已有权限信息列表
					<hr color="rgb(217,154,98)">
				</caption>
				<tr>
					<td>
						选择
					</td>
					<td>
						权限标识
					</td>
					<td>
						权限名称
					</td>
				</tr>
				<tbody id="content">
				<s:iterator value="powers">
					<tr>
						<td>
							<input type="radio" name="select" onclick="Select(this)"
								value='<s:property value="prior" /> <s:property value="pname" />'/>
						</td>
						<td>
							<s:property value="prior" />
						</td>
						<td>
							<s:property value="pname" />
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
		<table>
				<tr>
					<td>
						<a href="list_prior.action#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="list_prior.action#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="list_prior.action#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="list_prior.action#" onclick="lastPage();">尾页</a>
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
	window.location.href = '<%=basePath%>' + "/prio_add.jsp";
}
var par = ""; //获取选中项信息
function Modify() {
	if (par == "")
		alert("请先选择需要修改的项!");
	else {
		window.location.href = '<%=basePath%>'
				+ "/prio_md.jsp?prior=" + par;
	}
}
function Delete() {
	if (par == "")
		alert("请先选择需要删除的项!");
	else{
		alert("该操作将导致数据库中拥有此权限的所有用户信息的删除!\n请谨慎使用!!!");
		window.location.href = "del_prior.action?prior=" + par;
		}
}
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
