<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Activate</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		 <!--zui-->
		 <link href="${ctx }/css/zui.min.css" rel="stylesheet" type="text/css">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		<!--fonts-->
		<!--bootstrap-->
			 <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
             <link href="${ctx }/css/zui.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="${ctx }/js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="${ctx }/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="${ctx }/js/bootstrap.min.js"></script>

            <style type="text/css">
            .input-group {
                width: 350px;
                margin-bottom:30px;
                margin-left: 30px;
                float: left;
            }
            </style>
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.jsp">N-AIR</a>
                    </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="register.jsp" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="user/login" role="button">登录</a>
                        <div class="cart box_1">
                            <p><a href="${ctx }/product/checkout" class="simpleCart_empty">购物车</a></p>
                            <div class="clearfix"> </div>
                        </div>	
                    </div>
        <div class="clearfix"></div>
                </div>
                <!---menu-----bar--->
                <div class="header-botom">
                    <div class="content white">
                    <nav class="navbar navbar-default nav-menu" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <!--/.navbar-header-->

                           <div class="collapse navbar-collapse collapse-pdng" id="bs-example-navbar-collapse-1"style="width:490px">
                            <ul class="nav navbar-nav nav-font">
                                <li class="dropdown">
                                    <a href="${ctx }/product/first" class="dropdown-toggle"><i class="icon icon-shopping-cart"></i>&nbsp;&nbsp;商店</a>
                                </li>
                                <li class="dropdown">
                                    <a href="${ctx }/product/classify?type=男" class="dropdown-toggle"><i class="icon icon-mars"></i>&nbsp;&nbsp;男的</a>
                                </li>
                                <li class="dropdown">
                                    <a href="${ctx }/product/classify?type=女" class="dropdown-toggle"><i class="icon icon-venus"></i>&nbsp;&nbsp;女的</a>
                               
                                </li>
                                <li class="dropdown">
                                    <a href="${ctx }/product/classify?type=童" class="dropdown-toggle"><i class="icon icon-leaf"></i>&nbsp;&nbsp;儿童的</a>
                                </li>
                                <li><a href="contact.html"><i class="icon icon-chat-dot"></i>&nbsp;&nbsp;联系我们</a></li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <!--/.navbar-collapse-->
                        <div class="clearfix"></div>
                    </nav>
                    <!--/.navbar-->   
                        <div class="clearfix"></div>
                    </div>
                    <!--/.content--->
                </div>
                    <!--header-bottom-->
            </div>
        </div>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="register.html">Regist</a></li>
                    <li class="active">Activate</li>
                </ol>
            </div>
        </div>
        <c:if test="${empty activate }">
        		<div class="mybody" style="width:1000px;margin-left:200px">
            <div class="main_right" style="width: 1198px;margin: 20px auto;border: 1px solid #CCC;overflow: hidden;">
    			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px; color:#666; ">
        			<tr>
           			 <td bgcolor="#ebebeb" style=" padding:10px; line-height:30px; font-size:20px; color:#f69100;">&nbsp;
               		 <img src="http://www.xinfangsheng.com:80//front_style/front_image/success.png" width="40px" height="40px" style="margin-left:25px;"/>
                	<span style="margin-left: 20px;vertical-align: middle;">注册成功！</span>
            		</td>
       			 </tr>
    		</table>
		<div class="main_box1" style="padding-right: 40px;padding-left: 40px;list-style: none;">
			<ul style="padding-top: 10px;border-bottom: 1px dashed #eee;padding-bottom: 10px;list-style: none;">

				<li style="font-size: 15px;color: #666;line-height: 25px;">
    				您已完成注册，我们已将邮件发送至${email }，请您前往邮箱点击邮件中的链接完成激活.</li>
				</ul>
	</div>
		</div>
		<div class="clear"></div>
        </div>
        </c:if>
         <c:if test="${not empty activate }">
        		<div class="mybody" style="width:1000px;margin-left:200px">
            <div class="main_right" style="width: 1198px;margin: 20px auto;border: 1px solid #CCC;overflow: hidden;">
    			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px; color:#666; ">
        			<tr>
           			 <td bgcolor="#ebebeb" style=" padding:10px; line-height:30px; font-size:20px; color:#f69100;">&nbsp;
               		 <img src="http://www.xinfangsheng.com:80//front_style/front_image/success.png" width="40px" height="40px" style="margin-left:25px;"/>
                	<span style="margin-left: 20px;vertical-align: middle;">激活成功！</span>
            		</td>
       			 </tr>
    		</table>
		<div class="main_box1" style="padding-right: 40px;padding-left: 40px;list-style: none;">
			<ul style="padding-top: 10px;border-bottom: 1px dashed #eee;padding-bottom: 10px;list-style: none;">

				<li style="font-size: 15px;color: #666;line-height: 25px;">
    				您在N-AIR的账户是${user.username }。请您妥善保管好您的账号资料，不要泄露给其他人。现在您可以：</li>
				</ul>
				<ul style="border-bottom:none; padding-bottom:40px;padding-top: 10px;list-style: none;">
<li ><i class="icon icon-shopping-cart icon-2x"></i>&nbsp;&nbsp;<a href="${ctx }/product/afterregist?loginname=${user.email}" style="color: #666;font-size: 16px;text-decoration: none;">进行购物</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon icon-home icon-2x"></i>&nbsp;&nbsp;<a href="index.jsp" style="color: #666;font-size: 16px;text-decoration: none;">前往首页</a></li>
	</div>
		</div>
		<div class="clear"></div>
        </div>
        </c:if>


        <div class="footer-grid">
             <div class="container">
                <div class="col-md-2 re-ft-grd">
                    <h3>分类</h3>
                    <ul class="categories">
                        <li><a href="#">男的</a></li>
                        <li><a href="#">女的</a></li>
                        <li><a href="#">儿童的</a></li>
                        <li><a href="#">运动的</a></li>
                    </ul>
                </div>
                <div class="col-md-2 re-ft-grd">
                    <h3>帮助中心</h3>
                    <ul class="shot-links">
                        <li><a href="contact.html">联系我们</a></li>
                        <li><a href="#">支持</a></li>
                        <li><a href="#">送货</a></li>
                        <li><a href="#">退货政策</a></li>
                        <li><a href="#">条款和条件</a></li>
                    </ul>
                </div>
                <div class="col-md-6 re-ft-grd">
                    <h3>社区</h3>
                    <ul class="social">
                        <li><a href="#" class="qq">QQ</a></li>
                        <li><a href="#" class="vx">微信</a></li>
                        <li><a href="#" class="weibo">微博</a></li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
                <div class="col-md-2 re-ft-grd">
                    <div class="bt-logo">
                        <div class="logo">
                            <a href="index.html" class="ft-log">N-AIR</a>
                        </div>
                    </div>
                </div>
        <div class="clearfix"></div>
            </div>
            <div class="copy-rt">
                <div class="container">
            <p>Copyright &copy; 2015.Company name All rights reserved.</p>
                </div>
            </div>
        </div>
    </body>
</html>