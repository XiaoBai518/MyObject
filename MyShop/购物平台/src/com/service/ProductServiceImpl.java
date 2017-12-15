package com.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.product.ProductDaoImpl;
import com.entity.CartProduct;
import com.entity.OrderDetails;
import com.entity.Orders;
import com.entity.Product;
import com.entity.ProductSize;
import com.entity.ShippingAddress;
import com.entity.User;
import java.text.SimpleDateFormat;
import com.util.Page;

@Service
@Transactional(readOnly=false)
public class ProductServiceImpl {

	@Resource
	private ProductDaoImpl productDaoImpl;
	

	/*
	 * 加入Session域
	 */
	public void toSession(Object o,HttpServletRequest request,HttpServletResponse response,String key){
		HttpSession session = request.getSession();
		session.setAttribute(key, o);
		session.setMaxInactiveInterval(180);
		Cookie cookie = new Cookie("JSESSIONID",session.getId());         
		cookie.setMaxAge(session.getMaxInactiveInterval());  
		cookie.setPath(session.getServletContext().getContextPath());  
		response.addCookie(cookie);  
	}
	/*
	 * 查询所有商品
	 */
	public List<Product> findAll() {
		return productDaoImpl.finAll();
	}
	/*
	 * 查询商品总数
	 */
	public  long finProductNumber(String type) { 
		return productDaoImpl.Productsnumber(type);
	}
	/*
	 * 按页查询商品
	 */
	public List<Product> findByPage(Page p) {
		List<Product> list = productDaoImpl.findByPage(p);
		for(Product pro:list) {
			List<String> slist = productDaoImpl.fingSizeById(pro.getId());
			pro.setSize(slist);
			
		}
		return list;
	}
	/*
	 * 按ID查询简介商品信息
	 */
	public Product findById(int id) {
		 Product p = productDaoImpl.findById(id);
		 List<String> slist = productDaoImpl.fingSizeById(p.getId());
			p.setSize(slist);
		 return p;
	}
	/*
	 * 按ID查询完整商品信息
	 */
	public Product findFullById(int id) {
		Product p = productDaoImpl.findById(id);
		List<String> size = productDaoImpl.fingSizeById(id);
		
		p.setSize(size);
		return p;
		
	}
   /*
    * 删除购物车中商品
    */
	public String remove(List<CartProduct> list,String id,String size) {
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getId()==Integer.parseInt(id)&&list.get(i).getSize().equals(size)) {
				double price = list.get(i).getPrice();
				int number = list.get(i).getNumber();
				price*= number;
				
				list.remove(i);
				return Double.toString(price);
			}
		}
		return "0";
	}


	/*
	 * 添加商品
	 */
	 public void addproduct(Product p,String [] sname,MultipartFile [] file) {
		 	String href = "G:\\java_project_web\\购物平台\\WebContent\\images";
		 for(int i=0;i<file.length;i++) {
			if(file[i].getSize()!=0) {
				//文件后缀
				String tail = "."+file[i].getOriginalFilename().split("\\.")[1];
			 String sdate=(new SimpleDateFormat("yyyyMMddHHmmss")).format( new Date());  
				File f = new File(href+"\\"+sdate+tail);
				try {
					file[i].transferTo(f);
				} catch (IllegalStateException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}			 
					switch(i) {
					case 0: {
						p.setImage1("/Shop/images/"+sdate+tail);
						break;
					}
					case 1: {
						p.setImage2("/Shop/images/"+sdate+tail);
						break;
					}
					case 2: {
						p.setImage3("/Shop/images/"+sdate+tail);
						break;
					}
					case 3: {
						p.setImage4("/Shop/images/"+sdate+tail);
						break;
					}
					}
			}	
			}
		int productid =  productDaoImpl.addproduct(p);
		
		for(String s:sname) {
			ProductSize ps = new ProductSize();
			ps.setName(s);
			ps.setProductid(productid);		
			productDaoImpl.addproductsize(ps);
		}
		
		
	 }
	
	 /*
	  * 删除商品
	  */
	 public void deleteProduct(String...id) {
		 for(String s:id) {
			 //删除商品
			 Product p = new Product();
			 p.setId(Integer.parseInt(s));
			 productDaoImpl.deleteproduct(p);
			 //删除商品尺寸
			 productDaoImpl.deleteproductsize(Integer.parseInt(s));
		 }
		
	 }
	 /*
	  * 更新商品
	  */
	 public void updateProduct(Product p,MultipartFile [] file,String[] defaultimg) {
		 
		 for(int i=0;i<defaultimg.length;i++) {
			 String src = defaultimg[i].split("&")[0];
			 String index = defaultimg[i].split("&")[1];
			switch (index) {
			case "1" :{
				p.setImage1(src);
				break;
			}
			case "2" :{
				p.setImage2(src);
				break;
			}
			case "3" :{
				p.setImage3(src);
				break;
			}
			case "4" :{
				p.setImage4(src);
				break;
			}
			}
		 }
		 for(int i=0;i<file.length;i++) {
			 if(file[i].getSize()!=0) {
				 String href = "G:\\java_project_web\\购物平台\\WebContent\\images";
					//文件后缀
					String tail = "."+file[i].getOriginalFilename().split("\\.")[1];
				 String sdate=(new SimpleDateFormat("yyyyMMddHHmmss")).format( new Date());  
					File f = new File(href+"\\"+sdate+tail);
					try {
						file[i].transferTo(f);
					} catch (IllegalStateException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					} catch (IOException e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}			 
						switch(i) {
						case 0: {
							p.setImage1("/Shop/images/"+sdate+tail);
							break;
						}
						case 1: {
							p.setImage2("/Shop/images/"+sdate+tail);
							break;
						}
						case 2: {
							p.setImage3("/Shop/images/"+sdate+tail);
							break;
						}
						case 3: {
							p.setImage4("/Shop/images/"+sdate+tail);
							break;
						}
						}
				}
			 }
		 //更新商品表
		 productDaoImpl.updateProduct(p);
		 //删除该商品的尺寸
		 productDaoImpl.deleteproductsize(p.getId());
		 //增加该商品新的尺寸
		 List<String> slist = p.getSize();
			for(String s:slist) {
				ProductSize ps = new ProductSize();
				ps.setName(s);
				ps.setProductid(p.getId());
				productDaoImpl.addproductsize(ps);
			}
		 
	 }
	 /*
	  * 根据商品名查询商品
	  */
	 public List<Product> findByName(String name) {
		 List<Product> list = productDaoImpl.findByName(name);
		 
		 for(Product p:list) {
			 p.setSize(productDaoImpl.fingSizeById(p.getId()));
		 }
		 return list;
	 }
	 /*
	  * 根据商品类型查询商品
	  */
	 public List<Product> findByType(String Type) {
		 List<Product> list = productDaoImpl.findByType(Type);
		 
		 for(Product p:list) {
			 p.setSize(productDaoImpl.fingSizeById(p.getId()));
		 }
		 return list;
	 }
	 /*
	  * 分页处理
	  */
	 public List<Product> findBytypeFirst(List<Product> list,Page p) {
		 int startindex = (p.getCurrentpagenum()-1)*p.getPageSize();
		 List<Product> plist = new ArrayList<Product>();
		 if(p.getTotalPageNum()!=0) {
			 for(int i=startindex;i<p.getPageSize();i++) {
				 plist.add(list.get(i));
				 if(i+1==list.size()) {
					 break;
				 }
			 } 
		 }
		
		 
		 return plist;
	 }
		/*
		 * 添加订单
		 */
		public void addorder(List<CartProduct> list,User u,String totalprice,ShippingAddress saddress) {
			if(list.size()!=0) {
				Orders o = new Orders();
				o.setDate(new Date());//设置时间
				o.setState("已付款");
				o.setUseremail(u.getEmail());
			
				o.setAddress(saddress.getSimpleShippingaddress());
				o.setRecipients(saddress.getRecipients());
				o.setPhonenumber(saddress.getPhonenumber());
				o.setTotalprice(totalprice);
				
				int orderid = productDaoImpl.addorder(o);
				
				for(int i=0;i<list.size();i++) {
					OrderDetails od = new OrderDetails();
					od.setNumber(list.get(i).getNumber());
					od.setOrderid(orderid);
					od.setProductid(list.get(i).getId());
					od.setSize(list.get(i).getSize());
					
					productDaoImpl.addorderdetails(od);
				}
			}	
		}
		/*
		 * 按页查询订单
		 */
		public List<Orders> findOrdersByPage(Page p) {
			return productDaoImpl.findOrdersByPage(p);
		}
		/*
		 * 删除订单
		 */
	  public void deleteOrder(String...id) {
		  for(String s:id) {
			  //删除订单
			  Orders o = new Orders();
			  o.setId(Integer.parseInt(s));
			  productDaoImpl.deleteOrder(o);
			  //删除订单详情
			  productDaoImpl.deleteOrderDetails(Integer.parseInt(s));
		  }
	  }
	  /*
	   * 查询订单详情
	   */
	  public List<OrderDetails> findOrderDetails(int orderid) {
		 return  productDaoImpl.findOrderDetails(orderid);
	  }

}
