<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="stu.entity.Student"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Student student = (Student) session.getAttribute("stu");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="题目列表页">
		<script type="text/javascript" language="javascript"
			src="./Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体" onload="load();">
		<h1>
			训练集题目列表
		</h1>
		<div id="tip"
			style="border-style: ridge; border-color: red; width: 40%">
			<label>
				题目状态:该题在平台支持的语言下测试情况
			</label>
			<input id="langid" type="hidden"
				value='<s:property value="langid" />'>
			<form id="lang" action="subjects.action" method="post"
				onsubmit="return change()">
				<b>平台支持语言:</b>
				<s:select name="lgid" list="langs" listKey="langId"
						listValue="lname" value="langId" cssStyle="font-family: 华文楷体; font-size: 14px" onchange="change()">
				</s:select>
			</form>
		</div>
		<div style="width: 100%">
			<table id="list" style="border-style: none" width="80%" border="1"
				rules="rows" bordercolor="#D2B48C" bgcolor="#F5DEB3">
				<tr>
					<td width="10%">
						状态
					</td>
					<td width="10%">
						题号
					</td>
					<td width="30%">
						标题
					</td>
					<td width="10%">
						通过
					</td>
					<td width="10%">
						提交
					</td>
					<td width="10%">
						通过率
					</td>
				</tr>
				<tbody id="content">
					<s:iterator value="tranList" status="index">
						<tr>
							<td>
								<s:if test='tranList[#index.index][0]=="T"'>
									<font color="green">Pass</font>
								</s:if>
								<s:else><font color="red">Wait</font></s:else>
							</td>
							<td>
								<a href="selectSub.action?subNo=${tranList[index.index][1]}">
									<s:property value="#index.index+1" /> </a>
							</td>
							<td>
								<a href="selectSub.action?subNo=${tranList[index.index][1]}">
									<s:property value="tranList[#index.index][2]" /> </a>
							</td>
							<td>
								<s:property value="tranList[#index.index][3]" />
							</td>
							<td>
								<s:property value="tranList[#index.index][4]" />
							</td>
							<td>
								<s:property value="tranList[#index.index][5]" />
								%
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<table>
				<tr>
					<td>
						<a href="#" onclick="firstPage();">首页</a>
					</td>
					<td>
						<a href="#" onclick="prePage();">上一页</a>
					</td>
					<td>
						<a href="#" onclick="nextPage();">下一页</a>
					</td>
					<td>
						<a href="#" onclick="lastPage();">尾页</a>
					</td>
					<td>
						<span id="pageindex"></span>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
function load() {
	var stu = '<%=student%>';
	if (stu == "null") {
		document.getElementById("tip").style.display = "none";
		document.getElementById("list").width = "70%";
		var tr = document.getElementById("list").getElementsByTagName("tr");
		var i;
		for (i = 0; i < tr.length; i++)
			tr[i].getElementsByTagName("td")[0].style.display = 'none';//隐藏第一列
	} else {
		document.getElementById("lgid").value=document.getElementById("langid").value;
	}
	Page(2, 'list', 'content');
}
function change() {
	document.getElementById("lang").submit();
	return true;
}
</script>
</html>
