package com.dao.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.entity.Role;
import com.entity.ShippingAddress;
import com.entity.User;
import com.util.Page;

@Repository
public class LoginUserDaoImpl {


	@Resource
	private SessionFactory sessionFactory;

	/*
	 * 保存用户
	 */
	public int save(User u) {
		
		this.sessionFactory.getCurrentSession().save(u);

		return u.getId();
	}
	/*
	 * 保存权限
	 */
	
	public void saverole(Role r) {
		
		this.sessionFactory.getCurrentSession().save(r);
	}
	/*
	 * 更新用户激活状态
	 */
	public void updatestate(User u) {
		this.sessionFactory.getCurrentSession().update(u);
	}
	/*
	 * 通过email查找user
	 */
	public User findByEmail (String email) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where email=?").setParameter(0, email);
		return (User)query.uniqueResult();
	}
	/*
	 * 通过email查找用户
	 */
	public User findconsumerByEmail (String email) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where email=? and role='用户'").setParameter(0, email);
		return (User)query.uniqueResult();
	}
	/*
	 * 通过code查找用户
	 */
	public User findByCode(String code) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where code=?").setParameter(0, code);
		return (User)query.uniqueResult();
	}
	
	
	/*
	 * 通过用户名查找用户
	 */
	public List<User> findByName(String name) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where username=? and role='用户'").setParameter(0, name);
		return (List<User>)query.list();
	}
	
	/*
	 * 更新用户信息
	 */
	public User update(User u) {
		this.sessionFactory.getCurrentSession().update(u);
		
		return findByEmail(u.getEmail());
	}
	/*
	 * 保存收货地址
	 */
	public void save(ShippingAddress saddress) {
		this.sessionFactory.getCurrentSession().save(saddress);
	}
	
	/*
	 * 删除收货地址
	 */
	public void deleteaddress(int id) {
		
		Query query = this.sessionFactory.getCurrentSession().createQuery("delete from ShippingAddress where id=?").setParameter(0, id);
		
		query.executeUpdate();
		
	}
	
	/*
	 * 根据用户ID查找收获地址
	 */
	public List<ShippingAddress> findShippingAddress(int id) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from ShippingAddress where userid=?").setParameter(0, id);
		return (List<ShippingAddress>)query.list();
	}
	/*
	 * 根据收货地址ID查找收货地址
	 */
	public ShippingAddress finShippingAddressById(int id) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from ShippingAddress where id=?").setParameter(0, id);
		return (ShippingAddress)query.uniqueResult();
	}
	/*
	 * 按页查询用户列表(role="用户")
	 */
	public List<User> findByPage(Page p) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from User where role='用户'");
		
		query.setFirstResult((p.getCurrentpagenum()-1)*p.getPageSize());
		query.setMaxResults(p.getPageSize());
		
		return query.list();
	}
	/*
	 * 查询用户数量
	 */
	public Long findCount() {
		Query query=this.sessionFactory.getCurrentSession().createQuery("select count(id) from User where role='用户'");
		return (Long)query.uniqueResult();
	}
	/*
	 * 用户的收货地址
	 */
	public List<String> findShippingaddress(int userid) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from ShippingAddress where userid="+userid+"");
		List<ShippingAddress> list = query.list();
		
		List<String> slist = new ArrayList<String>();
		for(ShippingAddress sa:list) {
			slist.add(sa.getSimpleaddress());
		}
		return slist;
		
	}
	

}
