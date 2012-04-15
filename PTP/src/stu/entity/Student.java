package stu.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student", catalog = "db_ptp")
public class Student implements java.io.Serializable {

	// Fields

	private String stuNo;
	private String uname;
	private String pwd;
	private String rname;
	private String sex;
	private Integer grade;
	private String major;
	private String prior;
	private String motto;
	private Date lastLogOn;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String stuNo, String uname, String pwd, String rname,
			String sex, Integer grade, String major, String prior) {
		this.stuNo = stuNo;
		this.uname = uname;
		this.pwd = pwd;
		this.rname = rname;
		this.sex = sex;
		this.grade = grade;
		this.major = major;
		this.prior = prior;
	}

	/** full constructor */
	public Student(String stuNo, String uname, String pwd, String rname,
			String sex, Integer grade, String major, String prior,
			String motto, Date lastLogOn) {
		this.stuNo = stuNo;
		this.uname = uname;
		this.pwd = pwd;
		this.rname = rname;
		this.sex = sex;
		this.grade = grade;
		this.major = major;
		this.prior = prior;
		this.motto = motto;
		this.lastLogOn = lastLogOn;
	}

	// Property accessors
	@Id
	@Column(name = "Stu_No", unique = true, nullable = false, length = 40)
	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	@Column(name = "UName", nullable = false, length = 20)
	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Column(name = "Pwd", nullable = false, length = 20)
	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "RName", nullable = false, length = 20)
	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Column(name = "Sex", nullable = false, length = 1)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "Grade", nullable = false)
	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	@Column(name = "Major", nullable = false, length = 20)
	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Column(name = "Prior", nullable = false, length = 2)
	public String getPrior() {
		return this.prior;
	}

	public void setPrior(String prior) {
		this.prior = prior;
	}

	@Column(name = "Motto", length = 45)
	public String getMotto() {
		return this.motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	@Column(name = "LastLogOn", length = 19)
	public Date getLastLogOn() {
		return this.lastLogOn;
	}

	public void setLastLogOn(Date lastLogOn) {
		this.lastLogOn = lastLogOn;
	}

}