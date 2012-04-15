package teac.dao;

import java.util.List;

import adm.entity.Teacher;

import teac.entity.Course;
import teac.entity.Examinations;
import teac.entity.Examsub;
import teac.entity.Subjects;
import teac.entity.Testsets;

import common.hiber.BaseHibernateImpl;

/**
 * <font face="华文楷体" color="red">教师模块数据库操作类</font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/25
 * 
 */
public class TeacImpl extends BaseHibernateImpl {
	private BaseHibernateImpl bImpl = new BaseHibernateImpl();

	/**
	 * <font face="华文楷体" color="red">根据Id 查找教师Teacher对象</font>
	 * 
	 * @param Integer
	 * @return Teacher
	 */
	public Teacher findTeacherById(Integer id) {
		Class<? extends Teacher> objClass = Teacher.class;
		return (Teacher) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">根据实例查找教师Teacher对象</font>
	 * 
	 * @param Teacher
	 * @return List< Teacher >
	 */
	@SuppressWarnings("unchecked")
	public List<Teacher> findTeacherByExample(Teacher teacher) {
		Class<? extends Teacher> objClass = Teacher.class;
		return (List<Teacher>) bImpl.findByExample(objClass, teacher);
	}

	/**
	 * <font face="华文楷体" color="red"> 查找全部教师Teacher对象</font>
	 * 
	 * @return List< Teacher >
	 */
	@SuppressWarnings("unchecked")
	public List<Teacher> findAllTeachers() {
		String tabel = "Teacher";
		return (List<Teacher>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">更新教师Teacher对象</font>
	 * 
	 * @param Teacher
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Teacher teacher) {
		return bImpl.update(Teacher.class, teacher);
	}

	/**
	 * <font face="华文楷体" color="red">新增课程Course对象</font>
	 * 
	 * @param Course
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean addCourse(Course course) {
		Class<? extends Course> objClass = Course.class;
		return bImpl.insert(objClass, course);
	}

	/**
	 * <font face="华文楷体" color="red"> 更新课程Course对象</font>
	 * 
	 * @param Course
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Course course) {
		return bImpl.update(Course.class, course);
	}

	/**
	 * <font face="华文楷体" color="red">删除课程Course对象</font>
	 * 
	 * @param Course
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean delCourse(Course course) {
		Class<? extends Course> objClass = Course.class;
		return bImpl.delete(objClass, course);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找课程Course对象</font>
	 * 
	 * @param Integer
	 * @return Course
	 */
	public Course findCourseById(Integer id) {
		Class<? extends Course> objClass = Course.class;
		return (Course) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">根据实例查找课程Course对象</font>
	 * 
	 * @param Course
	 * @return List< Course >
	 */
	@SuppressWarnings("unchecked")
	public List<Course> findCourseByExample(Course course) {
		Class<? extends Course> objClass = Course.class;
		return (List<Course>) bImpl.findByExample(objClass, course);
	}

	/**
	 * <font face="华文楷体" color="red">根据实例查找所有课程Course对象</font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	public List<Object[]> findAllCourse(String sql) {
		return bImpl.findBySql(sql);
	}

	/**
	 * <font face="华文楷体" color="red">新增题目Subjects对象</font>
	 * 
	 * @param Subjects
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean addSubject(Subjects subject) {
		Class<? extends Subjects> objClass = Subjects.class;
		return bImpl.insert(objClass, subject);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找对象</font>
	 * 
	 * @param Integer
	 * @return Subject
	 */
	public Subjects findSubjectById(Integer id) {
		Class<? extends Subjects> objClass = Subjects.class;
		return (Subjects) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red"> 查询所有题目</font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	public List<Object[]> findAllSubjects(String sql) {
		return bImpl.findBySql(sql);
	}

	/**
	 * <font face="华文楷体" color="red">更新题目Subjects对象</font>
	 * 
	 * @param Subjects
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Subjects subject) {
		return bImpl.update(Subjects.class, subject);
	}

	/**
	 * <font face="华文楷体" color="red"> 删除题目Subjects对象</font>
	 * 
	 * @param Subjects
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean delSubject(Subjects subject) {
		Class<? extends Subjects> objClass = Subjects.class;
		return bImpl.delete(objClass, subject);
	}

	/**
	 * <font face="华文楷体" color="red">根据SQl查询所有考试</font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	public List<Object[]> findAllExams(String sql) {
		return bImpl.findBySql(sql);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找考试Examination对象</font>
	 * 
	 * @param Integer
	 * @return Examinations
	 */
	public Examinations findExamById(Integer id) {
		Class<? extends Examinations> objClass = Examinations.class;
		return (Examinations) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">新增考试Examination</font>
	 * 
	 * @param Examination
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean addExam(Examinations exam) {
		Class<? extends Examinations> objClass = Examinations.class;
		return bImpl.insert(objClass, exam);
	}

	/**
	 * <font face="华文楷体" color="red">更新考试Examination对象</font>
	 * 
	 * @param Examinations
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Examinations exam) {
		return bImpl.update(Examinations.class, exam);
	}

	/**
	 * <font face="华文楷体" color="red">删除考试Examination对象</font>
	 * 
	 * @param Examinations
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean delExam(Examinations exam) {
		Class<? extends Examinations> objClass = Examinations.class;
		return bImpl.delete(objClass, exam);
	}

	/**
	 * <font face="华文楷体" color="red"> 为考试绑定题目</font>
	 * 
	 * @param Examsub
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean bindSbj(Examsub examsub) {
		Class<? extends Examsub> objClass = Examsub.class;
		return bImpl.insert(objClass, examsub);
	}

	/**
	 * <font face="华文楷体" color="red"> 新增测试数据</font>
	 * 
	 * @param Testsets
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean addTestData(Testsets data) {
		Class<? extends Testsets> objClass = Testsets.class;
		return bImpl.insert(objClass, data);
	}

	/**
	 * <font face="华文楷体" color="red">根据SQL更新对象</font>
	 * 
	 * @param String
	 * @return int [受影响的记录条数]
	 */
	public int update(String sql) {
		return bImpl.IUD(sql);
	}
}
