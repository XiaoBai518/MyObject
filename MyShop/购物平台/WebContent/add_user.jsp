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
<link href="${ctx}/css/zui.min.css" rel="stylesheet">
		<script src="${ctx }/lib/jquery/jquery.js"></script>
		<script src="${ctx }/js/zui.js"></script>
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
            var istrue = new Array(0,0,0);
            
        	function submitform() {
        		for(var i=0;i<3;i++) {
            		if(istrue[i]!=0) {
            			alert("有项填写错误");
            			return false;
            		}
            	}    	
        		var formdata = new FormData(document.getElementById('userform') );
        		$.ajax({  
        		    type: "post",  
        		    url: "${ctx}/user/addmanager",  
        		    data:formdata, 
        		    processData:false,
                    contentType:false,
                    error: function() {
                    	 alert("AJAX错误")
                    	   },
        		    success: function(info) {  
        		    	new $.zui.Messager('成功添加管理员', {
							 type: 'success',
							 placement: 'top' // 定义显示位置
						}).show();
        		    	document.getElementById('userform').reset();
        		    	document.getElementById('E_li_suucess').style.display='none';
        		    	document.getElementById('m1_li_suucess').style.display='none';
            			document.getElementById('m2_li_suucess').style.display='none';
            			document.getElementById('xing_li_suucess').style.display='none';
            			
        		    }  
        		  });
        	}
            
            
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
            </script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：用户管理&nbsp;&nbsp;>&nbsp;&nbsp;添加管理员</td>
  </tr>
  <tr>
    <td align="left" valign="top" id="addinfo">
    <a href="add.html" target="mainFrame" onFocus="this.blur()" class="add">新增管理员</a>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <form id="userform" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>用户姓名：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="username"  value="" class="text-word" onblur="textblur(this,'姓','xing')" onfocus="textfocus('xing')">
        <i id="xing_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i>
  		<span id="xing_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  		<span id="xing_tip" style="color:#FF5151"></span></span>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>用户邮箱：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="email" value="" class="text-word" onblur="textblur(this,'邮箱','E')" onfocus="textfocus('E')">
        <i id="E_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i>
		<span id="E_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  		<span id="E_tip" style="color:#FF5151"></span></span>
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>用户密码：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="password" id="password" name="password" value="" class="text-word" onblur="validate()" onfocus="textfocus('m1')">
        <i id="m1_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i>
		<span id="m1_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="m1_tip" style="color:#FF5151"></span></span>
        </td>
      </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray"><font size="6">*</font>确认用户密码：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
       <input type="password" id="password2" value="" class="text-word" onblur="validate()" onfocus="textfocus('m2')">
       <i id="m2_li_suucess" class="icon icon-check-circle icon-2x" style="color:green;display: none"></i>
	   <span id="m2_li" style="display: none"><i class="icon icon-exclamation-sign icon-2x" style="color:#FF5151"></i>
  						<span id="m2_tip" style="color:#FF5151"></span></span>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">手机号：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="phonenumber" value="" class="text-word">
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