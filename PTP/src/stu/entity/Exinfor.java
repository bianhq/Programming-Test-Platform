package stu.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Exinfor entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "exinfor", catalog = "db_ptp")
public class Exinfor implements java.io.Serializable {

	// Fields

	private Integer inforId;
	private Integer testId;
	private String pass;
	private Integer getScore;
	private String stuNo;
	private Integer subId;
	private Integer langId;
	private Date testTime;

	// Constructors

	/** default constructor */
	public Exinfor() {
	}

	/** full constructor */
	public Exinfor(Integer testId, String pass, Integer getScore, String stuNo,
			Integer subId, Integer langId, Date testTime) {
		this.testId = testId;
		this.pass = pass;
		this.getScore = getScore;
		this.stuNo = stuNo;
		this.subId = subId;
		this.langId = langId;
		this.testTime = testTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Infor_Id", unique = true, nullable = false)
	public Integer getInforId() {
		return this.inforId;
	}

	public void setInforId(Integer inforId) {
		this.inforId = inforId;
	}

	@Column(name = "Test_Id", nullable = false)
	public Integer getTestId() {
		return this.testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	@Column(name = "Pass", nullable = false, length = 1)
	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Column(name = "Get_Score", nullable = false)
	public Integer getGetScore() {
		return this.getScore;
	}

	public void setGetScore(Integer getScore) {
		this.getScore = getScore;
	}

	@Column(name = "Stu_No", nullable = false, length = 20)
	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	@Column(name = "Sub_Id", nullable = false)
	public Integer getSubId() {
		return this.subId;
	}

	public void setSubId(Integer subId) {
		this.subId = subId;
	}

	@Column(name = "Lang_Id", nullable = false)
	public Integer getLangId() {
		return this.langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

	@Column(name = "Test_Time", nullable = false, length = 19)
	public Date getTestTime() {
		return this.testTime;
	}

	public void setTestTime(Date testTime) {
		this.testTime = testTime;
	}

}