package adm.dao;

import java.util.List;

import adm.entity.Lang;
import adm.entity.Logs;
import adm.entity.News;
import adm.entity.Power;
import adm.entity.Teacher;

import common.hiber.BaseHibernateImpl;

/**
 * <font face="华文楷体" color="red">管理员模块数据库操作类</font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/25
 * 
 */
public class AdmImpl {

	private BaseHibernateImpl bImpl = new BaseHibernateImpl();

	/**
	 * <font face="华文楷体" color="red"> 新增语言Lang对象</font>
	 * 
	 * @return boolean [true:新增成功；false:新增失败]
	 */
	public boolean add(Lang lang) {
		Class<? extends Lang> objClass = Lang.class;
		return bImpl.insert(objClass, lang);
	}

	/**
	 * <font face="华文楷体" color="red">更新语言Lang对象</font>
	 * 
	 * @return boolean  [true:更新成功；false:更新失败]
	 */
	public boolean update(Lang lang) {
		return bImpl.update(Lang.class, lang);
	}

	/**
	 * <font face="华文楷体" color="red">删除语言Lang对象</font>
	 * 
	 * @return boolean [true:删除成功；false:删除失败]
	 */
	public boolean delete(Lang lang) {
		return bImpl.delete(Lang.class, lang);
	}

	/**
	 * <font face="华文楷体" color="red">查找全部语言Lang对象</font>
	 * 
	 * @return List< Lang >
	 */
	@SuppressWarnings("unchecked")
	public List<Lang> findAllLangs() {
		String tabel = "Lang";
		return (List<Lang>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">新增权限Power对象</font>
	 * 
	 * @return boolean  [true:新增成功；false:新增失败]
	 */
	public boolean add(Power power) {
		Class<? extends Power> objClass = Power.class;
		return bImpl.insert(objClass, power);
	}

	/**
	 * <font face="华文楷体" color="red">更新权限Power对象</font>
	 * 
	 * @return boolean  [true:更新成功；false:更新失败]
	 */
	public boolean update(Power power) {
		return bImpl.update(Power.class, power);
	}

	/**
	 * <font face="华文楷体" color="red">删除权限Power对象</font>
	 * 
	 * @return boolean  [true:删除成功；false:删除失败]
	 */
	public boolean delete(Power power) {
		return bImpl.delete(Power.class, power);
	}

	/**
	 * <font face="华文楷体" color="red">查找全部权限Power对象</font>
	 * 
	 * @return List< Power >
	 */
	@SuppressWarnings("unchecked")
	public List<Power> findAllPowers() {
		String tabel = "Power";
		return (List<Power>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">新增教师Teacher对象</font>
	 * 
	 * @return boolean [true:新增成功；false:新增失败]
	 */
	public boolean add(Teacher teacher) {
		Class<? extends Teacher> objClass = Teacher.class;
		return bImpl.insert(objClass, teacher);
	}

	/**
	 * <font face="华文楷体" color="red">更新教师Teacher对象</font>
	 * 
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Teacher teacher) {
		return bImpl.update(Teacher.class, teacher);
	}

	/**
	 * <font face="华文楷体" color="red">删除教师Teacher对象</font>
	 * 
	 * @return boolean [true:删除成功；false:删除失败]
	 */
	public boolean delete(Teacher teacher) {
		return bImpl.delete(Teacher.class, teacher);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找教师Teacher对象</font>
	 * 
	 * @return Teacher
	 */
	public Teacher findTeacherById(Integer id) {
		Class<? extends Teacher> objClass = Teacher.class;
		return (Teacher) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">根据实例查找教师Teacher对象</font>
	 * 
	 * @return List< Teacher >
	 */
	@SuppressWarnings("unchecked")
	public List<Teacher> findTeacherByExample(Teacher teacher) {
		Class<? extends Teacher> objClass = teacher.getClass();
		return (List<Teacher>) bImpl.findByExample(objClass, teacher);
	}

	/**
	 *<font face="华文楷体" color="red"> 查找全部教师Teacher对象</font>
	 * 
	 * @return List< Teacher >
	 */
	@SuppressWarnings("unchecked")
	public List<Teacher> findAllTeac() {
		String tabel = "Teacher";
		return (List<Teacher>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">查找全部日志Logs对象</font>
	 * 
	 * @return List< Logs >
	 */
	@SuppressWarnings("unchecked")
	public List<Logs> findAllLogs() {
		String tabel = "Logs";
		return (List<Logs>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">查找全部消息News对象</font>
	 * 
	 * @return List< News >
	 */
	@SuppressWarnings("unchecked")
	public List<News> findAllNews() {
		String tabel = "News";
		return (List<News>) bImpl.findAll(tabel);
	}

	/**
	 * <font face="华文楷体" color="red">根据Id 查找消息News对象</font>
	 * 
	 * @return News
	 */
	public News findNewById(Integer id) {
		Class<? extends News> objClass = News.class;
		return (News) bImpl.findById(objClass, id);
	}

	/**
	 * <font face="华文楷体" color="red">新增消息News对象</font>
	 * 
	 * @return boolean [true:新增成功；false:新增失败]
	 */
	public boolean add(News news) {
		Class<? extends News> objClass = News.class;
		return bImpl.insert(objClass, news);
	}

	/**
	 * <font face="华文楷体" color="red">更新消息News对象</font>
	 * 
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(News news) {
		return bImpl.update(News.class, news);
	}

	/**
	 * <font face="华文楷体" color="red">删除消息News对象</font>
	 * 
	 * @return boolean [true:删除成功；false:删除失败]
	 */
	public boolean delete(News news) {
		return bImpl.delete(News.class, news);
	}
	/**
	 * <font face="华文楷体" color="red">根据SQL执行</font>
	 * 
	 * @return List< Object[] >
	 */
	public List<Object[]> findNewsBySql(String sql){
		return bImpl.findBySql(sql);
	}
}
