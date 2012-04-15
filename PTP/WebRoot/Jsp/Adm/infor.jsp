<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="日志界面">
		<style type="text/css">
.logs {
	width: 80%;
}
</style>
		<script type="text/javascript" language="javascript"
			src="./Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体"
		onload="Page(8,'logTable','content');">
		<h2>
			日志
		</h2>
		<p style="font-size: 20px">
			Here are some logs that for administer!
		</p>
		<div class="logs">
			<table id="logTable" width="90%" border="1" rules="rows"
				bordercolor="#D2B48C" bgcolor="#C0C0C0"
				style="border-style: none; margin-left: 2%; margin-top: 2%; margin-bottom: 2%; color: rgb(128, 0, 0)">
				<tr>
					<td align="center">
						时间
					</td>
					<td align="center">
						信息
					</td>
				</tr>
				<tbody id="content">
					<s:iterator value="logs">
						<tr>
							<td align="center">
								<s:date name="logDate" format="yyyy/MM/dd HH:mm:ss" />
							</td>
							<td align="center">
								<s:property value="logInfor" />
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
</html>
