<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
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
		<!-- zui -->
			<link href="${ctx}/css/zui.min.css" rel="stylesheet">
		<!--fonts-->
		<!--coustom css-->
			<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="${ctx}/js/simpleCart.min.js"></script>
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
            });
			
            var istrue = new Array(0,0,0);
            
            
            function emailajax(email) {
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
       					document.getElementById('E_li').style.display='';
       					document.getElementById('E_tip').innerHTML="邮箱已存在，请重新输入";
       					istrue[1]=-1;
       				}else {
       					document.getElementById('E_li_suucess').style.display='';
       					istrue[1]=0;
       				}
       			 }
       		 }
       		 xmlhttp.open("POST","${ctx }/user/isexit",true);
       		 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
       		 xmlhttp.send("email="+email);
            }
            function btnonclick() {
                var check = document.getElementById("btn");
                if(check.value=='1') {
                    document.getElementById('zbtn').disabled=false;
                    check.value='0';
     
                } else if(check.value=='0') { 
                    document.getElementById('zbtn').disabled=true;
                    check.value='1';
                }
            };
            function isEmail(str){
                var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
                return reg.test(str);
            };
            
            function textblur(a,name,b) {
            	if(!a.value) {
            		document.getElementById(b+'_li').style.display='';
            		document.getElementById(b+'_tip').innerHTML=name+"不能为空";
            		istrue[0]=-1;
            	}else if(b=='E') {
            		 if(!isEmail(a.value))
        			    {
        				 document.getElementById(b+'_li').style.display='';
                 		 document.getElementById(b+'_tip').innerHTML="邮箱格式有错误";
                 		istrue[1]=-1;
        			    }else {
        			    	emailajax(a.value);
        			    	istrue[1]=0;
        			    }
            	}else {
            		document.getElementById(b+'_li_suucess').style.display='';
            		istrue[0]=0;
            	}	
            };
            function textfocus(b) {
            	document.getElementById(b+'_li').style.display='none';
            	document.getElementById(b+'_li_suucess').style.display='none';
            };
            
           
            function  validate() {
            	var p1 = document.getElementById('password').value;
            	var p2 = document.getElementById('password2').value;
            	if(!p1) {
            		document.getElementById('m1_li').style.display='';
            		document.getElementById('m1_tip').innerHTML="密码不能为空";
            		istrue[2]=-1;
            	}else {
            		if(p2===p1) {
            			document.getElementById('m1_li_suucess').style.display='';
            			document.getElementById('m2_li_suucess').style.display='';
            			istrue[2]=0;
                	}else{
                		document.getElementById('m2_li').style.display='';
                		document.getElementById('m2_tip').innerHTML="两次输入的密码不一致";
                		istrue[2]=-1;
                	}
            	}
            };
            function endsubmit() {
            	for(var i=0;i<3;i++) {
            		if(istrue[i]!=0) {
            			alert("有项填写错误");
            			return false;
            		}
            	}
            	return true;
            }
            </script>
        <!-- //FlexSlider-->
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.html">N-AIR</a>
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
                       <a class="btn btn-default log-bar" href="register.jsp" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="${ctx }/user/login" role="button">登录</a>
                        <div class="cart box_1">
                            <a href="checkout.html">
                            <h3>
                                <div class="total">
<span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div></h3>
                            </a>
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
                    <li class="active">REGISTER</li>
                </ol>
            </div>
        </div>
        <!-- reg-form -->
	<div class="reg-form">
		<div class="container">
			<div class="reg">
				<h3>注册</h3>
				<p>欢迎，请输入以下详细信息以继续。</p>
				<p>如果您之前已经注册过我们，<a href="${ctx }/user/login">请点击这里</a></p>
				<p>带*为必须填写项</p>
				<form  action="/Shop/user/registe" method="post"  onsubmit="return endsubmit()">
					<ul>
						<li class="text-info">姓名: </li>
						<li><input  type="text" name="username" value="" onblur="textblur(this,'姓','xing')" onfocus="textfocus('xing')"/><font size="6">*</font>
						<i id="xing_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i></li>
  						<li id="xing_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="xing_tip" style="color:#FF5151"></span>
  						</li>
					</ul>
					<ul>
						<li class="text-info">Email: </li>
						<li><input  type="text" name="email" value="" onblur="textblur(this,'邮箱','E')" onfocus="textfocus('E')"/><font size="6">*</font>
						<i id="E_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i></li>
						<li id="E_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="E_tip" style="color:#FF5151"></span>
  						</li>
					</ul>
					<ul>
						<li class="text-info">密码: </li>
						<li><input  id="password" name="password" type="password" value="" onblur="validate()" onfocus="textfocus('m1')"/><font size="6">*</font>
						<i id="m1_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i></li>
						<li id="m1_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="m1_tip" style="color:#FF5151"></span>
  						</li>
					</ul>
					<ul>
					
						<li class="text-info">重新输入密码:</li>
						<li><input id="password2" type="password" value="" onblur="validate()" onfocus="textfocus('m2')"><font size="6">*</font>
						<i id="m2_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i></li>
						<li id="m2_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="m2_tip" style="color:#FF5151"></span>
  						</li>
					</ul>
					<ul>
						<li class="text-info">手机号:</li>
						<li><input  type="text" name="phonenumber" value=""></li>
					</ul>
                   <ul>
                      <p class="click"><input type="checkbox" id="btn"style="width:15px;height:15px" value="1" onclick="btnonclick()">通过点击此按钮，您同意我的<a href="#">政策条款和条件。</a></p>
                   </ul>		
					<input  id="zbtn" type="submit" value="注册" disabled="disabled">
				</form>
		
			</div>
		</div>
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