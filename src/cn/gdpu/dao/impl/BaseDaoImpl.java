package cn.gdpu.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import cn.gdpu.dao.BaseDao;


@SuppressWarnings("unchecked")
public abstract  class BaseDaoImpl<T, ID extends Serializable> extends HibernateDaoSupport implements BaseDao<T, ID> {
	
	private Log logger = LogFactory.getLog(getClass());
	
	protected Class<T> entityClass;

	public BaseDaoImpl() {
	}

	protected Class getEntityClass() {
		if (entityClass == null) {
			entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
			logger.debug("T class = " + entityClass.getName());
		}
		return entityClass;
	}
	
	public void deleteById(Class<T> entityClass, ID id) {
		T t = (T) getHibernateTemplate().get(entityClass, id);
		if(t != null)
			this.getHibernateTemplate().delete(t);
	}

	public void insert(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	public List<T> queryAll(Class<T> entityClass) {
		return this.getHibernateTemplate().find("from " + entityClass.getName() + "");
	}

	public T queryById(Class<T> entityClass, ID id) {
		return (T) this.getHibernateTemplate().get(entityClass, id);
	}

	@SuppressWarnings("deprecation")
	public List<T> queryForPage(final String hql, final int offset, final int length) {
		
		return (List<T>) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setFirstResult(offset);
				query.setMaxResults(length);
				List items = query.list();
				//if (items.size() == 0) items = null;
				return items;
			}
		}, true);
	}
	
	 public int getAllRowCount(String hql){  
	        return getHibernateTemplate().find(hql).size();  
	    }


	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}

	public List<T> queryByHql(Class<T> entityClass, String hql) {
		return this.getHibernateTemplate().find(hql);
	}  

}