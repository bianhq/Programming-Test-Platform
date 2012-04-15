package stu.action;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import adm.dao.AdmImpl;
import adm.entity.Teacher;

import stu.dao.StuImpl;
import stu.entity.Student;
import teac.dao.TeacImpl;

/**
 * <font face="华文楷体" color="red">用户注册\登录\退出处理类</font>
 * 
 * @author shawzt
 * @version 1.5
 * @build 2012/3/12
 */
public class StuAction extends ActionSupport {
	/*
	 * 以下字段名称对应业务处理代码在该action中的相关Jsp页面中name一致的控件 
	 * get()方法:获取Jsp页面name一致的控件值
	 * set()方法:设置Jsp页面name一致的控件显示内容
	 */
	private String uname;
	private String upwd;
	private String stuNo;
	private String rname;
	private String sex;
	private String grade;
	private String major;
	private String motto;
	private String cate; // 用于判别登录级别
	private String time; // 登录时间 安全控制

	public void setUname(String uname) {
		this.uname = uname;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/*
	 * 以下List<>对应业务处理代码在该action中的相关Jsp页面中<s:iterator>的需要的数据
	 * get()方法:设置Jsp页面name一致的控件显示内容
	 */
	private List<Object[]> newsList;

	public List<Object[]> getNewsList() {
		return newsList;
	}

	/*
	 * 以下为业务逻辑处理代码
	 */
	/**
	 * <font face="华文楷体" color="red">显示所有消息</font>
	 * 
	 * @return SUCCESS
	 */
	public String showNews() {
		AdmImpl aImpl = new AdmImpl();
		String sql = "SELECT * FROM news ORDER BY Public_Time DESC";
		this.newsList = aImpl.findNewsBySql(sql);
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">用户登录控制<br>
	 * 机制 [为防止用户退出后再点击浏览器返回按钮而导致信息回显，<br>
	 * 使用数据库记录的退出时间与前台发送的时间比较进行判断。<br>
	 * 当发送的时间大于数据库记录时间，则为有效登录；<br>
	 * 否则为非法操作!]</font>
	 * 
	 * @return result
	 *         [success_adm:管理员登录;success_teac:教师登录;success_stu:学生登录;ERROR]
	 */
	public String Login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Date date = new Date(Long.parseLong(this.time));
		int prior = Integer.parseInt(this.cate);
		String result = "";

		switch (prior) {
		// 因为管理员和教师存于同一张表Teacher中，所以此处处理代码合并
		case 1:
		case 2: {
			Teacher teac = new Teacher();
			teac.setRegName(this.uname);
			teac.setPwd(this.upwd);
			TeacImpl teacImpl = new TeacImpl();
			List<Teacher> teachers = teacImpl.findTeacherByExample(teac);
			if (teachers.size() == 1) {
				System.out.println("Find User!");
				if (prior == 1) {
					/*
					 * 数据库记录的最后登录时间比当前时间早 符合逻辑
					 */
					if (teachers.get(0).getLastLogOn().before(date)) {
						System.out.println("Success To Log on!");
						result = "success_adm";
						session.setAttribute("adm", teachers.get(0));
					} else { // 点击浏览器返回按钮时 非法操作
						result = "success_adm";
						session.setAttribute("fail", "session ended");
					}
				} else if (prior == 2) {
					if (teachers.get(0).getLastLogOn().before(date)) {
						System.out.println("Success To Log on!");
						session.setAttribute("teac", teachers.get(0));
						result = "success_teac";
					} else { // 点击浏览器返回按钮时 判断
						result = "success_teac";
						session.setAttribute("fail", "session ended");
					}
				}
			} else {
				System.out.println("No User,Fail To Log on!");
				result = ERROR;
			}
			break;
		}
		case 3: {
			Student stu = new Student();
			stu.setUname(this.uname);
			stu.setPwd(this.upwd);
			StuImpl stuImpl = new StuImpl();
			List<Student> stus = stuImpl.findStudentByExample(stu);
			if (stus.size() == 1) {
				System.out.println("Find User");
				if (stus.get(0).getLastLogOn().before(date)) {
					System.out.println("Success To Log on!");
					result = "success_stu";
					session.setAttribute("stu", stus.get(0));
				} else {
					result = "success_stu";
					session.setAttribute("fail", "session ended");
				}
			} else {
				System.out.println("No User,Fail To Log on!");
				result = ERROR;
			}
			break;
		}
		}
		return result;
	}

	/**
	 * <font face="华文楷体" color="red">学生用户注册<br>
	 * [注:学生用户需要页面注册，教师账号则由管理员分配.] </font>
	 * 
	 * @return
	 */
	public String Register() {
		StuImpl stuImpl = new StuImpl();

		Student tester = new Student();
		tester.setUname(this.uname);

		Student stu = new Student();
		stu.setUname(this.uname);
		stu.setPwd(this.upwd);
		stu.setStuNo(this.stuNo);
		stu.setRname(this.rname);
		stu.setSex(this.sex);
		stu.setGrade(Integer.parseInt(this.grade));
		stu.setMajor(this.major);
		stu.setLastLogOn(new Date(System.currentTimeMillis()));
		stu.setMotto(this.motto);
		stu.setPrior("C"); // 注册用户权限为学生,前台不提供权限选择项，由代码设定!

		if (stuImpl.findStudentByExample(tester).size() <= 0) { // 检测用户名是否唯一
			// 无重复用户名
			boolean flag = stuImpl.add(stu);
			if (flag == true) {
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("register", "success");
				return "success";
			} else {
				return "error";
			}
		} else {
			return "error";
		}
	}

	/**
	 * <font face="华文楷体" color="red">学生用户退出系统</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String Logout() {
		Date date = new Date(System.currentTimeMillis());
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("stu");
		student.setLastLogOn(date);
		StuImpl sImpl = new StuImpl();
		boolean flag = sImpl.update(student);
		if (flag == true)
			return SUCCESS;
		else
			return ERROR;
	}
}
