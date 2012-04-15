package teac.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Testsets entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "testsets", catalog = "db_ptp")
public class Testsets implements java.io.Serializable {

	// Fields

	private Integer testId;
	private String tdata;
	private String result;
	private Integer score;
	private Integer subId;

	// Constructors

	/** default constructor */
	public Testsets() {
	}

	/** minimal constructor */
	public Testsets(String result, Integer score, Integer subId) {
		this.result = result;
		this.score = score;
		this.subId = subId;
	}

	/** full constructor */
	public Testsets(String tdata, String result, Integer score, Integer subId) {
		this.tdata = tdata;
		this.result = result;
		this.score = score;
		this.subId = subId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Test_Id", unique = true, nullable = false)
	public Integer getTestId() {
		return this.testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	@Column(name = "TData", length = 65535)
	public String getTdata() {
		return this.tdata;
	}

	public void setTdata(String tdata) {
		this.tdata = tdata;
	}

	@Column(name = "Result", nullable = false, length = 65535)
	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Column(name = "Score", nullable = false)
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "Sub_Id", nullable = false)
	public Integer getSubId() {
		return this.subId;
	}

	public void setSubId(Integer subId) {
		this.subId = subId;
	}

}