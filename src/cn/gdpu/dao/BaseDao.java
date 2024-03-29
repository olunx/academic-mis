package cn.gdpu.dao;

import java.io.Serializable;
import java.util.List;

/**  
 *  Dao层基接口，数据访问逻辑.这里只提供基本的操作增、删、查、改和分页的方法.  
 *    
 *    
 * @author Fucahl  
 * @version 1.0  
 * @since 1.0  
 */  
public interface BaseDao<T, ID extends Serializable> {
	
	/**  
     * 增加持久化对象
     *   
     * @param entity:增加持久化的对象  
     * @return 无返回值
     * */  
	public abstract void insert(T entity);
	
	/**
	 * 根据id来删除持久化对象
	 * 
	 * @param entityClass：删除持久化的对象
	 * @param id：对象主键
	 * @return 无返回值
	 */
	public abstract void deleteById(Class<T> entityClass, ID id);
	
	/**
	 * 修改持久化对象
	 * 
	 * @param entity：修改持久化的对象
	 * @return 无返回值
	 */
	public abstract void update(T entity);
	
	/**
	 * 根据id查找持久化对象
	 * 
	 * @param entityClass：查找持久化的对象的类型
	 * @param id：对象主键
	 * @return T：查找持久化的对象
	 */
	public abstract T queryById(Class<T> entityClass, ID id);
	
	/**
	 * 根据Hql返回数据
	 * @param entityClass
	 * @param hql
	 * @return
	 */
	public abstract List<T> queryByHql(Class<T> entityClass, String hql);
	
	/**
	 * 查找全部持久化对象
	 * 
	 * @param 无
	 * @return 查找持久化对象列表
	 */
	public abstract List<T> queryAll(Class<T> entityClass);
	
	/**
	 * 分页查找持久化对象
	 * @param hql：查询Sql语句
	 * @param offset:起始位置
	 * @param length:查找长度
	 * @return 查找持久化对象列表
	 */
	public abstract List<T> queryForPage(final String hql,final int offset,final int length); 
	
	public abstract int getAllRowCount(String hql);  
}
