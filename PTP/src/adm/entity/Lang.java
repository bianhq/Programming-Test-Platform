package adm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Lang entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "lang", catalog = "db_ptp")
public class Lang implements java.io.Serializable {

	// Fields

	private Integer langId;
	private String lname;

	// Constructors

	/** default constructor */
	public Lang() {
	}

	/** full constructor */
	public Lang(String lname) {
		this.lname = lname;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Lang_Id", unique = true, nullable = false)
	public Integer getLangId() {
		return this.langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

	@Column(name = "LName", nullable = false, length = 10)
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

}