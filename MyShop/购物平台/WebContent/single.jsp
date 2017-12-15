<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
            <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Single</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		<!--zui-->
		 <link href="${ctx }/css/myzui.css" rel="stylesheet" type="text/css">
		<script src="${ctx }/lib/jquery/jquery.js"></script>
		<script src="${ctx }/js/zui.js"></script>
		<!--fonts-->
		<!--bootstrap-->
			 <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css"/>
		<!--bootstrap-js-->
			<script src="${ctx }/js/bootstrap.min.js"></script>
		<!--script-->
         <!-- FlexSlider -->
            <script src="${ctx }/js/imagezoom.js"></script>
            <script defer src="${ctx }/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="${ctx }/css/flexslider.css" type="text/css" media="screen" />

            <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
              $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
              });
            });
            
            
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
          		 var size = document.getElementById("size").value;
          		 var number = document.getElementById("qty").value;
          		xmlhttp.open("POST","${ctx }/product/add",true);
           		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
               	xmlhttp.send("id="+id+"&size="+size+"&number="+number);
            };
            
    		function add() {
    			var a = document.getElementById("qty");
    			var num = parseInt(a.value);
    			
    			a.value=num+1;
    			
    		};
    		function reduce() {
    			var a = document.getElementById("qty");
    			var num = parseInt(a.value);
    			if(num-1<1)
    				a.value=1;
    			else
    				a.value=num-1;
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
                        <a class="btn btn-default log-bar" href="register.html" role="button">注册</a>
                        <a class="btn btn-default log-bar" href="signup.html" role="button">登录</a>
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
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Men</a></li>
                    <li class="active">Shop</li>
                </ol>
            </div>
        </div>
        <div class="showcase-grid">
            <div class="container">
                <div class="col-md-8 showcase">
                    <div class="flexslider">
                          <ul class="slides">
                            <li data-thumb="images/show.jpg">
                                <div class="thumb-image"> <img src="${ctx }/images/show.jpg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/show1.jpg">
                                 <div class="thumb-image"> <img src="${ctx }/images/show1.jpg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/show2.jpg">
                               <div class="thumb-image"> <img src="${ctx }/images/show2.jpg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                            <li data-thumb="images/show3.jpg">
                               <div class="thumb-image"> <img src="${ctx }/images/show3.jpg" data-imagezoom="true" class="img-responsive"> </div>
                            </li>
                          </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 showcase">
                    <div class="showcase-rt-top">
                        <div class="pull-left shoe-name">
                            <h3>${p.name }</h3>
                            <p>Men's running shoes</p>
                            <h4>&#36;${p.price }</h4>
                        </div>
                        <div class="pull-left rating-stars">
                            <ul>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
    <li><a href="#"><span class="glyphicon glyphicon-star star-stn" aria-hidden="true"></span></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <hr class="featurette-divider">
                    <div class="shocase-rt-bot">
                        <div class="float-qty-chart">
                        <ul>
                            <li class="qty">
                                <h3>尺寸</h3>
                                <select class="form-control siz-chrt" id="size">
                                <c:forEach items="${p.size }" var="s">
                                <option value="${s }">${s }</option>
                                </c:forEach>
                                </select>
                            </li>
                            <li class="qty">
                                <h4>数量</h4>
                           		<input  type="button" value="-" style="width:15px;font-weight:bold;font-size:13px;" onclick="reduce()"/>
								<input id="qty"  type="text" value="1" style="width:45px;height:30px" />
								<input  type="button" value="+" style="width:15px;font-weight:bold;font-size:13px;" onclick="add()"/>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        </div>
                        <ul>
                            <li class="ad-2-crt simpleCart_shelfItem">
                                <a class="btn item_add" href="javascript:;" role="button" onclick="cartclick('${p.id }')">加入购物车</a>
                                <a class="btn" href="${ctx }/checkout" role="button">立刻购买</a>
                            </li>
                        </ul>
                    </div>
                    <div class="showcase-last">
                        <h3>产品详情</h3>
                        <ul>
                            <li>Internal bootie wraps your foot for a sock-like fit</li>
        <li>Unique eyestays work with the Flywire cables to create an even better glove-like fit</li>
                            <li>Waffle outsole for durability and multi-surface traction</li>
        <li>Sculpted Cushlon midsole combines plush cushioning and springy resilience for impact protection</li>
                            <li>Midsole flex grooves for greater forefoot flexibility</li>
                        </ul>
                    </div>
                </div>
        <div class="clearfix"></div>
            </div>
        </div>
        
        <div class="specifications">
            <div class="container">
              <h3>Item Details</h3> 
                <div class="detai-tabs">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills tab-nike" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Highlights</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Description</a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Terms & conditiona</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                    <p>The full-length Max Air unit delivers excellent cushioning with enhanced flexibility for smoother transitions through footstrike.</p> 
                    <p>Dynamic Flywire cables integrate with the laces and wrap your midfoot for a truly adaptive, supportive fit.</p>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">
                    <p>Nike is one of the leading manufacturer and supplier of sports equipment, footwear and apparels. Nike is a global brand and it continuously creates products using high technology and design innovation. Nike has a vast collection of sports shoes for men at Snapdeal. You can explore our range of basketball shoes, football shoes, cricket shoes, tennis shoes, running shoes, daily shoes or lifestyle shoes. Take your pick from an array of sports shoes in vibrant colours like red, yellow, green, blue, brown, black, grey, olive, pink, beige and white. Designed for top performance, these shoes match the way you play or run. Available in materials like leather, canvas, suede leather, faux leather, mesh etc, these shoes are lightweight, comfortable, sturdy and extremely sporty. The sole of all Nike shoes is designed to provide an increased amount of comfort and the material is good enough to provide an improved fit. These shoes are easy to maintain and last for a really long time given to their durability. Buy Nike shoes for men online with us at some unbelievable discounts and great prices. So get faster and run farther with your Nike shoes and track how hard you can play.</p>    
                    </div>
                    <div role="tabpanel" class="tab-pane" id="messages">
                        The images represent actual product though color of the image and product may slightly differ.    
                    </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="you-might-like">
            <div class="container">
                <h3 class="you-might">Products You May Like</h3>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                     <!-- normal -->
                        <div class="ih-item square effect3 bottom_to_top">
                            <div class="bottom-2-top">
                    <div class="img"><img src="${ctx }/images/grid4.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                        </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
                    </div>
                </div>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                        <div class="ih-item square effect3 bottom_to_top">
                            <div class="bottom-2-top">
                    <div class="img"><img src="${ctx }/images/grid6.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                        </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
                    </div>
                </div>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                        <div class="ih-item square effect3 bottom_to_top">
                            <div class="bottom-2-top">
                    <div class="img"><img src="${ctx }/images/grid3.jpg" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>style 01</h3>
                                </div>
                                <div class="pull-right styl-price">
    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$190</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                        </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="single.html">Quick view</a>
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
    <script>
    window.onload = function(){
    	var lis = document.getElementsByClassName('flex-control-thumbs')[0].children;
    	for(var i=0;i<4;i++){
    		lis[i].children[0].src = '${ctx }/'+lis[i].children[0].getAttribute('src')
    	}
    }
    	
    </script>
</html>
    