<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Shop</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset="utf-8">
		<script src="${ctx }/lib/jquery/jquery.js"></script>
		<link href="${ctx }/css/zui.min.css" rel="stylesheet" type="text/css">
		<script src="${ctx }/js/zui.js"></script>
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
        <!--form-css-->
        <link href="${ctx }/css/form.css" rel="stylesheet" type="text/css" media="all" />
		<!--bootstrap-->
			 <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css"/>
		<!--bootstrap-js-->
			<script src="${ctx }/js/bootstrap.min.js"></script>
		<!--script-->
            <script>

            window.onload=function(){ 
            	var erro = '${erro }'
            	if(erro) {
            		alert("请先登录");
            	}
            }
            function aclick() {
            	var a = '${cart }'
          		if(!a) {
          			alert("请先登录");
          			return false;
          		}
          		return true;
            };
            function cartclick(id) {
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
          			    	new $.zui.Messager('已加入购物车', {
        					    type: 'success' 
        					}).show();
          				}else {
          			    	new $.zui.Messager('请先登录', {
        					    type: 'danger' 
        					}).show();
          				}		
          		}
              }
          		xmlhttp.open("POST","${ctx }/product/add",true);
           		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
               	xmlhttp.send("id="+id);
            }
            function nextclick() {
        		var page = ${page }
        		var pagenum = ${sessionScope.pagenum }
        		if(page==pagenum) {
        			return false;
        		}
        		return true;
        	}
        	function previousclick() {
        		var page = ${page }
        		if(page==1) {
        			return false;
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
                        	您好，亲爱的<a href="${ctx }/user/information">${sessionScope.user.username}</a>。
                        	</c:if>
                        </span>
                     </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="${ctx }/user/registe" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="${ctx }/user/login" role="button">登录</a>
                        <div class="cart box_1">
                            <p><a href="${ctx }/product/checkout" class="simpleCart_empty" onclick="return aclick()">购物车</a></p>
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
                    <li><a href="${ctx }/index.jsp">Home</a></li>
                    <li class="active">PRODUCTS</li>
                </ol>
            </div>
        </div>
        <div class="products-gallery">
           <div class="container">
               <div class="col-md-9 grid-gallery">
               <c:forEach items="${product }"  var="p">
 					<div class="col-md-4 grid-stn simpleCart_shelfItem">
                        <!-- normal -->
                            <div class="ih-item square effect3 bottom_to_top">
                                <div class="bottom-2-top">
                        <div class="img"><img src="${p.image1 }" alt="/" class="img-responsive gri-wid"></div>
                                <div class="info">
                                    <div class="pull-left styl-hdn">
                                        <h3>${p.name }</h3>
                                    </div>
                                    <div class="pull-right styl-price">
        <p><a href="javascript:;" class="item_add"  onclick="cartclick('${p.id }')"><span id="cart" class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$${p.price }</span></a></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div></div>
                            </div>
                        <!-- end normal -->
                        <div class="quick-view">
                            <a href="${ctx }/product/single?id=${p.id }">Quick view</a>
                        </div>
                    </div>
                </c:forEach>
            <div class="clearfix"></div>
            <c:if test="${empty type }">
                       <div  style="width:200px;margin-left:600px"><a href="${ctx }/product/first">首页</a>&emsp;<a href="${ctx }/product/previou?page=${page }" onclick="return previousclick()">上一页</a>&emsp;<a href="${ctx }/product/next?page=${page }" onclick="return nextclick()">下一页</a>&emsp;<a href="${ctx }/product/last">末页</a></div>
            
            </c:if>
            <c:if test="${not empty type }">
            		   <div  style="width:200px;margin-left:600px"><a href="${ctx }/product/first?type=${type}">首页</a>&emsp;<a href="${ctx }/product/previou?page=${page }&type=${type}" onclick="return previousclick()">上一页</a>&emsp;<a href="${ctx }/product/next?page=${page }&type=${type}" onclick=" returnnextclick()">下一页</a>&emsp;<a href="${ctx }/product/last">末页</a></div>
            		   
            </c:if>
                </div>
               <div class="col-md-3 grid-details">
                    <div class="grid-addon">
                        <section  class="sky-form">
					 <div class="product_right">
						 <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
						 <div class="tab1">
							 <ul class="place">								
								 <li class="sort">Shoes</li>
								 <li class="by"><img src="${ctx }/images/do.png" alt=""></li>
									<div class="clearfix"> </div>
							  </ul>
							 <div class="single-bottom">						
									<a href="#"><p>Running</p></a>
									<a href="#"><p>Foot ball</p></a>
									<a href="#"><p>Daily</p></a>
									<a href="#"><p>Sneakers</p></a>
						     </div>
					      </div>						  
						  <div class="tab2">
							 <ul class="place">								
								 <li class="sort">Clothing</li>
								 <li class="by"><img src="${ctx }/images/do.png" alt=""></li>
									<div class="clearfix"> </div>
							  </ul>
							 <div class="single-bottom">						
									<a href="#"><p>Tracks</p></a>
									<a href="#"><p>Tees</p></a>
									<a href="#"><p>Hair bands</p></a>
									<a href="#"><p>Wrist bands</p></a>
						     </div>
					      </div>
						  <div class="tab3">
							 <ul class="place">								
								 <li class="sort">Gear</li>
								 <li class="by"><img src="${ctx }/images/do.png" alt=""></li>
									<div class="clearfix"> </div>
							  </ul>
							 <div class="single-bottom">						
									<a href="#"><p>Running app</p></a>
									<a href="#"><p>Training club</p></a>
									<a href="#"><p>Nike Fuel+Band se</p></a>
						     </div>
					      </div>						  
						  <!--script-->
						<script>
							$(document).ready(function(){
								$(".tab1 .single-bottom").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab3 .single-bottom").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .single-bottom").hide();
								
								$(".tab1 ul").click(function(){
									$(".tab1 .single-bottom").slideToggle(300);
									$(".tab2 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab2 ul").click(function(){
									$(".tab2 .single-bottom").slideToggle(300);
									$(".tab1 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab3 ul").click(function(){
									$(".tab3 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})
								$(".tab4 ul").click(function(){
									$(".tab4 .single-bottom").slideToggle(300);
									$(".tab5 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
								$(".tab5 ul").click(function(){
									$(".tab5 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
							});
						</script>
						<!-- script -->					 
				 </section>
				 <section  class="sky-form">
					 <h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS</h4>
					 <div class="row row1 scroll-pane">
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
						 </div>
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>40% - 50% (5)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
						 </div>
					 </div>
				 </section> 				 
	
					<section  class="sky-form">
						<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Type</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Air Max (30)</label>
								</div>
								<div class="col col-4">
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Armagadon   (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Helium (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kyron     (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Napolean  (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Foot Rock   (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Radiated  (30)</label>
<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Spiked  (30)</label>
								</div>
							</div>
				   </section>
				
                    </div>
               </div>
            <div class="clearfix"></div>
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
                    <div class="bt-logo" style="box-sizing: boder-box;">
                        <div class="logo" style="box-sizing: boder-box;">
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