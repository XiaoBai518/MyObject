<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
          <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Checkout</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		<link href="${ctx }/css/zui.min.css" rel="stylesheet" type="text/css">
		<!--fonts-->
		<!--bootstrap-->
			 <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
		<!--default-js-->
			<script src="${ctx}/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="${ctx}/js/bootstrap.min.js"></script>
		<!--script-->
         <!-- FlexSlider -->
            <script src="${ctx}/js/imagezoom.js"></script>
              <script defer src="${ctx}/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="${ctx}/css/flexslider.css" type="text/css" media="screen" />

            <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
              $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
              });
              	
              var erro = "${erro }";
              if(erro!="") {
            	  if(erro=="e_erro") {
            		  alert("请填写正确的用户名！")
            	  }else if(erro=="p_erro") {
            		  alert("密码错误！")
            	  }else if(erro =="s_erro") {
            		  alert("账户未激活，请邮箱进行激活！")
            	  }
            	 
              }
              
            });
            
            
            </script>
        <!-- //FlexSlider-->
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.jsp">N-AIR</a>
                    </div>
                          <div id="user" style="width:160px;position: absolute;top: 10%;right: 10%;text-align:left;">
                        <span  style="font-family: SimHei;font-size:15px">
                        	<c:if test="${empty  sessionScope.user}">
                        		您好~!
                        		<script>
                        			var u = document.getElementById("user")
                        			 u.style.cssText="width:60px;position: absolute;top: 10%;right: 10%;text-align:left;"
                        		</script>
                        	</c:if>
                        	<c:if test="${not empty sessionScope.user }">
                        	您好，亲爱的<a href="${ctx }/user.jsp">${sessionScope.user.username}</a>。
                        	</c:if>
                        </span>
                     </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="user/registe" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="user/login" role="button">登录</a>
                        <div class="cart box_1">
                            <p><a href="javascript:;" class="simpleCart_empty">购物车</a></p>
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
                    <li><a href="index.jsp">HOME</a></li>
                    <li class="active">LOGIN</li>
                </ol>
            </div>
        </div>
        <!--signup-->
        <!-- login-page -->
        <div class="login">
            <div class="container">
                <div class="login-grids">
                    <div class="col-md-6 log">
                             <h3>登录</h3>
                             <div class="strip"></div>
                             <p>欢迎，请输入以下内容继续</p>
                             <form:form commandName="user" action="/Shop/user/login" method="post">
                                 <h5>邮箱:</h5>	
                                 <form:input type="text" path="email" value=""/>
                                 <h5>密码:</h5>
                                 <form:input type="password" path="password" value=""/><br>					
                                 <input type="submit" value="Login">
                             </form:form>
                            <a href="#">忘记密码 ?</a>
                    </div>
                    <div class="col-md-6 login-right">
                            <h3>新注册</h3>
                            <div class="strip"></div>
                            <p>通过在我们的商店中创建帐户，您将能够更快地完成结帐流程，存储多个送货地址，在您的帐户中查看和跟踪您的订单等等。</p>
                            <a href="register.jsp" class="button">创建一个账户</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
<!-- //login-page -->
        <!--signup-->
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