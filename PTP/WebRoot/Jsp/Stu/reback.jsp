<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="stu.entity.Student"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Student student = (Student) session.getAttribute("stu");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>结果反馈</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="提交反馈页面">

	</head>

	<body style="font-family: 华文楷体" onload="load()">
		<h1>
			提交反馈
		</h1>
		<h6 style="color: red">
			Tip:自动刷新间隔5秒
		</h6>
		<div width="100%">
			<label id="tip" style="display: none; color: brown">
				<b>
				<i> 未登录,最多显示最近10名提交情况!</i>
				</b>
			</label>
			<table style="border-style: none; margin-bottom: 80px" width="70%"
				border="1" rules="rows" bordercolor="#D2B48C" bgcolor="#9ACD32">
				<tr>
					<td>
						题号
					</td>
					<td>
						题目
					</td>
					<td>
						使用语言
					</td>
					<td>
						提交时间
					</td>
					<td>
						提交者
					</td>
					<td>
						得分
					</td>
					<td>
						总分
					</td>
				</tr>
				<s:iterator value="result" status="index">
					<tr>
						<td>
							<s:property value="result[#index.index][0]" />
						</td>
						<td>
							<s:property value="result[#index.index][1]" />
						</td>
						<td>
							<s:property value="result[#index.index][2]" />
						</td>
						<td style="color:red">
							<s:date name="result[#index.index][3]"
								format="yyyy/MM/dd HH:mm:ss" />
						</td>
						<td>
							<s:property value="result[#index.index][4]" />
						</td>
						<td>
							<s:property value="result[#index.index][5]" />
						</td>
						<td>
							<s:property value="result[#index.index][6]" />
						</td>
					</tr>
				</s:iterator>
			</table>
			<div id="detail">
				<h2>
					测试情况
				</h2>
				<table style="border-style: none" width="70%" border="1"
					rules="rows" bordercolor="#D2B48C" bgcolor="#F5DEB3">
					<tr>
						<td width="10%">
							测试序号
						</td>
						<td width="10%">
							分值
						</td>
						<td width="30%">
							测试结果
						</td>
						<td width="10%">
							得分
						</td>
					</tr>
					<s:iterator value="inforList" status="index">
						<tr>
							<td>
								<s:property value="#index.index+1" />
							</td>
							<td>
								<s:property value="inforList[#index.index][0]" />
							</td>
							<td>
								<s:property value="inforList[#index.index][1]" />
							</td>
							<td>
								<s:property value="inforList[#index.index][2]" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</body>
	<script type="text/javascript">
//根据是否登录选择显示测试情况
function load() {
	var stu = '<%=student%>';
	if (stu == "null") {
		document.getElementById("detail").style.display = "none";
		document.getElementById("tip").style.display = "";
	}
}
//屏蔽鼠标右键  
function document.oncontextmenu(){event.returnValue=false;}
//屏蔽 F5 刷新键  
	function document.onkeydown(){  
if (event.keyCode==116){ 
  event.keyCode=0;  
  event.returnValue=false;  
  }
}
function refresh() 
{ 
window.location.reload(); 
} 
setTimeout('refresh()',5000); //指定5秒刷新一次 
</script>
</html>