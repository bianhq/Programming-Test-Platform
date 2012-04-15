package common.hiber;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import common.HibernateSessionFactory;

/**
 * Data access object (DAO) for domain model<br>
 * <font face="华文楷体" color="red"> Hibernate之数据库操作基础类 </font>
 * 
 * @author shawzt
 * @version 2.0
 * @build 2012/3/24
 */
public class BaseHibernateImpl {

	private Session session = null;
	private Transaction tran = null;

	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	/**
	 * <font face="华文楷体" color="red"> 通过SQL查找 </font>
	 * 
	 * @param String
	 * @return List< Object[] >
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findBySql(String sql) {
		List<Object[]> list = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			list = session.createSQLQuery(sql).list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * <font face="华文楷体" color="red"> 通过SQL新增、修改、删除 </font>
	 * 
	 * @param String
	 * @return int [受影响的记录条数]
	 */
	public int IUD(String sql) {
		int result = 0;
		try {
			session = getSession();
			tran = session.beginTransaction();
			result = session.createSQLQuery(sql).executeUpdate();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**
	 * <font face="华文楷体" color="red"> 根据Id查找 </font>
	 * 
	 * @param Class< ? > 、Integer
	 * @return Object
	 */
	public Object findById(Class<?> objClass, Integer id) {
		Object instance = new Object();
		try {
			session = getSession();
			tran = session.beginTransaction();
			instance = objClass.cast(session.get(objClass, id));
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return instance;
	}
	/**
	 * <font face="华文楷体" color="red"> 根据Object查找 </font>
	 * 
	 * @param Class< ? > 、Object
	 * @return List< ? >
	 */
	public List<?> findByExample(Class<?> objClass, Object instance) {
		List<?> results = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			results = session.createCriteria(objClass)
					.add(create(objClass.cast(instance))).list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return results;
	}

	/**
	 * <font face="华文楷体" color="red"> 根据Object保存 </font>
	 * 
	 * @param Class< ? > 、Object
	 * @return boolean [true:新增成功；false:新增失败]
	 */
	public boolean insert(Class<?> objClass, Object object) {
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.save(objClass.cast(object));
			tran.commit();
			return true;
		} catch (HibernateException e) {
			tran.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	/**
	 * <font face="华文楷体" color="red"> 根据Object更新 </font>
	 * 
	 * @param Class< ? > 、Object
	 * @return boolean [true:更新成功；false:更新失败]
	 */
	public boolean update(Class<?> objClass, Object object) {
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.update(objClass.cast(object));
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	/**
	 * <font face="华文楷体" color="red"> 根据Object删除 </font>
	 * 
	 * @param Class< ? > 、Object
	 * @return boolean [true:删除成功；false:删除失败]
	 */
	public boolean delete(Class<?> objClass, Object object) {
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.delete(objClass.cast(object));
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			session.close();
		}
	}
	/**
	 * <font face="华文楷体" color="red"> 根据Table查找所有 </font>
	 * 
	 * @param String
	 * @return List< ? >
	 */
	public List<?> findAll(String tabel) {
		List<?> list = null;
		try {
			String queryString = "from " + tabel;
			session = getSession();
			tran = session.beginTransaction();	
			list = session.createQuery(queryString).list();
			tran.commit();
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
}