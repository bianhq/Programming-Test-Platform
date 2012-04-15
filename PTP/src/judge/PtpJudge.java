package judge;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import adm.dao.AdmImpl;
import adm.entity.Lang;

import stu.dao.StuImpl;
import stu.entity.Excises;
import stu.entity.Exinfor;
import stu.entity.Submits;
import teac.dao.TeacImpl;

/**
 * <font face="华文楷体" color="red">程序在线评测核心模块之编译运行<br>
 * 开启线程，监视任务队列<br>
 * 从任务队列中取出任务，调用编译器编译、运行程序</font>
 * 
 * @author shawzt
 * @version 1.5
 * @build 2012/3/12
 * 
 */
public class PtpJudge extends Thread {
	private String[] curTask;
	private HashMap<Integer, String> hashMap;

	public PtpJudge() {
		this.start();
	}

	/**
	 * <font face="华文楷体" color="red">监控任务队列线程<br>
	 * 死循环，获取对首任务进行编译运行 </font>
	 */
	public void run() {
		while (true) {
			curTask = PtpTask.getTask();
			if (curTask != null) { // 队列中有任务
				System.out.println("Success to get Task!");
				check(curTask);
			}
		}
	}

	/**
	 * <font face="华文楷体" color="red">创建程序设计语言的HashMap</font>
	 * 
	 */
	private void HashMapOfLang() {
		AdmImpl aImpl = new AdmImpl();
		List<Lang> list = aImpl.findAllLangs();
		hashMap = new HashMap<Integer, String>();
		for (int i = 0; i < list.size(); i++) {
			hashMap.put(list.get(i).getLangId(), list.get(i).getLname());
		}
	}

	/**
	 * <font face="华文楷体" color="red">代码编译</font>
	 * 
	 * @param String
	 *            [] {file,lang,subNo,stuNo}
	 */
	protected void check(String[] task) {
		HashMapOfLang();
		// 开始评判
		int result = 0;
		String compileInfor = ""; // 编译信息 调用Compile(task) 无错返回"success"

		compileInfor = Compile(task);
		if (!compileInfor.endsWith("success")) { // 编译有错
			result = Constant.Compile_error;
			// 将该题测试结果写入excises表:有则更新,无则新增
			StuImpl stuImpl = new StuImpl();
			String sql = "SELECT Ex_Id,Sub_Id FROM excises WHERE Stu_No= ";
			sql += task[3];
			sql += " AND Sub_Id = ";
			sql += Integer.parseInt(task[2]);
			sql += " AND Lang_Id = ";
			sql += Integer.parseInt(task[1]);
			List<Object[]> hasList = stuImpl.findBySql(sql);
			if (hasList.isEmpty()) {
				Excises excise = new Excises();
				excise.setPass("F");
				excise.setSbts(1);
				excise.setSubId(Integer.parseInt(task[2]));
				excise.setStuNo(task[3]);
				excise.setLangId(Integer.parseInt(task[1]));
				stuImpl.add(excise);
			} else {
				sql = "UPDATE excises SET ";
				sql += "Sbts = Sbts+1 WHERE Ex_Id = ";
				sql += (Integer) hasList.get(0)[0];
				stuImpl.update(sql);
			}
			// 将该题测试结果写入submits表:有则更新,无则新增
			hasList.clear();
			sql = "SELECT Sbt_Id,Sub_Id FROM submits WHERE Sub_Id= ";
			sql += Integer.parseInt(task[2]);
			hasList = stuImpl.findBySql(sql);
			if (hasList.isEmpty()) {
				Submits submit = new Submits();
				submit.setSbts(1);
				submit.setAccepts(0);
				submit.setSubId(Integer.parseInt(task[2]));
				stuImpl.add(submit);
			} else {
				sql = "UPDATE submits SET Sbts = Sbts+1, ";
				sql += "Accepts = Accepts+0";
				sql += " WHERE Sbt_Id = ";
				sql += (Integer) hasList.get(0)[0];
				stuImpl.update(sql);
			}
			System.out.println("Compile Infor:" + compileInfor);
		} else {
			System.out.println("Success To Compile!");
			// 以下为根据输入数据执行提交的程序，输出与标准答案比对
			System.out.println(DoJudge(task));
		}
	}

	/**
	 * <font face="华文楷体" color="red">调用编译器部分</font>
	 * 
	 * @param String
	 *            [] {file,lang,subNo,stuNo}
	 * @return String {编译信息}
	 */
	protected String Compile(String[] task) {
		StringBuilder errorInfor = new StringBuilder(); // 编译信息
		String cmpCmd = ""; // 编译命令

		/* String[] task = {file,lang,subNo,stuNo}; */
		/* 任务参数 */
		String file = task[0];
		String name = hashMap.get(Integer.parseInt(task[1]));

		if (name.equals("C")) {
			String cp = Constant.C_PATH;
			cmpCmd = cp + file + " -o " + Constant.CODE_CMP + "/" + task[3]
					+ "/" + task[3] + ".exe ";
			System.out.println("Compile Command:" + cmpCmd);

			try {
				Process proc = Runtime.getRuntime().exec(cmpCmd);
				BufferedReader brd = new BufferedReader(new InputStreamReader(
						proc.getErrorStream()));
				String str;
				while ((str = brd.readLine()) != null) {
					errorInfor.append(str);
				}
				brd.close();
				proc.waitFor();
				if (proc.exitValue() == 0) { // 进程正常退出
					errorInfor.append(" -->success");
				} else {
					System.out.println("Compile Error:" + proc.exitValue());
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (name.equals("C++")) {
			String cpp = Constant.CP_PATH;
			cmpCmd = cpp + file + " -o " + Constant.CODE_CMP + "/" + task[3]
					+ "/" + task[3] + ".exe ";
			System.out.println("Compile Command:" + cmpCmd);

			try {
				Process proc = Runtime.getRuntime().exec(cmpCmd);
				BufferedReader brd = new BufferedReader(new InputStreamReader(
						proc.getErrorStream()));
				String str;
				while ((str = brd.readLine()) != null) {
					errorInfor.append(str);
				}
				brd.close();
				proc.waitFor();
				if (proc.exitValue() == 0) { // 进程正常退出
					errorInfor.append("-->success");
				} else {
					System.out.println("Compile Error:" + proc.exitValue());
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			String javac = Constant.JV_PATH;
			cmpCmd = javac + file;
			System.out.println("Compile Command:" + cmpCmd);

			try {
				Process proc = Runtime.getRuntime().exec(cmpCmd);
				BufferedReader brd = new BufferedReader(new InputStreamReader(
						proc.getErrorStream()));
				String str;
				while ((str = brd.readLine()) != null) {
					errorInfor.append(str);
				}
				brd.close();
				proc.waitFor();
				if (proc.exitValue() == 0) { // 进程正常退出
					errorInfor.append("-->success");
				} else {
					System.out.println("Compile Error:" + proc.exitValue());
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return errorInfor.toString();
	}

	/**
	 * <font face="华文楷体" color="red">根据测试数据运行程序并进行评判</font>
	 * 
	 * @param String
	 *            [] {file,lang,subNo,stuNo}
	 * @return String {运行信息}
	 */
	protected String DoJudge(String[] task) {
		String result = ""; // 运行信息
		String runCmd = ""; // 运行命令

		/* String[] task = {file,lang,subNo,stuNo}; */
		/* 任务参数 */
		String file = task[0];
		String name = hashMap.get(Integer.parseInt(task[1]));

		/* 对于C\C++只需要把数据作为参数运行生成的exe文件即可 */
		/* 对于Java 需要把数据作为参数调用JVM执生成的.class文件 */

		// 根据语言设定运行命令
		if (name.equals("C")) {
			runCmd = Constant.CODE_CMP + "/" + task[3] + "/" + task[3]
					+ ".exe ";
			System.out.println("Run Command:" + runCmd);
		} else if (name.equals("C++")) {
			runCmd = Constant.CODE_CMP + "/" + task[3] + "/" + task[3]
					+ ".exe ";
			System.out.println("Run Command:" + runCmd);
		} else {
			String java = Constant.JV_RUN;
			int index = file.lastIndexOf("/");
			runCmd = java + file.substring(0, index) + " "
					+ file.substring(index + 1, file.length() - 5);
			System.out.println("Run Command:" + runCmd);
		}
		// 运行测试C\C++代码
		try {
			/*
			 * 此处需要根据题号task[2] subNo，从后台数据库testsets表中取出相关的测试数据(输入、输出)
			 * 然后再依次用输入数据作为参数运行程序，结果和输出数据比较
			 */
			List<Object[]> datas = getTestDatas(task[2]);
			boolean pass = true; // 标识是否通过所有测试
			Date testTime = new Date(System.currentTimeMillis()); // 一次提交的所有测试时间记为一样，便于查询
			for (int i = 0; i < datas.size(); i++) {
				result = "";
				Process proc = Runtime.getRuntime().exec(runCmd);
				// PrintWriter用于向编译后可运行的程序写入运行数据
				PrintWriter pw = new PrintWriter(proc.getOutputStream(), true);
				pw.println(datas.get(i)[1].toString());
				BufferedReader brd = new BufferedReader(new InputStreamReader(
						proc.getInputStream())); // 获取运行结果
				String infor = "";
				while ((infor = brd.readLine()) != null) {
					result += infor;
				}
				brd.close();
				pw.close();
				proc.waitFor();
				if (proc.exitValue() == 0) { // 进程正常退出
					result += "";
					// 检查该测试结果
					if (!result.equals(datas.get(i)[2].toString())) {
						pass = false;
						// 将测试结果存入exinfor表
						Exinfor exinfor = new Exinfor();
						exinfor.setTestId((Integer) datas.get(i)[0]);
						exinfor.setPass("F");
						exinfor.setGetScore(0);
						exinfor.setStuNo(task[3]);
						exinfor.setSubId(Integer.parseInt(task[2]));
						exinfor.setLangId(Integer.parseInt(task[1]));
						exinfor.setTestTime(testTime);
						StuImpl stuImpl = new StuImpl();
						stuImpl.add(exinfor);
					} else {
						// 测试正确将测试结果存入exinfor表
						Exinfor exinfor = new Exinfor();
						exinfor.setTestId((Integer) datas.get(i)[0]);
						exinfor.setPass("T");
						exinfor.setGetScore((Integer) datas.get(i)[3]);
						exinfor.setStuNo(task[3]);
						exinfor.setSubId(Integer.parseInt(task[2]));
						exinfor.setLangId(Integer.parseInt(task[1]));
						exinfor.setTestTime(testTime);
						StuImpl stuImpl = new StuImpl();
						stuImpl.add(exinfor);
					}
				} else {
					System.out.println("Run Error:" + proc.exitValue());
				}
			} // 测试结束
				// 将该题测试结果写入excises表:有则更新,无则新增
			StuImpl stuImpl = new StuImpl();
			String sql = "SELECT Ex_Id,Sub_Id FROM excises WHERE Stu_No= ";
			sql += task[3];
			sql += " AND Sub_Id = ";
			sql += Integer.parseInt(task[2]);
			sql += " AND Lang_Id = ";
			sql += Integer.parseInt(task[1]);
			List<Object[]> hasList = stuImpl.findBySql(sql);
			if (hasList.isEmpty()) {
				Excises excise = new Excises();
				excise.setPass(pass == true ? "T" : "F");
				excise.setSbts(1);
				excise.setSubId(Integer.parseInt(task[2]));
				excise.setStuNo(task[3]);
				excise.setLangId(Integer.parseInt(task[1]));
				stuImpl.add(excise);
			} else {
				sql = "UPDATE excises SET Pass = ( ";
				sql += "CASE Pass WHEN  'F' THEN ";
				sql += (pass == true ? "\'T\'" : "\'F\'");
				sql += " ELSE Pass END )";
				sql += ",Sbts = Sbts+1 WHERE Ex_Id = ";
				sql += (Integer) hasList.get(0)[0];
				stuImpl.update(sql);
			}
			// 将该题测试结果写入submits表:有则更新,无则新增
			hasList.clear();
			sql = "SELECT Sbt_Id,Sub_Id FROM submits WHERE Sub_Id= ";
			sql += Integer.parseInt(task[2]);
			hasList = stuImpl.findBySql(sql);
			if (hasList.isEmpty()) {
				Submits submit = new Submits();
				submit.setSbts(1);
				submit.setAccepts(pass == true ? 1 : 0);
				submit.setSubId(Integer.parseInt(task[2]));
				stuImpl.add(submit);
			} else {
				sql = "UPDATE submits SET Sbts = Sbts+1, ";
				sql += "Accepts = Accepts+";
				sql += (pass == true ? 1 : 0);
				sql += " WHERE Sbt_Id = ";
				sql += (Integer) hasList.get(0)[0];
				stuImpl.update(sql);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result.toString();
	}

	/**
	 * <font face="华文楷体" color="red">根据传入的题目号subNo从testsets表中取出所有相关的测试数据</font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	protected List<Object[]> getTestDatas(String subNo) {
		List<Object[]> datas = new ArrayList<Object[]>(5);
		String sql = "SELECT Test_Id,TData,Result,Score FROM testsets  WHERE Sub_Id = ";
		sql += Integer.parseInt(subNo);
		TeacImpl tImpl = new TeacImpl();
		datas = tImpl.findBySql(sql);
		return datas;
	}
}
