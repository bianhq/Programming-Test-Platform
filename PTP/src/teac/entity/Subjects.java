package teac.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Subjects entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "subjects", catalog = "db_ptp")
public class Subjects implements java.io.Serializable {

	// Fields

	private Integer subId;
	private String title;
	private String description;
	private String input;
	private String output;
	private String sampleInput;
	private String sampleOutput;
	private String category;
	private String visible;
	private Integer teacherId;

	// Constructors

	/** default constructor */
	public Subjects() {
	}

	/** full constructor */
	public Subjects(String title, String description, String input,
			String output, String sampleInput, String sampleOutput,
			String category, String visible, Integer teacherId) {
		this.title = title;
		this.description = description;
		this.input = input;
		this.output = output;
		this.sampleInput = sampleInput;
		this.sampleOutput = sampleOutput;
		this.category = category;
		this.visible = visible;
		this.teacherId = teacherId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "Sub_Id", unique = true, nullable = false)
	public Integer getSubId() {
		return this.subId;
	}

	public void setSubId(Integer subId) {
		this.subId = subId;
	}

	@Column(name = "Title", nullable = false, length = 65535)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Description", nullable = false, length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Input", nullable = false, length = 65535)
	public String getInput() {
		return this.input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	@Column(name = "Output", nullable = false, length = 65535)
	public String getOutput() {
		return this.output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	@Column(name = "Sample_Input", nullable = false, length = 65535)
	public String getSampleInput() {
		return this.sampleInput;
	}

	public void setSampleInput(String sampleInput) {
		this.sampleInput = sampleInput;
	}

	@Column(name = "Sample_Output", nullable = false, length = 65535)
	public String getSampleOutput() {
		return this.sampleOutput;
	}

	public void setSampleOutput(String sampleOutput) {
		this.sampleOutput = sampleOutput;
	}

	@Column(name = "Category", nullable = false, length = 100)
	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "Visible", nullable = false, length = 1)
	public String getVisible() {
		return this.visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	@Column(name = "Teacher_Id", nullable = false)
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

}