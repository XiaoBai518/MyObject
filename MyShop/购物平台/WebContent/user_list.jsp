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
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：用户管理</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>        
   		 <td width="90%" align="left" valign="middle">
   		  <form action="${ctx }/user/selectuser" method="post">
	         <span>商品：</span>
	         	<input type="text" name="text" value="" id="select" class="text-word" placeholder="输入用户名/邮箱进行查询">
	            <input name="" type="submit" value="查询" class="text-but">       
	       </form>  
         </td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">编号</th>
        <th align="center" valign="middle" class="borderright">姓名</th>
        <th align="center" valign="middle" class="borderright">邮箱</th>
        <th align="center" valign="middle" class="borderright">收货地址</th>
        <th align="center" valign="middle" class="borderright">订单</th>
        <th align="center" valign="middle">操作</th>
      </tr> 
      <c:forEach items="${user }" var="u">
      	<tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="center" valign="middle" class="borderright borderbottom">${u.id }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${u.username }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${u.email }</td>
        <td align="center" valign="middle" class="borderright borderbottom">
        <select id="shippingaddress" name="shippingaddress">
          <c:forEach items="${u.shippingaddress }" var="a">
          	<option value="${a }">${a }</option>
          </c:forEach>																	 
        </select></td>
        <td align="center" valign="middle" class="borderright borderbottom"><a target="mainFrame" onFocus="this.blur()" class="add">查看订单</a></td>
        <td align="center" valign="middle" class="borderbottom"><a href="${ctx }/product/deleteproduct?productid=${p.id}&page=${page }" target="mainFrame" onFocus="this.blur()" class="add">删除</a></td>
      </tr>
      </c:forEach>
    </table></td>
    </tr>  
    <c:if test="${empty type }">
    	<tr id="page">
    	<td align="left" valign="top" class="fenye">第${page } 页/共${sessionScope.pagenum }页&nbsp;&nbsp;<a href="${ctx }/user/first" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;<a href="${ctx }/user/previou?page=${page}" target="mainFrame" onFocus="this.blur()" onclick="return previousclick()">上一页</a>&nbsp;&nbsp;<a href="${ctx }/user/next?page=${page}" target="mainFrame" onFocus="this.blur()" onclick="return nextclick()">下一页</a>&nbsp;&nbsp;</td>
  </tr>
  </c:if>
  
</table>
</body>
</html>