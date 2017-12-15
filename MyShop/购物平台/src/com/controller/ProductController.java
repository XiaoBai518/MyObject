package com.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.CartProduct;
import com.entity.OrderDetails;
import com.entity.Orders;
import com.entity.Product;
import com.entity.ProductSize;
import com.entity.ShippingAddress;
import com.entity.User;
import com.service.ProductServiceImpl;
import com.service.UserServiceImpl;
import com.util.Page;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource
	private ProductServiceImpl productServiceImpl;
	@Resource
	private UserServiceImpl UserServiceImpl;
	
	//下一页
	@RequestMapping(value="/next",method=RequestMethod.GET)
	public String nextPage(@RequestParam("page") int nowpage,Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
		List<Product> list;
		if(pagesize!=null) {
			Page p = new Page(++nowpage,Integer.parseInt(pagesize));
			 list = productServiceImpl.findByPage(p);
				model.addAttribute("page", nowpage);
				model.addAttribute("product", list);
				return "product_list";
		}else {
			Page p = new Page(++nowpage);
			list = productServiceImpl.findByPage(p);
			model.addAttribute("page", nowpage);
			model.addAttribute("product", list);
			return "shop";
		}	
	}
	//上一页
	@RequestMapping(value="/previou",method=RequestMethod.GET)
	public String previouPage(@RequestParam("page") int nowpage,Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
		
		List<Product> list;
		if(pagesize!=null) {
			Page p = new Page(--nowpage,Integer.parseInt(pagesize));
			 list = productServiceImpl.findByPage(p);
			 model.addAttribute("page", nowpage);
				model.addAttribute("product", list);
				return "product_list";
		}else {
			Page p = new Page(--nowpage);
			list = productServiceImpl.findByPage(p);
			model.addAttribute("page", nowpage);
			model.addAttribute("product", list);
			return "shop";
		}
		
	}
	//首页
	@RequestMapping(value="/first",method=RequestMethod.GET)
	public String firstpage (Model model,@RequestParam(value = "pagesize", required = false)String pagesize,HttpServletRequest request) {
		List<Product> list;
		if(pagesize!=null) {
			Page p = new Page(1,Integer.parseInt(pagesize));
			 list = productServiceImpl.findByPage(p);
			 model.addAttribute("page", 1);
			 model.addAttribute("product", list);
			 return "product_list";
		}else {
			Page p = new Page(1);
			p.setTotalCount(productServiceImpl.finProductNumber(null));
			request.getSession().setAttribute("pagenum", p.getTotalPageNum());


			list = productServiceImpl.findByPage(p);
			model.addAttribute("page", 1);
			model.addAttribute("product", list);
			return "shop";
		}	
	}
	//末页
	@RequestMapping(value="/last",method=RequestMethod.GET)
	public String lastpage (Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
		Page p ;
		List<Product> list;
		if(pagesize!=null) {
			 p = new Page(1,Integer.parseInt(pagesize));
				p.setTotalCount(productServiceImpl.finProductNumber(null));
			 list = productServiceImpl.findByPage(p);
			 model.addAttribute("page", p.getTotalPageNum());
				model.addAttribute("product", list);
				return "product_list";
		}else {
			 p = new Page(1);
			list = productServiceImpl.findByPage(p);
			p.setTotalCount(productServiceImpl.finProductNumber(null));
			model.addAttribute("page", p.getTotalPageNum());
			model.addAttribute("product", list);
			return "shop";
		}		
	}
	

	//加入购物车
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addCart(@RequestParam("id") String id,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<CartProduct> list = (List<CartProduct>)session.getAttribute("cart");
		if(list==null) {
			return "-1";
		}
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getId()==Integer.parseInt(id)) {
				String number = request.getParameter("number");
				String size = request.getParameter("size");
				if(size!=null) {
					if(size.equals(list.get(i).getSize())) {				
							list.get(i).setNumber(Integer.parseInt(number)+list.get(i).getNumber());
						return "1";
					}	
				}else {
					if(list.get(i).getSize().equals("40")) {
						list.get(i).setNumber(1+list.get(i).getNumber());
						return "1";
					}
				}
			}
		}
			CartProduct p= new CartProduct(); 
			p.setP(productServiceImpl.findById(Integer.parseInt(id)));
	String number = request.getParameter("number");	
			if(number!=null) {
				p.setNumber(Integer.parseInt(number));
			}else {
				p.setNumber(1);
			}
	String size = request.getParameter("size");
			if(size!=null) {
				p.setSize(size);
			}else {
				p.setSize("40");
			}	
	list.add(p);
	return "1";
	}
	
	//删除项购物车
		@RequestMapping(value="/remove",method=RequestMethod.POST)
		@ResponseBody
		public String removeCart(@RequestParam("id") String id,@RequestParam("size") String size,HttpServletRequest request) {
			HttpSession session = request.getSession();
			List<CartProduct> list = (List<CartProduct>)session.getAttribute("cart");
			
			String price = productServiceImpl.remove(list, id, size);
			return price;
		}
		/*
		 * 清空购物车
		 */
		@RequestMapping(value="/clearcart",method=RequestMethod.GET)
		public String clearCart(HttpSession session) {
			
			session.setAttribute("cart", new ArrayList<CartProduct>());
			
			return "redirect:/product/checkout";
		}
		
	//前往购物车
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public String checkout(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		List<CartProduct> list  = (List<CartProduct>)session.getAttribute("cart");
		if(list==null) {
			model.addAttribute("erro", "no_erro");
			Page p = new Page(1);
			List<Product> plist = productServiceImpl.findByPage(p);
			model.addAttribute("product",plist);
			return "shop";
		}
		DecimalFormat df0 = new DecimalFormat("###.00");
		//总价
		double total=0;
		for(int i=0;i<list.size();i++) {
			total+=(list.get(i).getNumber()*list.get(i).getPrice())+0.00;
		}
		model.addAttribute("total", df0.format(total));
		model.addAttribute("cart", list);
		return "checkout"; 
	}
	//前往商品详情页
	@RequestMapping(value="/single",method=RequestMethod.GET)
	public String single(@RequestParam("id") String id,Model model) {
		Product p = productServiceImpl.findFullById(Integer.parseInt(id));
		model.addAttribute("p", p);
		return "single";
	}
	
	//前往订单页面
	@RequestMapping(value="/toorder",method=RequestMethod.GET)
	public String toorder(HttpServletRequest request,Model model,@RequestParam("total") String total) {
		HttpSession session = request.getSession();
	    User u = (User)session.getAttribute("user");
	    
	    
	    
	    List<String> province = UserServiceImpl.findprovince();	    
	    List<ShippingAddress> saddress = UserServiceImpl.findShippingAddress(u.getId());
	    
	    model.addAttribute("total", total);
	    model.addAttribute("saddress", saddress);
	    model.addAttribute("userid", u.getId());
	    model.addAttribute("province", province);
		return "order";
	}
	//结算订单
	@RequestMapping(value="/order",method=RequestMethod.GET)
	public String addorder(HttpServletRequest request,@RequestParam("total") String total,@RequestParam("id") String saddressid) {
		//用户
		HttpSession session = request.getSession();
	    User u = (User)session.getAttribute("user");
	    //购买的商品
	    List<CartProduct> list = (List<CartProduct>)session.getAttribute("cart");
	    //查找收货地址
	    ShippingAddress saddress = UserServiceImpl.findShippingAddressById(saddressid);
	    
	    //添加订单
	    productServiceImpl.addorder(list, u,total,saddress);
	    //请空购物车
	    
		session.setAttribute("cart", new ArrayList<CartProduct>());
	    return "ordertip";
	}
	/*
	 * 添加商品
	 */
	@RequestMapping(value="/addproduct",method=RequestMethod.POST,produces = "text/html; charset=utf-8")
	@ResponseBody
	public String addproduct(@RequestParam(value = "upfile", required = false)MultipartFile [] file,Product p,@RequestParam("sizename") String []sname) {
		productServiceImpl.addproduct(p, sname, file);
		
		return "成功";
	}
	/*
	 * 删除商品
	 */
	@RequestMapping(value="/deleteproduct",method=RequestMethod.GET)
	public String deleteproduct(@RequestParam("page")int pagenum,Model model,@RequestParam("productid")String id) {
		productServiceImpl.deleteProduct(id);
		Page p = new Page(pagenum,10);
		List<Product> list = productServiceImpl.findByPage(p);
		if(list.size()==0) {
			if(pagenum!=1) {
				pagenum-=1;
				p = new Page(pagenum,10);
				list = productServiceImpl.findByPage(p);
			 }
		 }
		 model.addAttribute("page", pagenum);
		 model.addAttribute("product", list);
		 return "product_list";
	}
	/*
	 * 批量删除商品
	 */
	@RequestMapping(value="/querydelete",method=RequestMethod.POST)
	public String querydeleteproduct(@RequestParam("productid")String[] id,@RequestParam("page")int pagenum,Model model) {	
		for(String s:id) {
			productServiceImpl.deleteProduct(id);
		}
		Page p = new Page(pagenum,10);
		List<Product> list = productServiceImpl.findByPage(p);
		if(list.size()==0) {
			if(pagenum!=1) {
				pagenum-=1;
				p = new Page(pagenum,10);
				list = productServiceImpl.findByPage(p);
			 }
		 }
		
		 model.addAttribute("page", pagenum);
		 model.addAttribute("product", list);
		 return "product_list";
		
	}
	/*
	 * 修改商品
	 */
	@RequestMapping(value="/torevise",method=RequestMethod.GET)
	public String torevise(@RequestParam("id")int id,Model model) {
		Product p = productServiceImpl.findById(id);
		
		model.addAttribute("product", p);
		return "reviseproduct";
	}
	@RequestMapping(value="/revise",method=RequestMethod.POST,produces = "text/html; charset=utf-8")
	@ResponseBody
	public String reviseproduct(@RequestParam(value = "upfile", required = false)MultipartFile [] file,Product p,@RequestParam(value = "images", required = false)String [] defaultimg) {
		
		productServiceImpl.updateProduct(p, file,defaultimg);
		
		return "成功";
	}
	/*
	 * 查询商品
	 */
	@RequestMapping(value="/selectproduct",method=RequestMethod.POST)
	public String selectProduct(@RequestParam(value="text") String text,Model model) {

			List<Product> list = productServiceImpl.findByName(text);
			model.addAttribute("product", list);
			model.addAttribute("type", "houtai");
			return "product_list";
		
	}
	/*
	 * 订单列表
	 */
	//首页
	@RequestMapping(value="/firstorders",method=RequestMethod.GET)
	public String firstorders(Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
		List<Orders> list;
		if(pagesize!=null) {
			Page p = new Page(1,Integer.parseInt(pagesize));
			 list = productServiceImpl.findOrdersByPage(p);
			 model.addAttribute("page", 1);
			 model.addAttribute("orders", list);
			 return "order_list";
		}else {
			Page p = new Page(1);
			list = productServiceImpl.findOrdersByPage(p);
			model.addAttribute("page", 1);
			model.addAttribute("product", list);
			return "shop";
		}
	}
	//下一页
		@RequestMapping(value="/nextorders",method=RequestMethod.GET)
		public String nextorders(@RequestParam("page") int nowpage,Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
			List<Orders> list;
			if(pagesize!=null) {
				Page p = new Page(++nowpage,Integer.parseInt(pagesize));
				 list = productServiceImpl.findOrdersByPage(p);
					model.addAttribute("page", nowpage);
					model.addAttribute("orders", list);
					return "order_list";
			}else {
				Page p = new Page(++nowpage);
				list = productServiceImpl.findOrdersByPage(p);
				model.addAttribute("page", nowpage);
				model.addAttribute("orders", list);
				return "shop";
			}	
		}
		//上一页
		@RequestMapping(value="/previouorders",method=RequestMethod.GET)
		public String previouorders(@RequestParam("page") int nowpage,Model model,@RequestParam(value = "pagesize", required = false)String pagesize) {
			
			List<Orders> list;
			if(pagesize!=null) {
				Page p = new Page(--nowpage,Integer.parseInt(pagesize));
				 list = productServiceImpl.findOrdersByPage(p);
				 model.addAttribute("page", nowpage);
					model.addAttribute("product", list);
					return "order_list";
			}else {
				Page p = new Page(--nowpage);
				list = productServiceImpl.findOrdersByPage(p);
				model.addAttribute("page", nowpage);
				model.addAttribute("product", list);
				return "shop";
			}
			
		}
		/*
		 * 订单批量删除
		 */
		@RequestMapping(value="/querydeleteorders",method=RequestMethod.POST)
		public String querydeleteorders(@RequestParam("orderid")String[] id,@RequestParam("page")int pagenum,Model model) {	
			for(String s:id) {
				productServiceImpl.deleteOrder(id);;
			}
			Page p = new Page(pagenum,10);
			List<Orders> list = productServiceImpl.findOrdersByPage(p);
			if(list.size()==0) {
				if(pagenum!=1) {
					pagenum-=1;
					p = new Page(pagenum,10);
					list = productServiceImpl.findOrdersByPage(p);
				 }
			 }
			
			 model.addAttribute("page", pagenum);
			 model.addAttribute("orders", list);
			 return "order_list";
		}	
		/*
		 * 订单删除
		 */
		@RequestMapping(value="/deleteorders")
		public String deleteorders(@RequestParam("orderid")String id,@RequestParam("page")int pagenum,Model model) {	
				productServiceImpl.deleteOrder(id);

			Page p = new Page(pagenum,10);
			List<Orders> list = productServiceImpl.findOrdersByPage(p);
			if(list.size()==0) {
				if(pagenum!=1) {
					pagenum-=1;
					p = new Page(pagenum,10);
					list = productServiceImpl.findOrdersByPage(p);
				 }
			 }
			
			 model.addAttribute("page", pagenum);
			 model.addAttribute("orders", list);
			 return "order_list";
		}
		/*
		 * 订单详情
		 */
		@RequestMapping(value="/detail",method=RequestMethod.GET)
		public String detail(@RequestParam("id")int orderid,Model model) {
			List<OrderDetails> list = productServiceImpl.findOrderDetails(orderid);
			
			for(OrderDetails od:list) {
				Product p = productServiceImpl.findById(od.getProductid());
				od.setP(p);
			}
			model.addAttribute("orderdetails", list);
			return "orderdetails_list";
		}
		/*
		 * 分类查找 首页
		 */
		@RequestMapping(value="/classify",method=RequestMethod.GET)
		public String classify(@RequestParam("type")String type,Model model,HttpServletRequest request) {
			List<Product> list = productServiceImpl.findByType(type);
			
			Page p = new Page(1);
			p.setTotalCount(productServiceImpl.finProductNumber(type));
			
			list = productServiceImpl.findBytypeFirst(list, p);
			request.getSession().setAttribute("pagenum", p.getTotalPageNum());
			
			model.addAttribute("page", 1);
			model.addAttribute("type", type);
			model.addAttribute("product", list);
			return "shop";
		}
		/*
		 * 分类查找 末页
		 */
		@RequestMapping(value="/lastclassify",method=RequestMethod.GET)
		public String lastclassify(@RequestParam("type")String type,Model model,HttpSession session) {
			List<Product> list = productServiceImpl.findByType(type);
			
			int pagenum = (Integer)session.getAttribute("pagenum");
			Page p = new Page(pagenum);
			list = productServiceImpl.findBytypeFirst(list, p);

			
			model.addAttribute("page", 1);
			model.addAttribute("type", type);
			model.addAttribute("product", list);
			return "shop";
		}
		
		/*
		 * 分类查找 下一页
		 */
		@RequestMapping(value="/nextclassify",method=RequestMethod.GET)
		public String nextclassify(@RequestParam("type")String type,Model model,@RequestParam("page") int nowpage) {
			List<Product> list = productServiceImpl.findByType(type);
			
			Page p = new Page(++nowpage);
			list = productServiceImpl.findBytypeFirst(list, p);
			
			model.addAttribute("page", nowpage);
			model.addAttribute("type", type);
			model.addAttribute("product", list);
			return "shop";
		}
		/*
		 * 分类查找 上一页
		 */
		@RequestMapping(value="/previouclassify",method=RequestMethod.GET)
		public String previouclassify(@RequestParam("type")String type,Model model,@RequestParam("page") int nowpage) {
			List<Product> list = productServiceImpl.findByType(type);
			
			Page p = new Page(--nowpage);
			list = productServiceImpl.findBytypeFirst(list, p);
			
			model.addAttribute("page", nowpage);
			model.addAttribute("type", type);
			model.addAttribute("product", list);
			return "shop";
		}
		
		
}
