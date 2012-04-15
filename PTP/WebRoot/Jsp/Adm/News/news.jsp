<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/Jsp/Adm/News";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<title>消息发布管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="消息发布列表界面">
		<style type="text/css">
.lstnews { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstnews td {
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

	<body style="font-family: 华文楷体" onload="Page(5,'news','content');">
		<h2>
			消息发布
		</h2>
		<div class="lstnews">
			<input type="button" class="bt" id="add" value="新增" onclick="Add()">
			<input type="button" class="bt" id="modify" value="修改"
				onclick="Modify()">
			<input type="button" class="bt" id="delete" value="删除"
				onclick="Delete()">
			<table id="news" width="100%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#A0A0A0"
				style="border-style: none;margin-left: 2px; margin-bottom: 2px">
				<caption>
					已发布消息列表
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
						摘要
					</td>
					<td>
						内容
					</td>
					<td>
						时间
					</td>
				</tr>
				<tbody id="content">
				<s:iterator value="news" status="index">
					<tr>
						<td>
							<input type="radio" name="select" onclick="Select(this)"
								value='<s:property value="news[#index.index][0]" />' />
						</td>
						<td>
							<s:property value="#index.index" />
						</td>
						<td>
							<s:property value="news[#index.index][1]" />
						</td>
						<td>
							<s:property value="news[#index.index][2]" />
						</td>
						<td>
							<s:date name="news[#index.index][3]" format="yyyy/MM/dd HH:mm:ss" />
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			<table>
				<tr>
					<td>
						<a href="list_news.action#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="list_news.action#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="list_news.action#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="list_news.action#" onclick="lastPage();">尾页</a>
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
	window.location.href = '<%=basePath%>' + "/news_add.jsp";
}
var par = ""; //获取选中项信息
function Modify() {
	if (par == "")
		alert("请先选择需要修改的项!");
	else {
		window.location.href = '<%=basePath%>'
				+ "/md_pre.action?newid=" + par;
	}
}
function Delete() {
	if (par == "")
		alert("请先选择需要删除的项!");
	else {
		alert("该消息被删除后，用户将不能再看到!\n请谨慎使用!!!");
		window.location.href = "del_new.action?newid=" + par;
	}
}
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
