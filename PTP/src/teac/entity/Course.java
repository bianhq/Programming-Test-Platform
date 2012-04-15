package teac.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Course entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "course", catalog = "db_ptp")
public class Course implements java.io.Serializable {

	// Fields

	private Integer courId;
	private String cname;
	private Integer teacherId;
	private Integer langId;

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** full constructor */
	public Course(Integer courId, String cname, Integer teacherId,
			Integer langId) {
		this.courId = courId;
		this.cname = cname;
		this.teacherId = teacherId;
		this.langId = langId;
	}

	// Property accessors
	@Id
	@Column(name = "Cour_Id", unique = true, nullable = false)
	public Integer getCourId() {
		return this.courId;
	}

	public void setCourId(Integer courId) {
		this.courId = courId;
	}

	@Column(name = "CName", nullable = false, length = 40)
	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Column(name = "Teacher_Id", nullable = false)
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "Lang_Id", nullable = false)
	public Integer getLangId() {
		return this.langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

}