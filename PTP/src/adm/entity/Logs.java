package adm.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Logs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "logs", catalog = "db_ptp")
public class Logs implements java.io.Serializable {

	// Fields

	private Integer logId;
	private Date logDate;
	private String logInfor;

	// Constructors

	/** default constructor */
	public Logs() {
	}

	/** full constructor */
	public Logs(Integer logId, Date logDate, String logInfor) {
		this.logId = logId;
		this.logDate = logDate;
		this.logInfor = logInfor;
	}

	// Property accessors
	@Id
	@Column(name = "Log_id", unique = true, nullable = false)
	public Integer getLogId() {
		return this.logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	@Column(name = "Log_date", nullable = false, length = 19)
	public Date getLogDate() {
		return this.logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	@Column(name = "Log_infor", nullable = false, length = 100)
	public String getLogInfor() {
		return this.logInfor;
	}

	public void setLogInfor(String logInfor) {
		this.logInfor = logInfor;
	}

}