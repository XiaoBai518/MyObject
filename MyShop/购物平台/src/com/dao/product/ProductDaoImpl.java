package com.dao.product;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.entity.OrderDetails;
import com.entity.Orders;
import com.entity.Product;
import com.entity.ProductSize;
import com.util.Page;

@Repository
public class ProductDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	/*
	 * 查找全部商品
	 */
	public List<Product> finAll() {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Product");
		return query.list();
	}
	/*
	 * 按页查询商品
	 */
	public List<Product> findByPage(Page p) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Product");
		
		query.setFirstResult((p.getCurrentpagenum()-1)*p.getPageSize());
		query.setMaxResults(p.getPageSize());
		
		return query.list();
	}
	
	/*
	 * 查询所有商品数量
	 */
	public long Productsnumber(String type) {
		Query query;
		if(type==null) {
			 query = this.sessionFactory.getCurrentSession().createQuery("select count(p) from Product p");
		}else {
			query = this.sessionFactory.getCurrentSession().createQuery("select count(p) from Product p where type like '%"+type+"%'");
		}
		
		
		return (long)query.uniqueResult();
	}
	/*
	 * 按照ID查询商品
	 */
	public Product findById(int id) {
		return this.sessionFactory.getCurrentSession().get(Product.class, new Integer(id));
	
	}
	/*
	 * 根据名称查询商品
	 */
	public List<Product> findByName(String name) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Product p where p.name like '%"+name+"%'");
		
		return query.list();
	}
	/*
	 * 根据名称查询商品
	 */
	public List<Product> findByType(String type) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Product p where p.name like '%"+type+"%'");
		
		return query.list();
	}
	/*
	 * 按照商品ID查询商品尺寸
	 */
	public List<String> fingSizeById(int id) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("select ps.name from ProductSize ps where productid=?").setParameter(0,id);
		
		return query.list();
	}
	/*
	 * 添加商品
	 */
	public Integer addproduct(Product p) {
		this.sessionFactory.getCurrentSession().save(p);
		return p.getId();
	}
	/*
	 * 添加商品尺寸
	 */
	public void addproductsize(ProductSize ps) {
		this.sessionFactory.getCurrentSession().save(ps);
	}
	/*
	 * 修改商品
	 */
	public void updateProduct(Product p) {
		this.sessionFactory.getCurrentSession().update(p);
	}
	/*
	 * 删除商品
	 */
	public void deleteproduct(Product p) {
		this.sessionFactory.getCurrentSession().delete(p);
	}
	/*
	 * 删除商品尺寸
	 */
	public void deleteproductsize(int productid) {
		
		Query query = this.sessionFactory.getCurrentSession().createQuery("delete from ProductSize where productid=?").setParameter(0, productid);
		query.executeUpdate();
	}

	
	/*
	 * 添加订单
	 */
	public int addorder(Orders o) {
		this.sessionFactory.getCurrentSession().save(o);

		int id = o.getId();
		return id;
	}
	/*
	 * 添加订单明细
	 */
	public void addorderdetails(OrderDetails od) {
		this.sessionFactory.getCurrentSession().save(od);
	}
	/*
	 * 查询全部订单
	 */
	public List<Orders> findOrders() {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Orders");
		
		return query.list();
	}
	/*
	 * 按页查询订单
	 */
	public List<Orders> findOrdersByPage(Page p) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Orders");
		
		query.setFirstResult((p.getCurrentpagenum()-1)*p.getPageSize());
		query.setMaxResults(p.getPageSize());
		
		return query.list();
	}
	/*
	 * 删除订单
	 */
	public void deleteOrder(Orders o) {
		this.sessionFactory.getCurrentSession().delete(o);
	}
	/*
	 * 删除订单详情
	 */
	public void deleteOrderDetails(int orderid) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("delete from OrderDetails where orderid=?").setParameter(0, orderid);
		query.executeUpdate();
	}
	/*
	 * 按订单号查询订单详情
	 */
	public List<OrderDetails> findOrderDetails(int orderid) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from OrderDetails  where orderid=?").setParameter(0,orderid);
		
		return query.list();
	}
	
}
