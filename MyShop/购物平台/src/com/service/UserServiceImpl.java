package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.UtilDaoImpl;
import com.dao.user.LoginUserDaoImpl;
import com.entity.CartProduct;
import com.entity.Product;
import com.entity.Role;
import com.entity.ShippingAddress;
import com.entity.User;
import com.google.gson.Gson;
import com.sun.mail.util.MailSSLSocketFactory;
import com.util.Page;

@Service
@Transactional(readOnly=false)
public class UserServiceImpl {

	@Resource
	private LoginUserDaoImpl loginUserDaoImpl;
	@Resource
	private UtilDaoImpl utilDaoImpl;
	
	//注册  未激活
	public void registe(User u) {
		String code = null;
		//发送邮件
		try {
			code = sendEmail(u.getEmail());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		//设置用户CODE
		u.setCode(code);
		//将用户存入数据库
		loginUserDaoImpl.save(u);
		
	}
	//注册 已激活
	public void activate(User u,Role r) {
		loginUserDaoImpl.updatestate(u);
		
		loginUserDaoImpl.saverole(r);
		
	}
	//增加管理员
	public void addmanager(User u,Role r) {
		u.setState(1);
		int id = loginUserDaoImpl.save(u);
		
		r.setUserid(id);
		loginUserDaoImpl.saverole(r);
		
	}
	//发送邮件
	public String sendEmail(String email) throws Exception{
		//生成用户code
        String code=UUID.randomUUID().toString().replace("-", "");
        
		Properties prop = new Properties();
		// 开启debug调试，以便在控制台查看
		prop.setProperty("mail.debug", "true"); 
		// 设置邮件服务器主机名
		prop.setProperty("mail.host", "smtp.qq.com");
		// 发送服务器需要身份验证
		prop.setProperty("mail.smtp.auth", "true");
		// 发送邮件协议名称
		prop.setProperty("mail.transport.protocol", "smtp");
		
		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);

		// 创建session
		Session session = Session.getInstance(prop);
		// 通过session得到transport对象
		Transport ts = session.getTransport();
		// 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
		ts.connect("smtp.qq.com","949947078", "pwhiiumelomvbbcd");
		// 创建邮件
		Message message = createSimpleMail(session,email,code);
		// 发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
		return code;
	}
	/*
	* @Method: createSimpleMail
	* @Description: 创建一封只包含文本的邮件
	*/
	public static MimeMessage createSimpleMail(Session session,String email,String code)throws Exception {
		
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("949947078@qq.com"));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		// 邮件的标题
		message.setSubject("N-AIR账号激活");
		// 邮件的文本内容
		message.setContent("<h1>此邮件为官方激活邮件！请点击下面链接完成激活操作！</h1><h3><a href='http://localhost:8080/Shop/user/activate?code="+code+"'>http://localhost:8080/Shop/user/activate</a></h3>","text/html;charset=UTF-8");
		// 返回创建好的邮件对象
		return message;
		}
	//通过CODE查找user
	public User findByCode(String code) {
		User u = (User)loginUserDaoImpl.findByCode(code);
		if(u!=null) {
			return u;
		}
		return null;
	}
	//通过邮箱查找user
	public User findByEmail(String email) {
		User u = (User)loginUserDaoImpl.findByEmail(email);
		if(u!=null) {
			
			return u;
		}
		return null;
	}
	//通过邮箱查询用户
	public User findconsumerByEmail(String email) {
		User u = (User)loginUserDaoImpl.findconsumerByEmail(email);
		
		if(u==null) {
			
			return null;
		}
		
			List<String> slist = loginUserDaoImpl.findShippingaddress(u.getId());
			u.setShippingaddress(slist);
		return u;
	}
	//通过用户名查找用户
	public List<User> findByName(String name) {
		List<User> ulist = (List<User>)loginUserDaoImpl.findByName(name);
		if(ulist==null) {
			
			return null;
		}
		for(User u:ulist) {
			List<String> slist = loginUserDaoImpl.findShippingaddress(u.getId());
			u.setShippingaddress(slist);
			
		}
		return ulist;
	}
	
	/*
	 * 分配购物车
	 */
	public void getCart(HttpServletRequest request,HttpServletResponse response,User user) {
		List<CartProduct> cartlist = new ArrayList<CartProduct>();
		toSession(cartlist,request,response,"cart");
		toSession(user,request,response,"user");
	}
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
	 * 更新用户信息
	 */
	public void update(User u,HttpServletRequest request) {
		String str = request.getParameter("email")+request.getParameter("emaillast");
		u.setEmail(str);
		u = loginUserDaoImpl.update(u);
		
		request.getSession().setAttribute("user", u);;
	}
	/*
	 * 查询省份
	 */
	public List<String> findprovince() {
			
		return utilDaoImpl.findprovince();	
	}
	
	/*
	 * 根据级联等级查找地址
	 */
	public List<String> findaddress(String level,String address) {
		if(level.equals("2")) {
			String zxs = "北京市天津市上海市重庆市";
			if(zxs.indexOf(address)!=-1) {
				System.out.println("直辖市="+address);
				List<String> list = new ArrayList<String>();
				list.add(address);
				return list;
			}else {
				System.out.println(address);
				String provinceid = utilDaoImpl.findprovinceId(address).substring(0,2);
				List<String> list =  utilDaoImpl.findcity(provinceid);
				System.out.println(list.toString());
				list.remove(0);
				return list;
			}	
		}else {
			String zxs = "北京市天津市上海市重庆市";
			if(zxs.indexOf(address)!=-1) {
				String addressid = utilDaoImpl.findprovinceId(address).substring(0,2);
				List<String> list =  utilDaoImpl.findarea(addressid);
				list.remove(0);
				return list;
			}else {
				System.out.println(address);
				String addressid = utilDaoImpl.findprovinceId(address).substring(0,4);
				List<String> list =  utilDaoImpl.findarea(addressid);
				list.remove(0);
				return list;				
			}
		}
		
			
		
	}
	
	/*
	 * 保存收货地址
	 */
	public void saveShippingAddress(ShippingAddress saddress) {
		loginUserDaoImpl.save(saddress);
	}
	
	/*
	 * 根据用户ID查找收获地址
	 */
	public List<ShippingAddress> findShippingAddress(int userid) {
		List<ShippingAddress> saddress = loginUserDaoImpl.findShippingAddress(userid);
		for(ShippingAddress sa:saddress) {
			sa.getSimpleaddress();
		}
		return saddress;
	}
	/*
	 * 通过收货地址Id查找收货地址
	 */
	public ShippingAddress findShippingAddressById(String id) {
		
		return loginUserDaoImpl.finShippingAddressById(Integer.parseInt(id));
	}
	
	/*
	 * 删除收货地址
	 */
	
	public void deleteaddress(int id) {
		loginUserDaoImpl.deleteaddress(id);
		
	}
	
	/*
	 * 消除相同项的干扰
	 */
	public void clearinterfere(User u,ShippingAddress sa) {
		String [] str = u.getPhonenumber().split(",");
		
		u.setPhonenumber(str[0]);
		sa.setPhonenumber(str[1]);
	}
	/*
	 * 按页查询商品
	 */
	public List<User> findByPage(Page p) {
		List<User> list = loginUserDaoImpl.findByPage(p);
		if(list.size()==0) {
			return null;
		}
		for(User u:list) {
			List<String> slist = loginUserDaoImpl.findShippingaddress(u.getId());
			u.setShippingaddress(slist);
			
		}
		return list;
	}
	/*
	 * 查询用户数量
	 */
	public Long findCount() {
		return loginUserDaoImpl.findCount();
	}
}
