package adm.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teacher", catalog = "db_ptp")
public class Teacher implements java.io.Serializable {

	// Fields

	private Integer teacherId;
	private String regName;
	private String tname;
	private String pwd;
	private String sex;
	private String prior;
	private Date lastLogOn;

	// Constructors

	/** default constructor */
	public Teacher() {
	}

	/** minimal constructor */
	public Teacher(String regName, String tname, String pwd, String sex,
			String prior) {
		this.regName = regName;
		this.tname = tname;
		this.pwd = pwd;
		this.sex = sex;
		this.prior = prior;
	}

	/** full constructor */
	public Teacher(String regName, String tname, String pwd, String sex,
			String prior, Date lastLogOn) {
		this.regName = regName;
		this.tname = tname;
		this.pwd = pwd;
		this.sex = sex;
		this.prior = prior;
		this.lastLogOn = lastLogOn;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Teacher_Id", unique = true, nullable = false)
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "RegName", nullable = false, length = 20)
	public String getRegName() {
		return this.regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	@Column(name = "TName", nullable = false, length = 20)
	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	@Column(name = "Pwd", nullable = false, length = 20)
	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "Sex", nullable = false, length = 1)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "Prior", nullable = false, length = 2)
	public String getPrior() {
		return this.prior;
	}

	public void setPrior(String prior) {
		this.prior = prior;
	}

	@Column(name = "LastLogOn", length = 19)
	public Date getLastLogOn() {
		return this.lastLogOn;
	}

	public void setLastLogOn(Date lastLogOn) {
		this.lastLogOn = lastLogOn;
	}

}