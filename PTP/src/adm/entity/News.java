package adm.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "news", catalog = "db_ptp")
public class News implements java.io.Serializable {

	// Fields

	private Integer newsId;
	private String brief;
	private String content;
	private Date publicTime;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(String brief, String content, Date publicTime) {
		this.brief = brief;
		this.content = content;
		this.publicTime = publicTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "News_Id", unique = true, nullable = false)
	public Integer getNewsId() {
		return this.newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	@Column(name = "Brief", nullable = false, length = 45)
	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	@Column(name = "Content", nullable = false, length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "Public_Time", nullable = false, length = 19)
	public Date getPublicTime() {
		return this.publicTime;
	}

	public void setPublicTime(Date publicTime) {
		this.publicTime = publicTime;
	}

}