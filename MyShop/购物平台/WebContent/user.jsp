<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>USER</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
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
		<script >
		function delte(id) {
        	var xmlhttp;
     		 if(window.XMLHttpRequest) {
     			 xmlhttp = new XMLHttpRequest();
     		 }else {
     			 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
     		 }
     		 xmlhttp.onreadystatechange = function() {
     			 if(xmlhttp.readyState==4&&xmlhttp.status==200) {
     				var n = xmlhttp.responseText;
     				if(n>0) {
     					var box = document.getElementById(id);
     					box.parentNode.removeChild(box);
     				}
     			
         	}
       	 }
     		xmlhttp.open("GET","${ctx }/user/deleteaddress?id="+id,true);
      		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
          	xmlhttp.send();
		}
		
		function change(level,val) {
        	var xmlhttp;
     		 if(window.XMLHttpRequest) {
     			 xmlhttp = new XMLHttpRequest();
     		 }else {
     			 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
     		 }
     		 xmlhttp.onreadystatechange = function() {
     			 if(xmlhttp.readyState==4&&xmlhttp.status==200) {
     				var n = xmlhttp.responseText;
     				var obj = eval('(' + n + ')');
     				if(level=="2") {
     					var sele=document.getElementById('city'); 
     					sele.options.length=0; 
     					for (var i = 0; i < obj.length; i++) {
				            $("#city").append("<option value=\'"+obj[i]+"\'>" + obj[i] + "</option>");

			  				}
     					 
     				}else if(level=="3") {
     					var sele=document.getElementById('area'); 
     					sele.options.length=0; 
     					for (var i = 0; i < obj.length; i++) {
				             $("#area").append("<option value=\'"+obj[i]+"\'>" + obj[i] + "</option>");

			  				}
     				}		
         	}
       	 }
     		xmlhttp.open("GET","${ctx }/user/cascade?level="+level+"&value="+val,true);
      		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
          	xmlhttp.send();
		}
		
		</script>
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.html">N-AIR</a>
                    </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="register.html" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="signup.html" role="button">登录</a>
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
                    <li><a href="index.html">Home</a></li>
                    <li><a href="register.html">LOGIN</a></li>
                    <li class="active">USER</li>
                </ol>
            </div>
        </div>
        <div class="mybody" style="width:1000px;margin-left:300px">
            <h1 style="margin-left:350px">个人中心</h1>
            <form:form id="userform" commandName="user" action="${ctx }/user/update" method="post">
            	<form:input type="hidden" path="id"/>
            	<form:input type="hidden" path="role"/>
            	<div class="input-group" style="margin-top:30px">
                <span class="input-group-addon"><i class="icon icon-user"></i>  用户名</span>
                <form:input type="text" path="username" class="form-control" placeholder="用户名"/>
                </div>
                <div class="input-group" style="width: 350px;margin-top:30px;">
                <span class="input-group-addon"><i class="icon icon-envelope-alt"></i>  邮箱</span>
                <input type="text" value="${email }" name="email" class="form-control" placeholder="邮箱" readonly="true" >
                <input type="hidden" name="emaillast" value="@${last }">
                
                <span class="input-group-addon">@${last }</span>
                </div>
                  <div class="input-group" >
                <span class="input-group-addon"><i class="icon icon-key"></i>  密码</span>
                <form:input type="password" path="password" class="form-control" placeholder="密码"/>
                </div>
          
                <div class="input-group" >
                <span class="input-group-addon"><i class="icon icon-phone"></i>  手机号</span>
                <form:input type="text" path="phonenumber" class="form-control" placeholder="手机号"/>
                </div>
                <c:forEach items="${saddress }" var="sa">
                	 <div class="input-group" style="width:800px" id="${sa.id }">
                	  <span class="input-group-addon"><i class="icon icon-home"></i>  收货地址</span>
                	  <input type="text" path="phonenumber" value= "${sa.simpleaddress }" class="form-control" readonly="true" />
                      <span class="input-group-addon"><a href="javascript:;" onclick="delte(${sa.id})">删除</a></span>
               		 </div>
                </c:forEach>
              
                <div class="input-group" style="width:1000px">
                 <span class="input-group-addon"><i class="icon icon-home"></i> 新增收货地址</span>
                 <select class="form-control"  name="province" id="region" onclick="change(2,this.value)">
								<c:forEach items="${province }" var="r">
									<option value="${r }">${r }</option>
								</c:forEach>
							</select>     
                 <span class="input-group-addon fix-border fix-padding"></span>               
                <select class="form-control"   name="city" id="city" onclick="change(3,this.value)" >
                	<option>城市</option>
                </select>     
                 <span class="input-group-addon fix-border fix-padding"></span>                 
                 <select class="form-control" name="area" id="area">
                 	<option>区/县</option>
                 </select>     
                 <span class="input-group-addon fix-border fix-padding"></span>                
                 <input type="text" class="form-control" name="address" placeholder="详细地址">
                 <span class="input-group-addon fix-border fix-padding"></span>                
                 <input type="text" class="form-control" name="recipients" placeholder="收件人">
                 <span class="input-group-addon fix-border fix-padding"></span>                
                 <input type="text" class="form-control" name="phonenumber" placeholder="联系电话">
                 </div>
                   <div class="input-group" style="width:500px;margin-left:380px;">
             		<button class="btn btn-primary" form="userform" type="submit">保存</button>
                </div>
            </form:form>
                
                <div class="clearfix"> </div>
        </div>

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