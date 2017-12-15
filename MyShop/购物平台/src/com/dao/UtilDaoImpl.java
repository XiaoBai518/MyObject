package com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class UtilDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	
	/*
	 * 查找省份
	 */
	public List<String> findprovince() {
		Query query = this.sessionFactory.getCurrentSession().createQuery("select REGION_NAME from Region  where REGION_CODE like '%0000'");
		
		return (List<String>) query.getResultList();
	}
	
	/*
	 * 通过名字查找地区ID
	 */
	public String findprovinceId(String province) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("select REGION_CODE from Region  where REGION_NAME=?").setParameter(0, province);
			
		return (String)query.uniqueResult();
		
	}

	
	/*
	 * 根据ID查找城市
	 */
	public List<String> findcity(String provinceid) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("select REGION_NAME from Region  where REGION_CODE like '"+provinceid+"%00'");
		
		return (List<String>) query.getResultList();
		
 	}
	/*
	 * 根据ID查找区县
	 */
	public List<String> findarea(String addressid) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("select REGION_NAME from Region  where REGION_CODE like '"+addressid+"%'");
		
		return (List<String>) query.getResultList();
		
 	}

}
