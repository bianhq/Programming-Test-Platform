<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
td {
	text-align: "left";
	padding-right: 20px;
}

#ques_td{
font-size:16px;
font-weight:bold;
}
p,ul {
	font-family: "华文楷体 ";
}
</style>
	</head>

	<body style="font-family: 华文楷体">
			<h1>
				帮助
			</h1>
			<h2>
				<a id="judge" href="#" onclick="show(this)">[评分]</a>
			</h2>
			<p>
				试题的解答提交后由评分系统评出即时得分，每一次提交会判决结果会及时通知；系统可能的反馈信息包括：
			</p>
			<table id="judge_t"
				style="font-family: 华文楷体; border-style: none; display: none"
				bordercolor="yellow" border="1" rules="rows">
				<thead>
					<th align="left">
						结果
					</th>
					<th align="left">
						说明
					</th>
				</thead>
				<tr>
					<td>
						<span> 等待评测 </span>
					</td>
					<td>
						评测系统还没有评测到这个提交，请稍候
					</td>
				</tr>
				<tr>
					<td>
						<span> 正在评测 </span>
					</td>
					<td>
						评测系统正在评测，稍候会有结果
					</td>
				</tr>
				<tr>
					<td>
						<span> 编译错误 </span>
					</td>
					<td>
						您提交的代码无法完成编译，点击“编译错误”可以看到编译器输出的错误信息
					</td>
				</tr>
				<tr>
					<td>
						<span> 答案正确 </span>
					</td>
					<td>
						恭喜！您通过了这道题
					</td>
				</tr>
				<tr>
					<td>
						<span> 部分正确 </span>
					</td>
					<td>
						您的代码只通过了部分测试点，继续努力！
					</td>
				</tr>
				<tr>
					<td>
						<span> 格式错误 </span>
					</td>
					<td>
						您的程序输出的格式不符合要求（比如空格和换行与要求不一致）
					</td>
				</tr>
				<tr>
					<td>
						<span> 答案错误 </span>
					</td>
					<td>
						您的程序未能对评测系统的数据返回正确的结果
					</td>
				</tr>
				<tr>
					<td>
						<span> 运行超时 </span>
					</td>
					<td>
						您的程序未能在规定时间内运行结束
					</td>
				</tr>
				<tr>
					<td>
						<span> 内存超限 </span>
					</td>
					<td>
						您的程序使用了超过限制的内存
					</td>
				</tr>
				<tr>
					<td>
						<span> 异常退出 </span>
					</td>
					<td>
						您的程序运行时发生了错误
					</td>
				</tr>
				<tr>
					<td>
						<span> 返回非零 </span>
					</td>
					<td>
						您的程序结束时返回值非 0，如果使用 C 或 C++ 语言要保证 int main 函数最终 return 0
					</td>
				</tr>
				<tr>
					<td>
						<span> 浮点错误 </span>
					</td>
					<td>
						您的程序运行时发生浮点错误，比如遇到了除以 0 的情况
					</td>
				</tr>
				<tr>
					<td>
						<span> 段错误 </span>
					</td>
					<td>
						您的程序发生段错误，可能是数组越界，堆栈溢出（比如，递归调用层数太多）等情况引起
					</td>
				</tr>
				<tr>
					<td>
						<span> 多种错误 </span>
					</td>
					<td>
						您的程序对不同的测试点出现不同的错误
					</td>
				</tr>
				<tr>
					<td>
						<span> 内部错误 </span>
					</td>
					<td>
						评测系统发生内部错误，无法评测。工作人员会努力排查此种错误
					</td>
				</tr>
			</table>

			<h2>
				<a id="ques" href="#" onclick="show(this)">[常见问题]</a>
			</h2>
			<table id="ques_t" width="85%" style="display:none">
				<tr>
					<td id="ques_td">
						1.我应该从哪里读输入，另外应该输出到哪里？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						如果没有特别说明，你的程序应该从标准输入(stdin，传统意义上的"键盘")读入数据，
						并输出到标准输出(stdout，传统意义上的"屏幕")。
						<font color="red">不要使用文件做输入输出。<br>
							由于系统每次只检测一个测试用例，所以对于有多组测试用例的题目， 程序中不能使用循环处理所有数据，只能按题目每次只输入一组测试数据。<br>
							即以下的数据输入是不被允许的:<br> while(有输入数据)<br>{/*处理代码,输出结果*/}</font>
					</p>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						2.为什么我的程序交在这里得到编译错误，而我在自己的机器上已经编译通过了？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						本系统所使用的编译器和你在自己机器上使用的可能有区别，请留意几个常见的地方：
					</p>
					<ul>
						<li>
						本系统是 64 位 Linux 系统，使用的编译器版本和编译参数可以参见
							<a href="#compile">[编译器帮助]</a>
						</li>
						<li>
							Java 代码需使用 "Main_所做的题号"作为主类名,如Main_1
						</li>
						<li>
							Visual C++ 6.0 和 Turbo C++ 3.0 （及它们的更低版本）有较多违背 C++
							标准的地方，不要使用它们来判断 C++ 程序语法上是否有问题
						</li>
						<li>
							C++ 下 64 位整数的类型是 long long，不要使用 _int64
						</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						3.为什么我的程序得到了“返回非零”？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						返回零表示一个程序正常结束。<br>
						如果没有返回零，则系统认为程序没有正常结束，这时即便输出了正确的内容也不予通过
					</p>
					<ul>
						<li>
							C 或 C++ 代码请确认 int main 函数且return 0，不要声明为 double main 或者 void main
						</li>
						<li>
							有异常的语言，请确认程序处理了可能抛出的异常
						</li>
					</ul>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						4.程序的时间和内存占用是如何计算的？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						程序的运行时间为程序在所有 CPU 核占用的时间之和，内存占用取程序运行开始到结束占用内存的最大值
					</p>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						5.为什么同样的程序运行时间和所用内存会不同？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						程序运行时间会受到许多因素的影响，尤其是在现代多任务操作系统以及在使用动态库的情况下，多次使用同一输入运行同一程序所需时间和内存有一些不同是正常现象。我们的题目给出的运行限制一般为标准程序的若干倍，也就是说，选用正确的算法和合适的语言，那么运行限制是富余的
					</p>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						6.不同语言的时间限制和内存限制是相同的吗？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						是相同的，且目前所设限制足够宽松。
					</p>
					</td>
				</tr>
				<tr>
					<td id="ques_td">
						7.我提交的代码可以做什么，有什么限制吗？
					</td>
				</tr>
				<tr>
				<td>
					<p>
						没有。这里没有系统调用白名单，也没有针对语言限制可使用的包或库。<br>
						如果你需要使用我们系统没有提供的某个语言的某个库，或者需要更改编译参数，可以联系我们<br>
						虽然我们比较宽容大度，但还是请不要做不符合道义的事情。<font color="red">提交代码后系统会记录你的IP、MAC</font>
					</p>
					</td>
				</tr>
				</table>
			<h2>
				其他问题
			</h2>
			<p>
				在考试或比赛中遇到其他问题请咨询现场工作人员
			</p>
			<h2 id="compile">
				平台编译器信息
			</h2>
			<table style=" border-style: none;width:80%"
				bordercolor="green" border="1">
				<tr>
					<td>
						语言
					</td>
					<td>
						编译器
					</td>
				</tr>
				<tr>
					<td>C++</td>
					<td>gcc version 4.4.6 20110731 (Red Hat 4.4.6-3) (GCC)</td>
				</tr>
				<tr>
					<td>C</td>
					<td>gcc version 4.4.6 20110731 (Red Hat 4.4.6-3) (GCC)</td>
				</tr>
				<tr>
					<td>Java</td>
					<td>java version "1.6.0_31" \ Java(TM) SE Runtime Environment (build 1.6.0_31-b04)</td>
				</tr>		
			</table>
	</body>
	<script type="text/javascript">
function show(obj) {
	switch (obj.id) {
	case "judge": {
		if (document.getElementById("judge_t").style.display == "none")
			document.getElementById("judge_t").style.display = "";
		else
			document.getElementById("judge_t").style.display = "none";
		break;
	}
	case "ques": {
		if (document.getElementById("ques_t").style.display == "none")
			document.getElementById("ques_t").style.display = "";
		else
			document.getElementById("ques_t").style.display = "none";
		break;
	}
	case "judge": {
		if (document.getElementById("judge_t").style.display == "none")
			document.getElementById("judge_t").style.display = "";
		else
			document.getElementById("judge_t").style.display = "none";
		break;
	}
	}
	window.parent.document.getElementById("show").onload();
}
</script>
</html>
