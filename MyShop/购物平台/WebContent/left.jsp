<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link href="${ctx }/css/houtaicss.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx }/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
<div id="left-top">
	<div><img src="${ctx }/images/main/member.gif" width="44" height="44" /></div>
    <span>用户：admin<br>角色：超级管理员</span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>系统设置</span>
        <a href="main.html" target="mainFrame" onFocus="this.blur()">后台首页</a>
        <a href="main_list.html" target="mainFrame" onFocus="this.blur()">列表页</a>
        <a href="main_info.html" target="mainFrame" onFocus="this.blur()">列表详细页</a>
        <a href="main_message.html" target="mainFrame" onFocus="this.blur()">留言页</a>
        <a href="main_menu.html" target="mainFrame" onFocus="this.blur()">栏目管理</a>
      </div>
      <div>
        <span>商品管理</span>
        <a href="add_product.jsp" target="mainFrame" onFocus="this.blur()">添加商品</a>
        <a href="${ctx }/product/first?pagesize=10" target="mainFrame" onFocus="this.blur()">删除商品</a>
        <a href="${ctx }/product/first?pagesize=10" target="mainFrame" onFocus="this.blur()">修改商品</a>
      </div>
      <div>
        <span>用户设置</span>
        <a href="add_user.jsp" target="mainFrame" onFocus="this.blur()">添加管理员</a>
        <a href="${ctx }/user/first" target="mainFrame" onFocus="this.blur()">用户列表</a>
      </div>
      <div>
        <span>订单设置</span>
        <a href="${ctx }/product/firstorders?pagesize=10" target="mainFrame" onFocus="this.blur()">管理订单</a>
      </div>
    </div>
</body>
</html>