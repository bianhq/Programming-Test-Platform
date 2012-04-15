<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	Teacher teacher = (Teacher) request.getSession().getAttribute(
			"teac");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="所有题目">
		<style type="text/css">
.lstsb { /*background-color: gray;*/
	width: 70%;
	margin-top: -12px;
}

.lstsb td {
	text-align: center;
}

.bt {
	font-size: 16px;
	font-family: 华文楷体;
	color: #8B0000;
}

.inp {
	text-align: center;
	font-size: 14px;
	font-family: 华文楷体;
	color: red;
}
</style>
	</head>

	<body style="font-family: 华文楷体">
		<h2>
			题目列表
		</h2>
		<div class="lstsb">
			<form method="post" action="bind_sbjs.action">
				<table width="100%" border="1"
					style="margin-left: 2px; margin-bottom: 2px">
					<caption class="inp">
						考试号:
						<input class="inp" name="examNo"
							value='<s:property value="examNo" />' readonly="readonly">
						考试名称:
						<input class="inp" name="examNa"
							value='<s:property value="examNa" />' readonly="readonly">
					</caption>
					<tr>
						<td>
							已选
						</td>
						<td>
							序号
						</td>
						<td>
							题目
						</td>
						<td>
							描述
						</td>
						<td>
							类别
						</td>
						<td>
							分值
						</td>
					</tr>
					<s:iterator value="subjects" status="index">
						<tr>
							<td>
								<input type="checkbox" name="select" onclick="Select(this)"
									<s:iterator value="ques" status="idx">
									<s:if test="subjects[#index.index][0]==ques[#idx.index]">checked="checked"</s:if>
									</s:iterator>
									value='<s:property value="subjects[#index.index][0]" />'>
							</td>
							<td>
								<s:property value="#index.index+1" />
							</td>
							<td>
								<s:property value="subjects[#index.index][1]" />
							</td>
							<td>
								<s:property value="subjects[#index.index][2]" />
							</td>
							<td>
								<s:property value="subjects[#index.index][3]" />
							</td>
							<td>
								<s:property value="subjects[#index.index][4]" />
							</td>
						</tr>
					</s:iterator>
				</table>
				<input type="submit" style="font-size: 16px; font-family: 华文楷体"
					value="提交">
			</form>
		</div>
	</body>
	<script type="text/javascript">
function Select(obj) {
	par = obj.value;
	//alert("选中的项为:" + par);
}
</script>
</html>
