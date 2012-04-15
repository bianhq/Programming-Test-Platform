package stu.action;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import judge.Constant;
import judge.PtpTask;

import org.apache.struts2.ServletActionContext;

import adm.dao.AdmImpl;
import adm.entity.Lang;

import com.opensymphony.xwork2.ActionSupport;

import stu.dao.StuImpl;
import stu.entity.Student;
import teac.dao.TeacImpl;
import teac.entity.Examinations;
import teac.entity.Subjects;

/**
 * <font face="华文楷体" color="red">代码提交处理类</font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/20
 * 
 */
public class StuexcAction extends ActionSupport {
	/*
	 * 以下字段名称对应业务处理代码在该action中的相关Jsp页面中name一致的控件 get()方法:获取Jsp页面name一致的控件值
	 * set()方法:设置Jsp页面name一致的控件显示内容
	 */
	private String cppath; // 待编译代码文件路径

	private String subNo;
	private String stuNo;
	private String code;
	private String examNo;
	private Examinations examinations;
	private String state;
	// 以下两个字段用于登录后的训练集语言选择
	private String lgid = "1";
	private String langid;

	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}

	public String getExamNo() {
		return examNo;
	}

	public Examinations getExaminations() {
		return examinations;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setLgid(String lgid) {
		this.lgid = lgid;
	}

	public String getLangid() {
		return langid;
	}

	/*
	 * 以下List<>对应业务处理代码在该action中的相关Jsp页面中<s:iterator>的需要的数据
	 * get()方法:设置Jsp页面name一致的控件显示内容
	 */
	private List<Lang> langs;
	private List<Object[]> tranList;
	private Subjects subject;
	private List<Object[]> examList;
	private List<Object[]> subsList;
	private List<Object[]> result;
	private List<Object[]> inforList;

	public List<Lang> getLangs() {
		return langs;
	}

	public List<Object[]> getTranList() {
		return tranList;
	}

	public Subjects getSubject() {
		return subject;
	}

	public List<Object[]> getExamList() {
		return examList;
	}

	public List<Object[]> getSubsList() {
		return subsList;
	}

	public List<Object[]> getResult() {
		return result;
	}

	public List<Object[]> getInforList() {
		return inforList;
	}

	/*
	 * 以下为业务逻辑处理代码
	 */
	/**
	 * <font face="华文楷体" color="red">显示训练集所有题目</font>
	 * 
	 * @return SUCCESS
	 */
	public String showSubjects() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Student student = (Student) request.getSession().getAttribute("stu");
		this.langid = this.lgid;

		String sql = "SELECT ";
		if (student != null) {
			sql += "( SELECT CASE WHEN (exc.Pass IS NULL) THEN 'F' ELSE exc.Pass END";
			sql += " FROM excises AS exc";
			sql += " WHERE exc.Sub_Id = sj.Sub_Id";
			sql += " AND exc.Stu_No = ";
			sql += student.getStuNo();
			sql += " AND exc.Lang_Id = ";
			sql += this.lgid;
			sql += " )AS Pass,";
		} else {
			sql += "sj.Category,";
		}
		sql += "sj.Sub_Id,Title,";
		sql += "CASE WHEN (st.Accepts IS NULL) THEN 0 ELSE st.Accepts END AS Accepts,";
		sql += "CASE WHEN (st.Sbts IS NULL) THEN 0 ELSE st.Sbts END AS Sbts,";
		sql += "CASE WHEN (st.Accepts/st.Sbts) IS NULL THEN 0 ELSE ROUND(st.Accepts*100/st.Sbts) END AS Rate";
		sql += " FROM subjects AS sj";
		sql += " LEFT OUTER JOIN submits AS st";
		sql += " ON sj.Sub_Id = st.Sub_Id";
		sql += " WHERE sj.Visible='T'";
		StuImpl sImpl = new StuImpl();
		AdmImpl aImpl = new AdmImpl();
		tranList = sImpl.findListBySQL(sql);
		langs = new ArrayList<Lang>();
		langs = aImpl.findAllLangs();
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">显示选中题目详细信息</font>
	 * 
	 * @return SUCCESS
	 */
	public String showSub() {
		StuImpl sImpl = new StuImpl();
		AdmImpl aImpl = new AdmImpl();
		subject = sImpl.findSubById(Integer.parseInt(this.subNo));
		langs = new ArrayList<Lang>();
		langs = aImpl.findAllLangs();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("subject", subject);
		session.setAttribute("state", this.state);
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">显示考试集</font>
	 * 
	 * @return SUCCESS
	 */
	public String showExams() {
		TeacImpl tImpl = new TeacImpl();
		String sql = "UPDATE examinations SET Pass = (";
		sql += "CASE WHEN (Start_Time<NOW() && End_Time<NOW()) THEN \"已结束\"";
		sql += "WHEN (Start_Time<=NOW() && End_Time>NOW()) THEN \"进行中\"";
		sql += "WHEN (Start_Time>NOW() && End_Time>NOW()) THEN \"未开始\"";
		sql += "ENd)";
		tImpl.update(sql);

		sql = "SELECT Exam_Id,Exam_Name,";
		sql += "(SELECT TName FROM teacher WHERE teacher.Teacher_Id=examinations.Teacher_Id),";
		sql += "Pass FROM examinations";
		StuImpl sImpl = new StuImpl();
		examList = sImpl.findListBySQL(sql);
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">显示选中的考试题目列表</font>
	 * 
	 * @return string
	 */
	public String showSubs() {
		String sql = "SELECT Sub_Id,Title,";
		sql += "(SELECT SUM(Score) FROM testsets WHERE testsets.Sub_Id=subjects.Sub_Id) ";
		sql += "FROM subjects ";
		sql += "WHERE Sub_Id IN ";
		sql += "(SELECT Sub_Id FROM examsub WHERE Exam_Id=";
		sql += Integer.parseInt(this.examNo);
		sql += ")";
		StuImpl sImpl = new StuImpl();
		subsList = sImpl.findListBySQL(sql);
		TeacImpl tImpl = new TeacImpl();
		examinations = tImpl.findExamById(Integer.parseInt(this.examNo));
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("exam", examinations);
		return SUCCESS;
	}

	/*
	 * 个人提交的用于编译运行的代码文件路径为：E:/CODES/stuNo(.c/.cpp/.java) 每次提交新的代码会覆盖
	 * 个人所有代码文件在后台的保存路径名构成:E:/BACKUP/stuNo/subNo_lang(.c/.cpp/.java)
	 * 同一个题目只记录最后提交的代码(当该题已完全正确时，若提交的代码有错误则不替换；否则替换)
	 */
	/**
	 * <font face="华文楷体" color="red">创建编译文件</font>
	 * 
	 * @return int [1:创建成功;0:创建失败]
	 */
	public int createFile() {
		System.out.println("run codes for creating file...");
		AdmImpl aImpl = new AdmImpl();
		List<Lang> list = aImpl.findAllLangs();
		HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
		for (int i = 0; i < list.size(); i++) {
			hashMap.put(list.get(i).getLangId(), list.get(i).getLname());
		}

		String par = Constant.CODE_CMP; // 待编译的代码根目录
		System.out.println(par);
		File dirFile = new File(par);
		
		try {
			if (!dirFile.exists()) {
				if (!dirFile.mkdir()) {
					System.out.println("Fail to create Root of Dir!");
					return 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}

		String stufile = Constant.CODE_CMP + "/" + this.stuNo; // 为每个用户创建一个文件夹
		File stuFile = new File(stufile);
		try {
			if (!stuFile.exists()) {
				if (!stuFile.mkdir()) {
					System.out.println("Fail to create user of Dir!");
					return 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}

		String pfile = "/" + this.subNo; // 提交的代码文件
		String name = hashMap.get(Integer.parseInt(lgid));
		if (name.equals("C"))
			pfile += "_C.c";
		else if (name.equals("C++"))
			pfile += "_C++.cpp";
		else {
			pfile = "/";
			pfile += "Main" + "_" + this.subNo + ".java";
		}

		String path = stufile + pfile; // 代码文件的绝对路径
		File file = new File(path);
		try {
			if (!file.exists()) {
				if (!file.createNewFile()) {
					System.out.println("Fail to save file!");
					return 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}

		try {
			FileWriter writer = new FileWriter(file);
			writer.write(this.code);
			writer.close();
			this.cppath = path; // 文件创建、写入成功，确定该编译文件的路径，便于编译器调用
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
		return 1;
	}

	/**
	 * <font face="华文楷体" color="red">准备创建待评测代码文件部分</font>
	 * 
	 * @return int [1:床架成功;0:创建失败]
	 */
	protected int Prepare() {
		System.out.println("Waiting for creating file...");
		int flag = createFile();
		if (flag == 1) {
			System.out.println("Success to create file!");
			return 1;
		} else {
			System.out.println("Fail to create file!");
			return 0;
		}
	}

	/**
	 * <font face="华文楷体" color="red">插入编译运行队列部分</font>
	 * 
	 * @return int [1:加入队列成功;0:加入队列失败]
	 */
	protected int InQue() {
		if (Prepare() == 1) {
			System.out.println("Task adding to Queue!");
			// 插入评判任务队列
			PtpTask.addTask(this.cppath, this.lgid, this.subNo, this.stuNo);
			return 1;
		} else
			return 0;
	}

	/**
	 * <font face="华文楷体" color="red">代码评测入口</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String runCode() {
		System.out.println("Uploading Codes,Waiting For Compiling...");
		int flag = InQue();
		if (flag == 1) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">返回最近一次的提交结果</font>
	 * 
	 * @return SUCCESS
	 */
	public String getLastBack() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("stu");
		if (student == null) {
			// 未登录查看只显示最新10名提交情况
			String sql_1 = "SELECT exinfor.Sub_Id,subjects.Title,LName,Test_Time,";
			sql_1 += "Stu_No,SUM(exinfor.Get_Score) AS Get,SUM(testsets.Score) AS Total FROM exinfor";
			sql_1 += " LEFT OUTER JOIN subjects ON exinfor.Sub_id = subjects.Sub_Id";
			sql_1 += " LEFT OUTER JOIN lang ON exinfor.Lang_Id = lang.Lang_Id";
			sql_1 += " LEFT OUTER JOIN testsets ON exinfor.Test_Id = testsets.Test_Id";
			sql_1 += " WHERE Test_Time IN ";
			sql_1 += " ( SELECT DISTINCT(Test_Time) FROM exinfor ORDER BY Test_Time DESC)";
			sql_1 += " GROUP BY Test_Time ORDER BY Test_Time DESC LIMIT 0,9";
			StuImpl stuImpl = new StuImpl();
			result = stuImpl.findBySql(sql_1);
		} else {
			String sql_1 = "SELECT exinfor.Sub_Id,subjects.Title,LName,Test_Time,";
			sql_1 += "Stu_No,SUM(exinfor.Get_Score),SUM(testsets.Score) FROM exinfor";
			sql_1 += " LEFT OUTER JOIN subjects ON exinfor.Sub_id = subjects.Sub_Id";
			sql_1 += " LEFT OUTER JOIN lang ON exinfor.Lang_Id = lang.Lang_Id";
			sql_1 += " LEFT OUTER JOIN testsets ON exinfor.Test_Id = testsets.Test_Id";
			sql_1 += " WHERE Test_Time = ";
			sql_1 += " ( SELECT Max(Test_Time) FROM exinfor WHERE Stu_No =";
			sql_1 += student.getStuNo();
			sql_1 += " )";

			String sql_2 = "SELECT testsets.Score,Pass,exinfor.Get_Score";
			sql_2 += " FROM exinfor";
			sql_2 += " LEFT OUTER JOIN testsets ON exinfor.Test_Id = testsets.Test_Id";
			sql_2 += " WHERE  Test_Time =";
			sql_2 += " ( SELECT Max(Test_Time) FROM exinfor";
			sql_2 += " WHERE Stu_No =";
			sql_2 += student.getStuNo();
			sql_2 += " )";

			StuImpl stuImpl = new StuImpl();
			result = stuImpl.findBySql(sql_1);
			inforList = stuImpl.findBySql(sql_2);
		}
		return SUCCESS;
	}
}
