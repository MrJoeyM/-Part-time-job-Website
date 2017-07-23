<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>百耀-注册</title>
    
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta content="email=no" name="format-detection" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet">

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/compiled/layout.css">
    <link rel="stylesheet" type="text/css" href="css/compiled/elements.css">
    <link rel="stylesheet" type="text/css" href="css/compiled/icons.css">

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css">
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signup.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
   <script type="text/javascript">					
			function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			
			function r()
			{			
				var regForm = document.regForm;
				regForm.number.value = htmlEncode(regForm.number.value);   
				if(regForm.number.value == "" || regForm.number.value.indexOf(" ") > -1)
				{
					regForm.user.focus();
					return;
				}
				regForm.password1.value = htmlEncode(regForm.password1.value);
				if(regForm.password1.value == "")
				{
					regForm.password1.focus();
					return;
				}
				regForm.password2.value = htmlEncode(regForm.password2.value);
				if(regForm.password2.value == "")
				{
					regForm.password2.focus();
					return;
				}
				if(regForm.password1.value != regForm.password2.value)
				{
					alert("两次输入的密码不一致");
					regForm.password1.focus();
					return;
				}
				regForm.company.value = htmlEncode(regForm.company.value);
				if(regForm.company.value == "" || regForm.company.value.indexOf(" ") > -1)
				{
					regForm.company.focus();
					return;
				} 
				regForm.position.value = htmlEncode(regForm.position.value);
				if(regForm.position.value == "" || regForm.position.value.indexOf(" ") > -1)
				{
					regForm.position.focus();
					return;
				} 
				regForm.description.value = htmlEncode(regForm.description.value);
				if(regForm.description.value == "" || regForm.description.value.indexOf(" ") > -1)
				{
					regForm.description.focus();
					return;
				} 
				regForm.contact.value = htmlEncode(regForm.contact.value);
				if(regForm.contact.value == "" || regForm.contact.value.indexOf(" ") > -1)
				{
					regForm.contact.focus();
					return;
				} 
				regForm.action = "<%=path%>/servlet/SignServlet?from=signup2";
				regForm.submit();		
			}	
		</script>
</head>
<body background="img/bgs/10.jpg" style="width:100%;height:100%;">

    <div class="header">
        <a href="signin.jsp">
            <img src="img/logo.png" class="logo" />
        </a>
    </div>
    <div class="login-wrapper" style="margin-top:-30">
        <div class="box">
            <div class="content-wrap">
                <h6>注册</h6>
               <form name="regForm" action="" method="post">
               		<input class="form-control" name="number" type="text" placeholder="账号">
	                <input class="form-control" name="password1" type="password" placeholder="密码">
	                <input class="form-control" name="password2" type="password" placeholder="确认密码">
					<input class="form-control" name="company" type="text" placeholder="单位名称">
					<input class="form-control" name="contact" type="text" placeholder="联系方式">
					<input class="form-control" name="position" type="text" placeholder="单位详细地址">
					<input class="form-control" name="description" type="text" placeholder="单位简介">
					<%if(session.getAttribute("error") != null){
	                	String error = (String)session.getAttribute("error");
	                 %>
	                 <label><%=error %></label><br>
					<%} %>
	                <div class="action">
	                    <a class="btn-glow primary signup"  onclick="r()">注册</a>
	                </div> 
               </form>               
            </div>
        </div>

        <div class="already" style="margin-top:18">
            <p>已有账号？</p>
            <a href="signin.jsp">登录</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>
</body>
</html>
