package stu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Submits entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "submits", catalog = "db_ptp")
public class Submits implements java.io.Serializable {

	// Fields

	private Integer sbtId;
	private Integer accepts;
	private Integer sbts;
	private Integer subId;

	// Constructors

	/** default constructor */
	public Submits() {
	}

	/** full constructor */
	public Submits(Integer accepts, Integer sbts, Integer subId) {
		this.accepts = accepts;
		this.sbts = sbts;
		this.subId = subId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Sbt_Id", unique = true, nullable = false)
	public Integer getSbtId() {
		return this.sbtId;
	}

	public void setSbtId(Integer sbtId) {
		this.sbtId = sbtId;
	}

	@Column(name = "Accepts", nullable = false)
	public Integer getAccepts() {
		return this.accepts;
	}

	public void setAccepts(Integer accepts) {
		this.accepts = accepts;
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

}