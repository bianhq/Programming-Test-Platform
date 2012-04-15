<%@ page language="java" import="java.util.*,adm.entity.Teacher"
	pageEncoding="utf-8"%>
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
		<meta http-equiv="description" content="考试设置之新增页面">
		<script language="javascript" type="text/javascript"
			src="../../../Js/My97DatePicker/WdatePicker.js">
</script>
		<style type="text/css">
.addex { /*background-color: gray;*/
	width: 60%;
}

.addex td {
	text-align: center;
}

.inp {
	width: 150px;
	height: 40px;
	text-align: center;
	line-height: 34px;
	font-size: 18px;
	font-family: 华文楷体;
}

#state,#id_time {
	border-style: ridge;
	background-color: gray;
}
</style>
	</head>

	<body style="font-family: 华文楷体">
		<h2>
			考试设置
		</h2>
		<div class="addex">
			<form method="post" action="add_exam.action"
				onsubmit="return check()">
				<input type="hidden" name="teacid"
					value="<%=teacher.getTeacherId()%>">
				<table width="100%" border="0"
					style="margin-left: 2px; margin-bottom: 2px">
					<caption>
						新增考试
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							考试名称:
						</td>
						<td>
							<input class="inp" type="text" id="id_examName" name="examName">
						</td>
						<td>
							类别:
						</td>
						<td>
							<select class="inp" id="id_cate" name="category">
								<option value="测试">
									测试
								</option>
								<option value=" 期中">
									期中
								</option>
								<option value="期末">
									期末
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							开始时间:
						</td>
						<td>
							<input class="inp" type="text" id="id_sTime" name="startTime"
								onclick="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})"
								onchange="setLast()">
						</td>
						<td>
							结束时间:
						</td>
						<td>
							<input class="inp" type="text" id="id_eTime" name="endTime"
								onclick="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})"
								onchange="setLast()">
						</td>
					</tr>
					<tr>
						<td>
							时长:
						</td>
						<td>
							<input class="inp" type="text" id="id_time" name="last"
								readonly="readonly">
						</td>
						<td>
							状态:
						</td>
						<td>
							<input class="inp" type="text" id="state" name="pass"
								readonly="readonly" style="color: red">
						</td>
					</tr>
				</table>
				<input type="submit" id="sbt" value="新增"
					style="font-size: 16px; font-family: 华文楷体" />
			</form>
		</div>
	</body>
	<script type="text/javascript" language="javascript">
function check() {
	with (document.all) {
		if (id_examName.value == '' || id_cate.value == ''
				|| id_sTime.value == '' || id_eTime.value == ''
				|| id_time.value == '' || state.value == '') {
			alert("信息不完整，请完善!!");
			return false;
		} else
			return true;
	}
}

function setLast() {
	with (document.all) {
		if (id_sTime.value == '' || id_eTime.value == '') {
			;
		} else {
			sdate = new Date(id_sTime.value);
			edate = new Date(id_eTime.value);
			if (edate.getTime() < sdate.getTime()) {
				alert("结束时间必须大于开始时间!");
				id_sTime.value = id_eTime.value = "";
			} else {
				//不足一分钟不计
				id_time.value = Math.floor((edate.getTime() - sdate.getTime())
						/ (1000 * 60));
				now = new Date();
				if (now.getTime() < sdate.getTime())
					state.value = "未开始";
				else if (now.getTime() >= sdate.getTime()
						&& now.getTime() < edate.getTime())
					state.value = "进行中";
				else
					state.value = "已结束";
			}
		}
	}
}
</script>

</html>
