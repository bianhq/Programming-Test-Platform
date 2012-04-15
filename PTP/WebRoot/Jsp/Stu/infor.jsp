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
		<meta http-equiv="description" content="消息公告">
		<script type="text/javascript" language="javascript"
			src="./Js/PageSplit.js">
		</script>
	</head>

	<body style="font-family: 华文楷体" onload="Page(9,'news','content');">
		<h1 style="color:red">
			最新消息
		</h1>

		<table id="news" style="font-size: 20px">
		<tbody id="content">
			<s:iterator value="newsList" status="index">
				<tr>
					<td>
						<s:date name="newsList[#index.index][3]" format="yyyy/MM/dd HH:mm:ss" />
					</td>
				</tr>
				<tr>
					<td>
						<s:property value="newsList[#index.index][1]" />
					</td>
					<td>
						<a href="#" onclick="show(<s:property value="#index.index" />)">[查看详情]</a>
					</td>
				</tr>
				<tr>
					<td style="color:red;display:none">
					<pre><s:property value="newsList[#index.index][2]" /></pre>
					</td>
				</tr>
			</s:iterator>
			</tbody>
		</table>
		<table>
				<tr>
					<td>
						<a href="#" onclick="firstPage();refresh();">首页</a>
					</td>
					<td>
						<a href="#" onclick="prePage();refresh();">上一页</a>
					</td>
					<td>
						<a href="#" onclick="nextPage();refresh();">下一页</a>
					</td>
					<td>
						<a href="#" onclick="lastPage();refresh();">尾页</a>
					</td>
					<td>
						<span id="pageindex"></span>
					</td>
				</tr>
			</table>
	</body>
	<script type="text/javascript">
function show(obj) {
	obj = obj%3;
	var id = (obj + 1) * 3 - 1;
	var tr = document.getElementById("news").getElementsByTagName("tr");
	tr[id].getElementsByTagName("td")[0].style.display='';//显示
	window.parent.document.getElementById("show").onload();
}
function refresh(){
	var tb = document.getElementById("news");
	var tr = document.getElementById("news").getElementsByTagName("tr");
	var rows = tb.rows.length;
	if(rows==3){
	tr[2].getElementsByTagName("td")[0].style.display='none';//不显示
	}
	else if(rows==6){
	tr[2].getElementsByTagName("td")[0].style.display='none';//不显示
	tr[5].getElementsByTagName("td")[0].style.display='none';//不显示
	}
	else if(rows==9){
	tr[2].getElementsByTagName("td")[0].style.display='none';//不显示
	tr[5].getElementsByTagName("td")[0].style.display='none';//不显示
	tr[8].getElementsByTagName("td")[0].style.display='none';//不显示
	}
	window.parent.document.getElementById("show").onload();
}
</script>
</html>
