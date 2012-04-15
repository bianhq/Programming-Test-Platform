package stu.dao;

import java.util.List;

import stu.entity.Excises;
import stu.entity.Exinfor;
import stu.entity.Student;
import stu.entity.Submits;
import teac.entity.Subjects;
import common.hiber.BaseHibernateImpl;

/**
 * <font face="华文楷体" color="red">学生模块数据库操作类</font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/26
 * 
 */
public class StuImpl extends BaseHibernateImpl {
	private BaseHibernateImpl bImpl = new BaseHibernateImpl();

	/**
	 * <font face="华文楷体" color="red">新增学生Student对象</font>
	 * 
	 * @param Student
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean add(Student stu) {
		return bImpl.insert(Student.class, stu);
	}

	/**
	 * <font face="华文楷体" color="red">更新学生Student对象</font>
	 * 
	 * @param Student
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Student stu) {
		return bImpl.update(Student.class, stu);

	}

	/**
	 * <font face="华文楷体" color="red">删除学生Student对象</font>
	 * 
	 * @param Student
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean delete(Student stu) {
		return bImpl.delete(Student.class, stu);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找学生Student对象</font>
	 * 
	 * @param Integer
	 * @return Student
	 */
	public Student findStudentById(Integer id) {
		Class<? extends Student> objClass = Student.class;
		return (Student) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red"> 根据实例查找学生Student对象</font>
	 * 
	 * @param Student
	 * @return List< Student >
	 */
	@SuppressWarnings("unchecked")
	public List<Student> findStudentByExample(Student stu) {
		Class<? extends Student> objClass = stu.getClass();
		return (List<Student>) bImpl.findByExample(objClass, stu);
	}

	/**
	 * <font face="华文楷体" color="red">查找所有学生Student对象</font>
	 * 
	 * @return List< Student >
	 */
	@SuppressWarnings("unchecked")
	public List<Student> findAllStudents() {
		String tabel = "Student";
		return (List<Student>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找题目Subject对象</font>
	 * 
	 * @param Integer
	 * @return Subjects
	 */
	public Subjects findSubById(Integer id) {
		Class<? extends Subjects> objClass = Subjects.class;
		return (Subjects) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">新增练习记录Exinfor对象</font>
	 * 
	 * @param Exinfor
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean add(Exinfor exinfor) {
		return bImpl.insert(Exinfor.class, exinfor);
	}

	/**
	 * <font face="华文楷体" color="red">新增练习Excises对象</font>
	 * 
	 * @param Excises
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean add(Excises excise) {
		return bImpl.insert(Excises.class, excise);
	}

	/**
	 * <font face="华文楷体" color="red">新增提交Submits对象</font>
	 * 
	 * @param Submits
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean add(Submits submit) {
		return bImpl.insert(Submits.class, submit);
	}

	/**
	 * <font face="华文楷体" color="red">根据SQL查找</font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	public List<Object[]> findListBySQL(String sql) {
		return bImpl.findBySql(sql);
	}

	/**
	 * <font face="华文楷体" color="red">根据SQL更新</font>
	 * 
	 * @param String
	 * @return int [受影响的记录条数]
	 */
	public int update(String sql) {
		return bImpl.IUD(sql);
	}

}
