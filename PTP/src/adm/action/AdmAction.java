package adm.action;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import teac.dao.TeacImpl;

import adm.dao.AdmImpl;
import adm.entity.Lang;
import adm.entity.Logs;
import adm.entity.News;
import adm.entity.Power;
import adm.entity.Teacher;

/**
 * <font face="华文楷体" color="red">管理员模块业务处理类</font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/25
 * 
 */
public class AdmAction extends ActionSupport {
	/**
	 * <font face="华文楷体" color="red">日志对象<br>
	 * 对管理员的操作进行日志记录</font>
	 */
	private static Logger logger = Logger.getLogger(AdmAction.class);

	/*
	 * 以下字段名称对应业务处理代码在该action中的相关Jsp页面中name一致的控件 
	 * get()方法:获取Jsp页面name一致的控件值
	 * set()方法:设置Jsp页面name一致的控件显示内容
	 */
	private String prior;
	private String pname;

	private String sex;
	private String tname;
	private String regname;
	private String pwd;

	private String new_sex;
	private String new_tname;
	private String new_regname;
	private String newPwd;

	private String langId;
	private String lname;

	private String newid;
	private String title;
	private String content;
	private String time;

	public void setPrior(String prior) {
		this.prior = prior;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public void setRegname(String regname) {
		this.regname = regname;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setNew_sex(String new_sex) {
		this.new_sex = new_sex;
	}

	public void setNew_tname(String new_tname) {
		this.new_tname = new_tname;
	}

	public void setNew_regname(String new_regname) {
		this.new_regname = new_regname;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public void setLangId(String langId) {
		this.langId = langId;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setNewid(String newid) {
		this.newid = newid;
	}

	public String getNewid() {
		return newid;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getTime() {
		return time;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/*
	 * 以下List<>对应业务处理代码在该action中的相关Jsp页面中<s:iterator>的需要的数据
	 * get()方法:设置Jsp页面name一致的控件显示内容
	 */
	private List<Power> powers;
	private List<Logs> logs;
	private List<Teacher> teachers;
	private List<Lang> langs;
	private List<Object[]> news;

	public List<Power> getPowers() {
		return powers;
	}

	public List<Logs> getLogs() {
		return logs;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public List<Lang> getLangs() {
		return langs;
	}

	public List<Object[]> getNews() {
		return news;
	}

	/*
	 * 以下为业务逻辑处理代码
	 */
	/**
	 * <font face="华文楷体" color="red">显示所有消息</font>
	 * 
	 * @return SUCCESS
	 */
	public String listNews() {
		AdmImpl aImpl = new AdmImpl();
		String sql = "SELECT * FROM news ORDER BY Public_Time DESC";
		this.news = aImpl.findNewsBySql(sql);
		
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">新增消息</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String addNews() {
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = null;
		try {
			date = df.parse(this.time);
			News news = new News();
			news.setBrief(this.title);
			news.setContent(this.content.trim());
			news.setPublicTime(date);
			AdmImpl aImpl = new AdmImpl();
			boolean flag = aImpl.add(news);
			if (flag == true) {
				listNews();
				return SUCCESS;
			} else {
				listNews();
				return ERROR;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			listNews();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">修改消息时的内容回显</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String mdPre() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] pars;
		try {
			/*
			 * 默认为get方式发送请求，采用iso8859-1编码 对于中文需要转换
			 */
			pars = new String(request.getParameter("newid").getBytes(
					"iso8859-1"), "utf-8").split(" ");
			AdmImpl aImpl = new AdmImpl();
			News news = aImpl.findNewById(Integer.parseInt(pars[0]));
			DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			if (news != null) {
				this.newid = news.getNewsId().toString();
				this.title = news.getBrief();
				this.content = news.getContent().trim();
				this.time = df.format(news.getPublicTime());
				return SUCCESS;
			} else
				return ERROR;
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">更新消息</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String mdNews() {
		AdmImpl aImpl = new AdmImpl();
		News news = aImpl.findNewById(Integer.parseInt(this.newid));
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		try {
			news.setBrief(this.title);
			news.setContent(this.content.trim());
			news.setPublicTime(df.parse(this.time));
			aImpl.update(news);
			return listNews();
		} catch (ParseException e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">删除消息</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String delNews() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] pars;
		try {
			/*
			 * 默认为get方式发送请求，采用iso8859-1编码 对于中文需要转换
			 */
			pars = new String(request.getParameter("newid").getBytes(
					"iso8859-1"), "utf-8").split(" ");
			AdmImpl aImpl = new AdmImpl();
			News news = aImpl.findNewById(Integer.parseInt(pars[0]));
			if (news != null) {
				aImpl.delete(news);
				return listNews();
			} else
				return ERROR;
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">显示日志</font>
	 * 
	 * @return SUCCESS
	 */
	public String showLogs() {
		logs = new ArrayList<Logs>();
		AdmImpl aImpl = new AdmImpl();
		logs = aImpl.findAllLogs();
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">新增权限</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String addPower() {
		Power power = new Power();
		power.setPrior(this.prior);
		power.setPname(this.pname);

		AdmImpl aImpl = new AdmImpl();
		boolean flag = aImpl.add(power);
		if (flag == true) {
			logger.fatal("系统管理员新增权限!----->成功");
			return listPower();
		} else {
			logger.fatal("系统管理员新增权限!----->失败");
			listPower();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">更新权限</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String mdPower() {
		Power power = new Power();
		power.setPrior(this.prior);
		power.setPname(this.pname);

		AdmImpl aImpl = new AdmImpl();
		boolean flag = aImpl.update(power);
		if (flag == true) {
			logger.fatal("系统管理员修改权限!----->成功");
			return listPower();
		} else {
			logger.fatal("系统管理员修改权限!----->失败");
			listPower();
			return ERROR;
		}

	}

	/**
	 * <font face="华文楷体" color="red"> 删除权限<br>
	 * {数据库中将会做级联删除，即与此权限相关联的用户也会被永久删除。提醒用户慎用!}</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String delPower() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] pars;
		try {
			/*
			 * 默认为get方式发送请求，采用iso8859-1编码 对于中文需要转换
			 */
			pars = new String(request.getParameter("prior").getBytes(
					"iso8859-1"), "utf-8").split(" ");
			Power power = new Power();
			power.setPrior(pars[0]);
			power.setPname(pars[1]);
			AdmImpl aImpl = new AdmImpl();
			boolean flag = aImpl.delete(power);
			if (flag == true) {
				logger.fatal("系统管理员删除权限!----->成功");
				return listPower();
			} else {
				logger.fatal("系统管理员删除权限!----->失败");
				listPower();
				return ERROR;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">显示所有权限</font>
	 * 
	 * @return SUCCESS
	 */
	public String listPower() {
		powers = new ArrayList<Power>();
		AdmImpl aImpl = new AdmImpl();
		powers = aImpl.findAllPowers();
		return "success";
	}

	/**
	 * <font face="华文楷体" color="red">新增教师账号</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String addTaccount() {
		Teacher teacher = new Teacher();
		teacher.setTname(this.tname);
		teacher.setSex(this.sex);
		teacher.setRegName(this.regname);
		teacher.setPwd(this.pwd);
		teacher.setLastLogOn(new Date(System.currentTimeMillis()));
		teacher.setPrior(this.prior);

		AdmImpl aImpl = new AdmImpl();
		boolean flag = aImpl.add(teacher);
		String result = "";
		if (flag == true) {
			logger.fatal("系统管理员新增教师账号!----->成功");
			aImpl = new AdmImpl();
			return lstTaccount();
		} else {
			logger.fatal("系统管理员新增教师账号!----->失败");
			lstTaccount();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">修改教师账号</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String mdTaccount() {
		// 先要根据旧的基本信息查找Teacher_Id,然后根据Teacher_Id更新
		Teacher teacher = new Teacher();
		teacher.setTname(this.tname);
		teacher.setSex(this.sex);
		teacher.setRegName(this.regname);
		teacher.setPrior(this.prior);

		AdmImpl aImpl = new AdmImpl();
		List<Teacher> ts = aImpl.findTeacherByExample(teacher);
		if (ts.size() == 1) { // 只能有一个值才是查找成功
			teacher = ts.get(0);
			teacher.setTname(this.new_tname);
			teacher.setSex(this.new_sex);
			teacher.setRegName(this.new_regname);
			if (!this.newPwd.equals(""))
				teacher.setPwd(this.newPwd);
			teacher.setPrior(this.prior);

			boolean flag = aImpl.update(teacher);
			if (flag == true) {
				logger.fatal("系统管理员修改教师账号!----->成功");
				aImpl = new AdmImpl();
				return lstTaccount();
			} else {
				logger.fatal("系统管理员修改教师账号!----->失败");
				lstTaccount();
				return ERROR;
			}
		} else {
			System.out.println("查找失败!");
			lstTaccount();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red"> 删除教师账号</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String delTaccount() {
		// 先要根据旧的基本信息查找Teacher_Id,然后根据Teacher_Id删除
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] pars;
		try {
			/*
			 * 默认为get方式发送请求，采用iso8859-1编码 对于中文需要转换
			 */
			pars = new String(request.getParameter("acnt")
					.getBytes("iso8859-1"), "utf-8").split(" ");
			Teacher teacher = new Teacher();
			teacher.setTname(pars[0]);
			teacher.setSex(pars[1]);
			teacher.setRegName(pars[2]);

			AdmImpl aImpl = new AdmImpl();
			List<Teacher> ts = aImpl.findTeacherByExample(teacher);
			if (ts.size() == 1) { // 只能有一个值才是查找成功
				teacher = ts.get(0);
				boolean flag = aImpl.delete(teacher);

				if (flag == true) {
					logger.fatal("系统管理员删除教师账号!----->成功");
					aImpl = new AdmImpl();
					return lstTaccount();
				} else {
					logger.fatal("系统管理员删除教师账号!----->失败");
					lstTaccount();
					return ERROR;
				}
			} else {
				System.out.println("删除失败!");
				lstTaccount();
				return ERROR;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			lstTaccount();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">显示所有教师账号</font>
	 * 
	 * @return SUCCESS
	 */
	public String lstTaccount() {
		teachers = new ArrayList<Teacher>();
		AdmImpl aImpl = new AdmImpl();
		teachers = aImpl.findAllTeac();
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">新增程序设计语言</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String addLang() {
		String result = "";
		Lang lang = new Lang();
		lang.setLname(this.lname);

		AdmImpl aImpl = new AdmImpl();
		boolean flag = aImpl.add(lang);
		if (flag == true) {
			logger.fatal("系统管理员新增程序设计语言!----->成功");
			return listLang();
		} else {
			logger.fatal("系统管理员新增程序设计语言!----->失败");
			listLang();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">修改程序设计语言</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String mdLang() {
		String result = "";

		Lang lang = new Lang();
		lang.setLangId(Integer.parseInt(this.langId));
		lang.setLname(this.lname);

		AdmImpl aImpl = new AdmImpl();
		boolean flag = aImpl.update(lang);
		if (flag == true) {
			logger.fatal("系统管理员修改程序设计语言!----->成功");
			return listLang();
		} else {
			logger.fatal("系统管理员修改程序设计语言!----->失败");
			listLang();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">删除程序设计语言</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String delLang() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] pars;
		try {
			/*
			 * 默认为get方式发送请求，采用iso8859-1编码 对于中文需要转换
			 */
			pars = new String(request.getParameter("lang")
					.getBytes("iso8859-1"), "utf-8").split(" ");
			Lang lang = new Lang();
			lang.setLangId(Integer.parseInt(pars[0]));
			lang.setLname(pars[1]);

			AdmImpl aImpl = new AdmImpl();
			boolean flag = aImpl.delete(lang);
			if (flag == true) {
				logger.fatal("系统管理员删除程序设计语言!----->成功");
				return listLang();
			} else {
				logger.fatal("系统管理员删除程序设计语言!----->失败");
				listLang();
				return ERROR;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			listLang();
			return ERROR;
		}
	}

	/**
	 * <font face="华文楷体" color="red">显示所有程序设计语言</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String listLang() {
		langs = new ArrayList<Lang>();
		AdmImpl aImpl = new AdmImpl();
		langs = aImpl.findAllLangs();
		return SUCCESS;
	}

	/**
	 * <font face="华文楷体" color="red">退出系统</font>
	 * 
	 * @return SUCCESS/ERROR
	 */
	public String Logout() {
		Date date = new Date(System.currentTimeMillis());
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Teacher teacher = (Teacher) session.getAttribute("adm");
		teacher.setLastLogOn(date);
		TeacImpl tImpl = new TeacImpl();
		boolean flag = tImpl.update(teacher);
		if (flag == true)
			return SUCCESS;
		else
			return ERROR;
	}
}
