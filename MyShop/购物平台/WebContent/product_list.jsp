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
	
	function clickall() {
		var clickall = document.getElementById("clickall");
		var checkboxs = document.getElementsByName("productid");
		if(clickall.checked==true) {
			for(var i=0;i<checkboxs.length;i++) {
			    checkboxs[i].checked=true;
			}
		}else if(clickall.checked==false){
			for(var i=0;i<checkboxs.length;i++) {
			    checkboxs[i].checked=false;
			}
		}
	}
	
	function asubmit() {
		var form = document.getElementById("deleteform");
		form.submit();
	}
</script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：商品管理</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
  		 <td width="5%" align="center" valign="middle" style="width:150px;">
         	<span><input type="checkbox" id="clickall" onclick="clickall()">全选</span>
         </td>
        
   		 <td width="85%" align="left" valign="middle">
   		  <form action="${ctx }/product/selectproduct" method="post">
	         <span>商品：</span>
	         	<input type="text" name="text" value="" id="select" class="text-word" placeholder="输入产品名进行查询">
	            <input name="" type="submit" value="查询" class="text-but">       
	       </form>  
         </td>
   		 
  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;"><a href="javascript:;" target="mainFrame" onFocus="this.blur()" class="add" onclick="asubmit()">批量删除</a></td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
      	<th align="center" valign="middle" class="borderright">选择</th>
        <th align="center" valign="middle" class="borderright">编号</th>
        <th align="center" valign="middle" class="borderright">名称</th>
        <th align="center" valign="middle" class="borderright">尺寸</th>
        <th align="center" valign="middle" class="borderright">类型</th>
        <th align="center" valign="middle" class="borderright">商品图片1</th>
        <th align="center" valign="middle" class="borderright">商品图片2</th>
        <th align="center" valign="middle" class="borderright">商品图片3</th>
        <th align="center" valign="middle" class="borderright">商品图片4</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <form action="${ctx }/product/querydelete" id="deleteform" method="post">  
      <input type="hidden" value="${page }"> 
      <c:forEach items="${product }" var="p">
      	<tr class="bggray" onMouseOut="this.style.backgroundColor='#f9f9f9'" onMouseOver="this.style.backgroundColor='#edf5ff'">
      	<td align="center" valign="middle" class="borderright borderbottom"><input type="checkbox" name="productid" value="${p.id }" ></td>
        <td align="center" valign="middle" class="borderright borderbottom">${p.id }</td>
        <td align="center" valign="middle" class="borderright borderbottom">${p.name }</td>
        <td align="center" valign="middle" class="borderright borderbottom">
        <select id="size" name="size">
          <c:forEach items="${p.size }" var="s">
          	<option value="${s }">${s }</option>
          </c:forEach>																	 
        </select></td>
        <td align="center" valign="middle" class="borderright borderbottom">${p.type }</td>
        <td align="center" valign="middle" class="borderright borderbottom"><img src="${p.image1 }" height="70" width="70"/></td>
        <td align="center" valign="middle" class="borderright borderbottom">已锁定</td>
        <td align="center" valign="middle" class="borderright borderbottom">已锁定</td>
        <td align="center" valign="middle" class="borderright borderbottom">已锁定</td>
        <td align="center" valign="middle" class="borderbottom"><a href="${ctx }/product/torevise?id=${p.id}" target="mainFrame" onFocus="this.blur()" class="add">编辑</a><span class="gray">&nbsp;|&nbsp;</span><a href="${ctx }/product/deleteproduct?productid=${p.id}&page=${page }" target="mainFrame" onFocus="this.blur()" class="add">删除</a></td>
      </tr>
      </c:forEach>
      </form>
    </table></td>
    </tr>
    <c:if test="${empty type }">
    	<tr id="page">
    	<td align="left" valign="top" class="fenye">10 条数据第${page } 页&nbsp;&nbsp;<a href="${ctx }/product/first?pagesize=${pagesize}" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;<a href="${ctx }/product/previou?pagesize=${pagesize}&page=${page}" target="mainFrame" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;<a href="${ctx }/product/next?pagesize=${pagesize}&page=${page}" target="mainFrame" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;<a href="${ctx }/product/last?pagesize=${pagesize}" target="mainFrame" onFocus="this.blur()">尾页</a></td>
  </tr>
    </c:if>
  
</table>
</body>
</html>