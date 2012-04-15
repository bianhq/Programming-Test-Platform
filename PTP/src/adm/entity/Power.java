package adm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Power entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "power", catalog = "db_ptp")
public class Power implements java.io.Serializable {

	// Fields

	private String prior;
	private String pname;

	// Constructors

	/** default constructor */
	public Power() {
	}

	/** minimal constructor */
	public Power(String prior) {
		this.prior = prior;
	}

	/** full constructor */
	public Power(String prior, String pname) {
		this.prior = prior;
		this.pname = pname;
	}

	// Property accessors
	@Id
	@Column(name = "Prior", unique = true, nullable = false, length = 2)
	public String getPrior() {
		return this.prior;
	}

	public void setPrior(String prior) {
		this.prior = prior;
	}

	@Column(name = "PName", length = 20)
	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

}