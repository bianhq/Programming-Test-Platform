package stu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Excises entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "excises", catalog = "db_ptp")
public class Excises implements java.io.Serializable {

	// Fields

	private Integer exId;
	private String pass;
	private Integer sbts;
	private Integer subId;
	private String stuNo;
	private Integer langId;

	// Constructors

	/** default constructor */
	public Excises() {
	}

	/** full constructor */
	public Excises(String pass, Integer sbts, Integer subId, String stuNo,
			Integer langId) {
		this.pass = pass;
		this.sbts = sbts;
		this.subId = subId;
		this.stuNo = stuNo;
		this.langId = langId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Ex_Id", unique = true, nullable = false)
	public Integer getExId() {
		return this.exId;
	}

	public void setExId(Integer exId) {
		this.exId = exId;
	}

	@Column(name = "Pass", nullable = false, length = 1)
	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Column(name = "Sbts", nullable = false)
	public Integer getSbts() {
		return this.sbts;
	}

	public void setSbts(Integer sbts) {
		this.sbts = sbts;
	}

	@Column(name = "Sub_Id", nullable = false)
	public Integer getSubId() {
		return this.subId;
	}

	public void setSubId(Integer subId) {
		this.subId = subId;
	}

	@Column(name = "Stu_No", nullable = false, length = 20)
	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	@Column(name = "Lang_Id", nullable = false)
	public Integer getLangId() {
		return this.langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

}