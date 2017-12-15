<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
              <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
     <c:set var="pagesize" value="10" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="${ctx }/css/css.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/main.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/css/zui.min.css" rel="stylesheet">
		<script src="${ctx }/lib/jquery/jquery.js"></script>
		<script src="${ctx }/js/zui.js"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(${ctx }/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(${ctx }/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
th{text-align:center}
.bggray{ background:#f9f9f9}
</style>
<script>
	
</script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：订单详情</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr> 
   		 <td width="90%" align="left" valign="middle" height="40px">
   			<span style="font-size: 20px;font-weight: bold;color: #FFF;margin-left:20px;">订单详情</span>
         </td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">  
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">订单号</th>
        <th align="center" valign="middle" class="borderright">商品名称</th>
        <th align="center" valign="middle" class="borderright">商品样图</th>
        <th align="center" valign="middle" class="borderright">商品价格</th>
        <th align="center" valign="middle" class="borderright">商品数量</th>
        <th align="center" valign="middle" class="borderright">商品尺寸</th>
      </tr> 
      <c:forEach items="${orderdetails }" var="od">
      	<tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${od.orderid }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${od.p.name }</td>
        <td align="center" valign="middle" class="borderright borderbottom"><img src="${od.p.image1 }" height="70" width="70"></td>
        <td align="center" valign="middle" class="borderright borderbottom">${od.p.price }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${od.number }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${od.size }</td>
      </tr>
      </c:forEach>
    </table></td>
    </tr>
</table>
</body>
</html>