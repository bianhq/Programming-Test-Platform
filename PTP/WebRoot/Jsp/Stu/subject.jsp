<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="teac.entity.Subjects"%>
<%@page import="stu.entity.Student"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Subjects subject = (Subjects) session.getAttribute("subject");
	String state = (String)session.getAttribute("state");
	Student student;
	if (session.getAttribute("stu") == null){
		student = new Student();
		student.setStuNo("000");		//	未登录用户，只能查看题目信息
	}
	else
		student = (Student) session.getAttribute("stu");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>题目</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="单个题目详细信息页面">

	</head>

	<body onload="load()">
		<div style="font-family: 华文楷体">
			<h1>
				<b><%=subject.getSubId()%>.&nbsp;<%=subject.getTitle()%></b>
			</h1>
			<p>
				<%=subject.getDescription()%>
			</p>
			<h2>
				<b>Input</b>
			</h2>
			<p>
				<%=subject.getInput()%>
			</p>
			<h2>
				<b>Output</b>
			</h2>
			<p>
				<%=subject.getOutput()%>
			</p>
			<h2>
				<b>Sample Input</b>
			</h2>
			<p>
				<%=subject.getSampleInput()%>
			</p>
			<h2>
				<b>Sample Output</b>
			</h2>
			<p>
				<%=subject.getSampleOutput()%>
			</p>
		</div>
		<hr>
		<input type="button" id="expend" value="提交代码"
			style="font-family: 华文楷体; color: red; font-size: 14px"
			onclick="show()">
		<div id="edit" style="display: none">
			<form method="post" action="codes.action" onsubmit="return check()">
				<input type="hidden" name="subNo" value="<%=subject.getSubId()%>">
				<input type="hidden" id="stuNo" name="stuNo">
				<label style="font-family: 华文楷体; color: rgb(128, 0, 36)">
					程序设计语言:
				</label>
				<s:select name="lgid" list="langs" listKey="langId"
						listValue="lname" value="langId" cssStyle="font-family: 华文楷体; font-size: 14px">
				</s:select>
				<br>
				<textarea id="code" name="code" rows="20" cols="90"
					style="font-size: 15px"></textarea>
				<br>
				<input type="submit" id="sbt" value="提交运行"
					style="font-family: 华文楷体; color: red; font-size: 14px">
				<input type="reset" id="cancle" value="取消"
					style="font-family: 华文楷体; color: blue; font-size: 14px">
			</form>
		</div>
	</body>
	<script type="text/javascript">
function load() {
	/*
	 *区别未登录和已登录用户查看题目时的页面显示
	*未登录用户只能查看题目信息，无法提交代码
	 * 已登录的用户，只有考试进行中的题目才可以提交代码
	 */
	var stuno = <%=student.getStuNo()%>;
	var state = <%=state%>;
	if (stuno == "000") {
		document.getElementById("expend").style.display = "none";
	} else {
		document.getElementById("stuNo").value = stuno;
		if(state=="disable")
			document.getElementById("expend").style.display = "none";
	}
}
function show() {
	with (document.all) {
		expend.disabled = "disabled";
		edit.style.display = "";
		code.focus();
		window.parent.document.getElementById("show").onload();
	}
}
function check() {
	with (document.all) {
		if (code.value == "") {
			alert("提交内容不许为空!");
			return false;
		} else
			return true;
	}
}
</script>
</html>
