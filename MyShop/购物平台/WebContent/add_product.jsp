<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="${ctx }/css/houtaicss.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/main.css" type="text/css" rel="stylesheet" />
<script src="${ctx }/js/jquery-2.1.4.min.js"></script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(${ctx }/images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(${ctx }/images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF}
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
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #cdcdcd; background:#e6e6e6; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#969696; float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
#addinfo a{ font-size:14px; font-weight:bold; background:url(${ctx }/images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(${ctx }/images/main/addinfoblue.jpg) no-repeat 0 1px;}
.size{height:15px;width:15px }

</style>
<script>

	function submitform() {
		var formdata = new FormData(document.getElementById('productform') );
		$.ajax({  
		    type: "post",  
		    url: "${ctx}/product/addproduct",  
		    data:formdata, 
		    processData:false,
            contentType:false,
            error: function() {
            	 alert("AJAX错误")
            	   },
		    success: function(data) {  
		    	alert(data)
		    	document.getElementById('productform').reset();
		    }  
		  });
	}
</script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：商品管理&nbsp;&nbsp;>&nbsp;&nbsp;添加商品</td>
  </tr>
  <tr>
    <td align="left" valign="top" id="addinfo">
    <a href="add.html" target="mainFrame" onFocus="this.blur()" class="add">新增商品</a>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="productform" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>商品名称：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="name" id="name" value="" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>商品价格：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="price" value="" class="text-word">
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>商品描述：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <textarea name="description" value="" class="text-word" style="height:60px;width:288px"></textarea>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>商品图片：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="file" name="upfile" id="upfile"/>
        </td>
      </tr>  
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">商品图片2：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="file" name="upfile" id="upfile"/>
        </td>
      </tr>
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">商品图片3：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="file" name="upfile" id="upfile"/>
        </td>
      </tr>
       <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">商品图片4：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <input type="file" name="upfile" id="upfile"/>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>类型选择：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="type" id="type">
	    <option value="男士跑鞋" >&nbsp;&nbsp;男士跑鞋</option>
	    <option value="女士跑鞋" >&nbsp;&nbsp;女士跑鞋</option>
	    <option value="童鞋" >&nbsp;&nbsp;童鞋</option>
        </select>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>尺寸选择：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="35">35</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="36">36</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="37">37</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="38">38</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="39">39</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="40">40</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="41">41</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="42">42</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="43">43</span>
        <span name="size_font" style="font-size: 17px"><input type="checkbox" name="sizename" id="size" value="44">44</span>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="button" value="提交" class="text-but" onclick="submitform()">
        <input name="" type="reset" value="重置" class="text-but"></td>
        </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
</html>