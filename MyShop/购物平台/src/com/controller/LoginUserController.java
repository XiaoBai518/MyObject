package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Role;
import com.entity.ShippingAddress;
import com.entity.User;
import com.google.gson.Gson;
import com.service.ProductServiceImpl;
import com.service.UserServiceImpl;
import com.util.Page;

@Controller
@RequestMapping("/user")
public class LoginUserController {
	

	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private ProductServiceImpl productServiceImpl;
	
	/*
	 * 注册未激活
	 */
	@RequestMapping(value="/registe" ,method=RequestMethod.POST)
	public String register(User u,Model model) {
				u.setRole("用户");
				//设置状态为未激活
				u.setState(0);
		//将未激活用户插入数据库
		userServiceImpl.registe(u);
//		return "redirect:/user/login";
			model.addAttribute("email", u.getEmail());
				return "registtip";
	}
	/*
	 * 激活
	 */
	@RequestMapping(value="/activate",method=RequestMethod.GET)
	public String activate(@RequestParam("code")String code,Model model) {
		User u = userServiceImpl.findByCode(code);
		
		if(u!=null) {
			//设置为已激活状态
			u.setState(1);
			//更新用户 并且将用户角色插入数据库
			Role r = new Role();
			r.setUserid(u.getId());
			r.setName("用户");
			userServiceImpl.activate(u,r);
		}
		model.addAttribute("activate", "success");
		model.addAttribute("user", u);
		return "registtip";
	}

	/*
	 * 验证邮箱是否存在
	 */
	@RequestMapping(value="/isexit", method=RequestMethod.POST)
	@ResponseBody
	public String isexit(HttpServletRequest request) {
		String email = request.getParameter("email");
		User u = (User)userServiceImpl.findByEmail(email);
		if(u!=null) {
			//如果邮箱已经存在 返回 -1
			return "1";
		}
		//如果邮箱没被注册过 返回 1
		return "-1";
	}
	/*
	 * 激活完立即登陆
	 */
	@RequestMapping("/afterregist")
	public String registlogin(Model model,@RequestParam("loginname")String email,HttpServletRequest request,HttpServletResponse response) {
		User user = userServiceImpl.findByEmail(email);
		//查找第一页
		//登录成功 分配购物车并将用户信息存入session
		userServiceImpl.getCart(request, response,user);
			
		return "redirect:/product/first";
	}
	
	/*
	 * 登录
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String tologin(Model model) {
		User u = new User();
		model.addAttribute("user", u);
		return "signup";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User u,Model model,HttpServletRequest request,HttpServletResponse response) {
		User user = (User)userServiceImpl.findByEmail(u.getEmail());
		String pageurl = request.getParameter("pageurl");
		//后台
		if(pageurl!=null) {
			if(user!=null) {
				if(u.getPassword().equals(user.getPassword())){
					if(user.getRole().equals("用户")) {
						//权限不足
						model.addAttribute("erro", "r_erro");
						return "managelogin";
					}else {
						userServiceImpl.toSession(user, request, response, "user");
						return "manageindex";
					}										
				}else {
					u = new User();
					model.addAttribute("erro", "p_erro");
					return "managelogin";
				}
				
			}else {
				u = new User();
				model.addAttribute("erro", "e_erro");
				return "managelogin";
			}
		}else {
			//前台
			if(user!=null) {
				if(u.getPassword().equals(user.getPassword())){
						if(user.getState()==1) {
							//激活状态
							//查找第一页
							//登录成功 分配购物车并将用户信息存入session
							userServiceImpl.getCart(request, response,user);
							
							return "redirect:/product/first";
						}else {
							System.out.println(u.getState());
							//账户未激活
							u = new User();
							model.addAttribute("user", u);
							model.addAttribute("erro", "s_erro");
							return "signup";
						}
						
				}else {
					//密码错误
					u = new User();
					model.addAttribute("user", u);
					model.addAttribute("erro", "p_erro");
					return "signup";
				}
				//账号错误
			}else {
				u = new User();
				model.addAttribute("user", u);
				model.addAttribute("erro", "e_erro");
				return "signup";
			}
		}
		
	}
	
	
	/*
	 * 前往用户主页
	 */
	
	@RequestMapping(value="/information",method=RequestMethod.GET)
	public String userInformation(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		String [] str = u.getEmail().split("@");
		String head = str[0];
		String last = str[1]; 
		
		List<ShippingAddress> saddress = userServiceImpl.findShippingAddress(u.getId());
		 List<String> province = userServiceImpl.findprovince();
		 
		   model.addAttribute("province", province);
		   model.addAttribute("saddress", saddress);
		   model.addAttribute("user", u);
		   model.addAttribute("email", head);
		   model.addAttribute("last", last);
		return"user";
	}
	/*
	 * 更新用户信息
	 */
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateuser(User u,ShippingAddress saddress,HttpServletRequest request) {
	
		userServiceImpl.clearinterfere(u, saddress);
		saddress.setUserid(u.getId());
		userServiceImpl.update(u,request);
		userServiceImpl.saveShippingAddress(saddress);
		return "redirect:/user/information";
	}
	/*
	 * 新增收货地址
	 */
	@RequestMapping(value="/addaddress",method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addaddress(ShippingAddress saddress) {
		userServiceImpl.saveShippingAddress(saddress);
		
		 Gson json = new Gson();
		return json.toJson(saddress);
	}
	/*
	 * 删除收货地址
	 */
	@RequestMapping(value="/deleteaddress",method=RequestMethod.GET)
	@ResponseBody
	public String deleteaddress(@RequestParam("id") String id) {
		userServiceImpl.deleteaddress(Integer.parseInt(id));
		
		return "1";
	}
	
	
	/*
	 * 级联地址
	 */
	@RequestMapping(value="/cascade",method=RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String cascadeadress(HttpServletRequest request,@RequestParam("level") String level,@RequestParam("value") String address) {
			List<String> list =  userServiceImpl.findaddress(level, address);
			Gson json = new Gson();
		return json.toJson(list);
	}
	/*
	 * 添加管理员
	 */
	@RequestMapping(value="/addmanager",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String addManager(User u) {
		
		Role r = new Role();
		r.setName("管理员");
		u.setRole("管理员");
		userServiceImpl.addmanager(u, r);
		
		return "成功";
	}
	/*
	 * 查看用户列表
	 */
	/*
	 * 首页
	 */
	@RequestMapping(value="/first",method=RequestMethod.GET)
	public String first(Model model,HttpServletRequest request,HttpServletResponse response) {
		Page p = new Page(1,10);
		long count = userServiceImpl.findCount();
		p.setTotalCount(count);
		userServiceImpl.toSession(new Integer(p.getTotalPageNum()), request, response, "pagenum");
		List<User> list = userServiceImpl.findByPage(p);
		
		model.addAttribute("user", list);
		model.addAttribute("page", 1);
		return "user_list";
	}
	@RequestMapping(value="/next",method=RequestMethod.GET)
	public String next(@RequestParam("page")int page,Model model) {
		Page p = new Page(++page,10);
		List<User> list = userServiceImpl.findByPage(p);
		model.addAttribute("user", list);
		model.addAttribute("page", page);
		return "user_list";
	}
	@RequestMapping(value="/previou",method=RequestMethod.GET)
	public String previou(@RequestParam("page")int page,Model model) {
		Page p = new Page(--page,10);
		List<User> list = userServiceImpl.findByPage(p);
		model.addAttribute("user", list);
		model.addAttribute("page", page);
		return "user_list";
	}
	
	/*
	 * 查询用户
	 */
	@RequestMapping(value="/selectuser",method=RequestMethod.POST)
	public String selectUser(@RequestParam(value="text") String text,Model model) {
				
		List<User> list;
				if(text.indexOf("@")!=-1) {
					//包含@符号 为 邮箱查询
					 list = new ArrayList<User>();
					list.add(userServiceImpl.findconsumerByEmail(text));
				}else {
					//按用户名查找
					 list = userServiceImpl.findByName(text);
				}
		model.addAttribute("type", "houtai");
		model.addAttribute("user", list);
		return "user_list";
	}
	
	
}
