<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="teac.entity.Examinations"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Examinations exam = (Examinations) session.getAttribute("exam");
	String state="enable";	//是否允许提交代码,注:进入此页面说明考试已经结束
	if(exam.getPass().equals("已结束") || exam.getPass().equals("未开始"))
		state ="disable";
	else
		state = "enable";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="考试对应的题目列表页">
	</head>

	<body style="font-family: 华文楷体">
		<h1>
			<b><%=exam.getExamName()%></b>
		</h1>
		<h5 style="color: orange">
			时间:<%=exam.getStartTime()%>~~<%=exam.getEndTime()%></h5>
		<div width="100%">
			<table style="border-style: none" width="60%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#F5DEB3">
				<tr>
					<td width="10%">
						序号
					</td>
					<td width="20%">
						标题
					</td>
					<td width="20%">
						分值
					</td>
				</tr>
				<s:iterator value="subsList" status="index">
					<tr>
						<td>
							<a href="selectSub.action?subNo=${subsList[index.index][0]}&state='<%=state %>'">
								<s:property value="#index.index+1" /> </a>
						</td>
						<td>
							<a href="selectSub.action?subNo=${subsList[index.index][0]}&state='<%=state %>'">
								<s:property value="subsList[#index.index][1]" /> </a>
						</td>
						<td>
							<s:property value="subsList[#index.index][2]" />
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</body>
</html>
