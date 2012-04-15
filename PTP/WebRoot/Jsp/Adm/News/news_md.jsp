<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>消息发布管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="消息修改界面">
		<script language="javascript" type="text/javascript"
			src="../../../Js/My97DatePicker/WdatePicker.js">
</script>
		<style type="text/css">
.addnews {
	width: 70%;
}

.inp {
	width: 300px;
	height: 140px;
	text-align: center;
	font-size: 16px;
	font-family: 华文楷体;
}
</style>

	</head>

	<body style="font-family: 华文楷体">
		<h2>
			消息发布
		</h2>
		<div class="addnews">
			<form action="md_news.action" method="post" onsubmit="return check()">
			<input type="hidden" name="newid" value='<s:property value='newid'/>'>
				<table width="70%" border="1"
					style="margin-left: 2px; margin-bottom: 2px">
					<caption>
						消息修改
						<hr color="rgb(217,154,98)">
					</caption>
					<tr>
						<td>
							摘要
						</td>
						<td>
							<input type="text" style="font-family: 华文楷体; font-size: 16px;"
								id="title" name="title" value='<s:property value='title'/>'>
						</td>
					</tr>
					<tr>
						<td>
							内容
						</td>
						<td align="center">
							<textarea class="inp" id="content" name="content"><s:property value='content' /></textarea>
						</td>
						<tr>
							<td>
								时间
							</td>
							<td>
								<input type="text" style="font-family: 华文楷体; font-size: 16px;"
									id="time" name="time" value='<s:property value='time'/>'
									onclick="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})">
							</td>
						</tr>
				</table>
				<input type="submit" id="sbt" value="更新"
					style="font-size: 16px; font-family: 华文楷体" />
			</form>
		</div>
	</body>
<script type="text/javascript">
function format(){
	var tmp ="";
	var words =document.getElementById("content").value;
	var len = words.length;
	var j = -1;
	for(i=0; i<len;i++){
		j++;
		if(words.charAt(i)=='\n'){
		j= 0;
		}else{
			if(j%30==0 &&  j !=0){
			tmp += words.charAt(i);
			tmp += "\n";
		}
		else
			tmp += words.charAt(i);
	}
		}
	document.getElementById("content").value = tmp;
}

function check() {
	with (document.all) {
		if (title.value == '' || content.value == '' || time.value == '') {
			alert("信息不完整，请完善!!");
			return false;
		} else{
			format();
			return true;
			}
	}
}
</script>
</html>
