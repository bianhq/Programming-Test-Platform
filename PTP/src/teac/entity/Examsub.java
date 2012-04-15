package teac.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Examsub entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="examsub"
    ,catalog="db_ptp"
)

public class Examsub  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer examId;
     private Integer subId;


    // Constructors

    /** default constructor */
    public Examsub() {
    }

    
    /** full constructor */
    public Examsub(Integer examId, Integer subId) {
        this.examId = examId;
        this.subId = subId;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="Id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="Exam_Id", nullable=false)

    public Integer getExamId() {
        return this.examId;
    }
    
    public void setExamId(Integer examId) {
        this.examId = examId;
    }
    
    @Column(name="Sub_Id", nullable=false)

    public Integer getSubId() {
        return this.subId;
    }
    
    public void setSubId(Integer subId) {
        this.subId = subId;
    }
   








}