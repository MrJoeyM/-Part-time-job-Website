<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	String username = "";
	String password = "";
	
	//获取当前站点的所有Cookie
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0;i < cookies.length;i++)
		{
			if("username".equals(cookies[i].getName()))
			{
				username = cookies[i].getValue();
			}else if("password".equals(cookies[i].getName()))
			{
				password = cookies[i].getValue();
			}
		}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百耀-登录</title>

<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<meta content="email=no" name="format-detection" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet">

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/compiled/layout.css">
<link rel="stylesheet" type="text/css" href="css/compiled/elements.css">
<link rel="stylesheet" type="text/css" href="css/compiled/icons.css">

<!-- libraries -->
<link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css">

<!-- this page specific styles -->
<link rel="stylesheet" href="css/compiled/signin.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<script type="text/javascript">
			function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			function login()
			{
				var loginForm = document.loginForm;
				loginForm.number.value = htmlEncode(loginForm.number.value);
				if(loginForm.number.value == "" || loginForm.number.value.indexOf(" ") > -1)
				{
					loginForm.number.focus();
					return;
				}
				loginForm.password.value = htmlEncode(loginForm.password.value);
				if(loginForm.password.value == "" || loginForm.password.value.indexOf(" ") > -1)
				{
					loginForm.password.focus();
					return;
				}
				loginForm.checkCode.value = htmlEncode(loginForm.checkCode.value);
				if(loginForm.checkCode.value == "" || loginForm.checkCode.value.indexOf(" ") > -1)
				{
					loginForm.checkCode.focus();
					return;
				}
				loginForm.action = "<%=path%>/servlet/SignServlet?from=signin";
				loginForm.submit();

	}

	function reload() {
	  document.getElementById("CreateCheckCode").src = document  
            .getElementById("CreateCheckCode").src  
            + "?nocache=" + new Date().getTime();
	}
</script>
</head>
<body>

	<div class="bg">
		<img src="img/bgs/landscape.jpg" style="width:100%;height:100%;">
	</div>

	<div class="login-wrapper">
		<a href="index.jsp"> <img class="logo" src="img/logo-white.png">
		</a>

		<div class="box" style="margin-top:-1px">
			<div class="content-wrap">
				<h6>登录</h6>
				<form action="" name="loginForm" method="post">
					<input class="form-control" name="number" type="text" value="<%=username %>"
						placeholder="账号"> 
						<input class="form-control"
						name="password" type="password" value="<%=password %>"
						placeholder="密码"> 
						<input
						name="checkCode" class="form-control" type="text"
						placeholder="验证码输入"> 
						<img src="servlet/CheckPicture" id="CreateCheckCode" align="left" onclick="reload()"><br>
						 <a
						style="cursor:pointer;" onclick="reload()"> 看不清,换一个</a><br><br>
						<div class="remember">
		                <%if(!username.equals("") && !password.equals("")){ %>
		                    <input name="isRemember" id="remember-me" type="checkbox" checked/>
		                <%}else{ %>
		                	<input name="isRemember" id="remember-me" type="checkbox"/>
		                <%} %>
		                    <label for="remember-me">记住密码</label>
		                </div>
						<%
							if (session.getAttribute("error") != null) {
								String error = (String) session.getAttribute("error");
						%>
						<label><%=error%></label><br>
						<%
							}
						%>
					<a  class="btn-glow primary login" onclick="login()">登录</a>
				</form>
			</div>
		</div>

		<div class="no-account" style="margin-top:-1px">
			<p>还没账号?</p>
			<a href="signup.jsp">用户注册 </a>&nbsp;<a href="signup2.jsp">商户注册</a>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>

</body>
</html>