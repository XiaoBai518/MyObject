<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理登录界面</title>
    <link href="${ctx }/css/alogin.css" rel="stylesheet" type="text/css" />
    <script>
    <c:if test="${not empty e_erro }">
		alert("您未注册")
 	</c:if>
	<c:if test="${not empty p_erro }">
		alert("密码不正确")
 	</c:if>
		<c:if test="${not empty p_erro }">
		alert("您不是管理员，没有权限进去后台")
 	</c:if>
    </script>
 	
</head>
<body>

    <form id="form1" runat="server" action="${ctx }/user/login" method="post">
    <div class="Main">
        <ul>
            <li class="top"></li>
            <li class="top2"></li>
            <li class="topA"></li>
            <li class="topB" ><span><img src="${ctx }/images/login/logo.gif" alt="" style="margin-top:40px;" /></span></li>
            <li class="topC"></li>
            <li class="topD">
                <ul class="login">
                    <li><span class="left login-text">用户名：</span> <span style="left">
                        <input id="Text1" type="text" class="txt" name="email"/>
                     
                    </span></li>
                    <li><span class="left login-text">密码：</span> <span style="left">
                       <input id="Text2" type="password" class="txt" name="password" />  
                    </span></li>
						
                </ul>
                <input type="hidden" value="managelogin" name="pageurl">
            </li>
            <li class="topE"></li>
            <li class="middle_A"></li>
            <li class="middle_B"></li>
            <li class="middle_C"><span class="btn"><input name="" type="image" src="${ctx }/images/login/btnlogin.gif" /></span></li>
            <li class="middle_D"></li>
            <li class="bottom_A"></li>
            <li class="bottom_B">网站后台管理系统&nbsp;&nbsp;</li>
        </ul>
    </div>
    </form>
</body>
</html>