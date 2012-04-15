package common.hiber;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQL5InnoDBDialect;

/**
 * <font face="华文楷体" color="red">扩展Hibernate对MYSQL 一些特殊数据类型的支持</font>
 * @author shawzt
 *
 */
public class MySQLDialect extends MySQL5InnoDBDialect{
	public MySQLDialect(){
		super();
		registerHibernateType(-1,Hibernate.TEXT.getName()); //扩展对Text类型的支持
	}
}
