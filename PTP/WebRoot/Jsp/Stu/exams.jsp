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
		<meta http-equiv="description" content="考试集列表显示页面">
		<script type="text/javascript" language="javascript"
			src="./Js/PageSplit.js">
</script>
	</head>

	<body style="font-family: 华文楷体" onload="Page(2,'list','content');">
		<h1>
			考试集列表
		</h1>
		<div width="100%">
			<table id="list" style="border-style: none" width="70%" border="1"
				rules="rows" bordercolor="#D2B48C" bgcolor="#F5DEB3">
				<tr>
					<td width="10%">
						序号
					</td>
					<td width="20%">
						标题
					</td>
					<td width="10%">
						教师
					</td>
					<td width="10%">
						状态
					</td>
				</tr>
				<tbody id="content">
					<s:iterator value="examList" status="index">
						<tr>
							<td>
								<a id="examNo"
									href="selectExam.action?examNo=${examList[index.index][0]}"
									onclick="return check('${examList[index.index][3]}')"> <s:property
										value="#index.index+1" /> </a>
							</td>
							<td>
								<a id="examName"
									href="selectExam.action?examNo=${examList[index.index][0]}"
									onclick="return check('${examList[index.index][3]}')"> <s:property
										value="examList[#index.index][1]" /> </a>
							</td>
							<td>
								<s:property value="examList[#index.index][2]" />
							</td>
							<td>
								<s:property value="examList[#index.index][3]" />
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
		</div>
	</body>
	<script type="text/javascript">
//检查该考试是否结束，只有结束的考试才可查看其题目
function check(obj) {
	if (obj == "已结束") {
		return true;
	} else {
		alert("考试进行中，拒绝访问!");
		return false;
	}
}
function refresh(){
	window.parent.document.getElementById("show").onload();
}
</script>
</html>
