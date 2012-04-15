package teac.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Examinations entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "examinations", catalog = "db_ptp")
public class Examinations implements java.io.Serializable {

	// Fields

	private Integer examId;
	private String examName;
	private String cate;
	private Date startTime;
	private Date endTime;
	private Integer last;
	private String pass;
	private Integer teacherId;

	// Constructors

	/** default constructor */
	public Examinations() {
	}

	/** full constructor */
	public Examinations(String examName, String cate, Date startTime,
			Date endTime, Integer last, String pass, Integer teacherId) {
		this.examName = examName;
		this.cate = cate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.last = last;
		this.pass = pass;
		this.teacherId = teacherId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Exam_Id", unique = true, nullable = false)
	public Integer getExamId() {
		return this.examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	@Column(name = "Exam_Name", nullable = false, length = 20)
	public String getExamName() {
		return this.examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	@Column(name = "Cate", nullable = false, length = 20)
	public String getCate() {
		return this.cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	@Column(name = "Start_Time", nullable = false, length = 19)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Column(name = "End_Time", nullable = false, length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "Last", nullable = false)
	public Integer getLast() {
		return this.last;
	}

	public void setLast(Integer last) {
		this.last = last;
	}

	@Column(name = "Pass", nullable = false, length = 20)
	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Column(name = "Teacher_Id", nullable = false)
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

}