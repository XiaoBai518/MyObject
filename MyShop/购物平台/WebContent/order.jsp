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
		<meta charset="utf-8"/>
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		
		<!--fonts-->
		<!--bootstrap-->
			 <link href="${ctx }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
             <link href="${ctx }/css/zui.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css"/>
			<link rel="stylesheet" type="text/css" href="${ctx }/css/css.css" />
        <!--shop-kart-js-->
        <script src="${ctx }/js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="${ctx }/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="${ctx }/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				ahref= document.getElementById("end").href;
				var region = $("#region");
				var address = $("#address");
				var number_this = $("#number_this");
				var name = $("#name_");
				var phone = $("#phone");
				$("#sub_setID").click(function() {
					var input_out = $(".input_style");
					for (var i = 0; i <= input_out.length; i++) {
						if ($(input_out[i]).val() == "") {
							$(input_out[i]).css("border", "1px solid red");
							
							return false;
						} else {
							$(input_out[i]).css("border", "1px solid #cccccc");
						}
					}
				});
				
				$(".shade_content").hide();
				$(".shade").hide();
				$('.nav_mini ul li').hover(function() {
					$(this).find('.two_nav').show(100);
				}, function() {
					$(this).find('.two_nav').hide(100);
				})
				$('.left_nav').hover(function() {
					$(this).find('.nav_mini').show(100);
				}, function() {
					$(this).find('.nav_mini').hide(100);
				})
				$('#jia').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
				})
				$('#jian').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
				})
				$('.Caddress .add_mi').click(function() {
					$(this).css('background', 'url("${ctx}/images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("${ctx}/images/mail.jpg") no-repeat')
					document.getElementById("end").href = ahref+this.id

				})
			})
			var x = Array();

			function func(a, b) {
				x[b] = a.html();
				alert(x)
				a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
			}

			function onclick_close() {
				var shade_content = $(".shade_content");
				var shade = $(".shade");
				if (confirm("确认关闭么！此操作不可恢复")) {
					shade_content.hide();
					shade.hide();
				}
			}

			function onclick_open() {
				$(".shade_content").show();
				$(".shade").show();
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() != "") {
						$(input_out[i]).val("");
					}
				}
			}

			function onclick_remove(r) {
				if (confirm("确认删除么！此操作不可恢复")) {
					var out_momey = $(".out_momey");
					var input_val = $(r).parent().prev().children().eq(1).val();
					var span_html = $(r).parent().prev().prev().children().html();
					var out_add = parseFloat(input_val).toFixed(2) * parseFloat(span_html).toFixed(2);
					var reduce = parseFloat(out_momey.html()).toFixed(2)- parseFloat(out_add).toFixed(2);
					console.log(parseFloat(reduce).toFixed(2));
					out_momey.text(parseFloat(reduce).toFixed(2))
					$(r).parent().parent().remove();
				}
			}
		</script>
		<script>
		function btnsubmit() {
			$.ajax({  
			    type: "POST",  
			    url: "${ctx}/user/addaddress",  
			    data:$('#addressform').serialize(),  
			    async: false,  
			    error: function(request) {  
			        alert("Connection error");  
			    },  
			    success: function(data) {  
			    	var shade_content = $(".shade_content");
			    	var shade = $(".shade");
			    	shade_content.hide();
					shade.hide();
						
					$("#add_address").append("<div class=\'add_mi\' id=\'"+data.id+"\'><p style=\'border-bottom:1px dashed #ccc;line-height:28px;\'>"+data.province+data.city+"("+data.recipients+"收)</p><p>"+data.area+"+ &nbsp;"+data.address +" &nbsp;"+data.phonenumber+"</p></div>");
					$('.Caddress .add_mi').click(function() {
						$(this).css('background', 'url("${ctx}/images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("${ctx}/images/mail.jpg") no-repeat')
						document.getElementById("end").href = ahref+this.id
					})
					var height = parseInt($(".Caddress").css("height"));
					$(".Caddress").css("height",height+20)
			    }  
			  });
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
                    <li class="active">USER</li>
                </ol>
            </div>
        </div>
        <div class="mybody" style="width:1000px;">
           <div class="Caddress" style="margin-left:200px">
			<div class="open_new">
				<button class="open_btn" onclick="javascript:onclick_open();">使用新地址</button>
			</div>
			<div id="add_address">
				<c:forEach items="${saddress }" var="a">
					<div class="add_mi" id="${a.id }">
					<p style="border-bottom:1px dashed #ccc;line-height:28px;">${a.province }${a.city }(${a.recipients }收)</p>
					<p>${a.area } &nbsp;${a.address } &nbsp;${a.phonenumber }</p>
					</div>
				</c:forEach>
			</div>
			
		</div>

		<!--
        	作者：z@163.com
        	时间：2016-03-04
        	描述：商品内容
        -->
		<div class="shopping_content" style="margin-left:200px">
			<div class="shopping_table">
				<table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>商品属性</th>
						<th>商品价格</th>
						<th>商品数量</th>
					</tr>
					<c:forEach items="${sessionScope.cart }" var="p">
					<tr>
						<td>
							<a><img src="${p.image1 }" /></a>
						</td>
						<td><span>${p.name }</span></td>
						<td>
							<div class="">
								<span id="">尺码</span>：<span>${p.size }</span>
							</div>
						</td>
						<td>
							<span class="span_momey">${p.price }</span>
						</td>
						<td>
							<span class="num">${p.number }</span>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<div class="div_outMumey" style="float: left;">
						总价：<span class="out_momey">${total }</span>
					</div>
					<a id="end" href="${ctx }/product/order?total=${total}&id=" onclick="return "><button class="btn_closing">结算</button></a>
				</div>
			</div>
		</div>

		<!--
        	作者：z@163.com
        	时间：2016-03-01
        	描述：shade 遮罩层
        -->
		<div class="shade">
		</div>
		<!--
        	作者：z@163.com
        	时间：2016-03-02
        	描述：shade_content
        -->
		<div class="shade_content" id="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<form id="addressform">
						<div class="col-xs-12">
							<span class="span_style" id="">省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</span>
							<select class="input_style"  name="province" id="region" onclick="change(2,this.value)">
								<c:forEach items="${province }" var="r">
									<option value="${r }">${r }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市</span>
							<select class="input_style" name="city" id="city" onclick="change(3,this.value)">							
							</select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县</span>
							<select class="input_style"  name="area" id="area">
							</select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">详细地址</span>
							<input class="input_style"  type="text" name="address" id="adress"/>
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">收&nbsp;&nbsp;货&nbsp;&nbsp;人</span>
							<input class="input_style"  type="text" name="recipients" id="name"/>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style"  type="text" name="phonenumber" id="phone"/>
							<input type="hidden" name="userid" value="${userid }">
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="button" class="sub_set" id="sub_setID" value="提交" onclick="btnsubmit()" />
						</div>
					</form>	
				</div>
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