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
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'/> 
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
            <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
       
              lastprice = document.getElementById("lastprice");
              a = document.getElementById("total");
              ahref = a.href;
               a.href= ahref+lastprice.innerHTML;
            });
            function removeclick(id,size) {
            	var xmlhttp;
          		 if(window.XMLHttpRequest) {
          			 xmlhttp = new XMLHttpRequest();
          		 }else {
          			 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
          		 }
          		 xmlhttp.onreadystatechange = function() {
          			 if(xmlhttp.readyState==4&&xmlhttp.status==200) {
          				var n = xmlhttp.responseText;	    	
          		var p = parseFloat(lastprice.innerHTML)-parseFloat(n);
          			    	lastprice.innerHTML = p.toFixed(2);
                 a.href= ahref+lastprice.innerHTML;
                 
          		if(parseFloat(lastprice.innerHTML)==0) {
          			lastprice.innerHTML = 0.00;
          		}
              }
             }
          		xmlhttp.open("POST","${ctx }/product/remove",true);
           		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
               	xmlhttp.send("id="+id+"&size="+size);
              
            };
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
                        <a class="btn btn-default log-bar" href="${ctx }/user/registe" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="${ctx }/user/login" role="button">登录</a>
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
                    <li><a href="products.hml">Products</a></li>
                    <li class="active">CART</li>
                </ol>
            </div>
        </div>
        <!-- check-out -->
            <div class="check">
                <div class="container">	 
                    <div class="col-md-3 cart-total">
                        <a class="continue" href="#">继续购物</a>
                        <hr class="featurette-divider">
                        <ul class="total_price">
                           <li class="last_price"> <h4>总价</h4></li>	
                           <li class="last_price"style="font-size: 20px;color: #655858;">$<span id="lastprice">${total}</span></li>
                           <div class="clearfix"> </div>
                        </ul> 
                        <div class="clearfix"></div>
                        <a class="order" id="total" href="${ctx }/product/toorder?total=">下单</a>
                    </div>
                    <div class="col-md-9 cart-items">
                        <h1 >购物车<button class="btn btn-danger " type="button" style="margin-left:600px;"onclick="window.location.href='${ctx}/product/clearcart'">清空购物车</button></h1>
                        <c:if test="${empty cart }">
			
			<p class="cart">您的购物车中没有商品<br>点击<a href="${ctx }/product/first"> 这里</a> 继续购物</p>
					</c:if>
                        <c:forEach items="${cart }" var="p"> 
                        	<script>$(document).ready(function(c) {
                                $('.close${p.id}${p.size}').on('click', function(c){
                                	removeclick('${p.id}','${p.size}');
                                	$('.cart-header${p.id}${p.size}').fadeOut('slow', function(c){
                                        $('.cart-header${p.id}${p.size}').remove();
                                    });
                                    });	  
                                });
                           </script>
                        <div class="cart-header${p.id }${p.size}">
                <div class="close${p.id }${p.size}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div>
                            <div class="cart-sec simpleCart_shelfItem">
                                    <div class="cart-item cyc">
                                        <img src="${ctx }/images/grid8.jpg" class="img-responsive" alt=""/>
                                    </div>
                                   <div class="cart-item-info">
                                        <ul class="qty">
                                            <li><p>Size : ${p.size }</p></li>
                                            <li><p>Qty : ${p.number }</p></li>
                                            <li><p>Price each : $${p.price }</p></li>
                                        </ul>
                                        <div class="delivery">
                                             <p>Service Charges : Rs.190.00</p>
                                             <span>Delivered in 2-3 bussiness days</span>
                                             <div class="clearfix"></div>
                                        </div>	
                                   </div>
                                   <div class="clearfix"></div>

                              </div>
                         </div>	
                        </c:forEach>
               	
                    </div>
                    <div class="clearfix"> </div>
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