<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百耀-发布兼职</title>

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


<!-- bootstrap -->
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
<link rel="stylesheet" href="css/compiled/new-user.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link rel="stylesheet" href="css/cityselect.css" type="text/css">
<script src="js/cityselect.js"></script>
<script type="text/javascript">
			function out()
			{
				window.location.href="signin.jsp";
			}
    		
    		function register()
			{
				window.location.href="signup2.jsp";
			}
</script>
</head>
<body>
	<!-- navbar -->
	<header class="navbar navbar-inverse" role="banner">
	<div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse"
			id="menu-toggler">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="publish.jsp"><img src="img/logo.png">
		</a>
	</div>
	<ul class="nav navbar-nav pull-right hidden-xs">

		<li class="settings hidden-xs hidden-sm"><a
			href="<%=path%>/servlet/PerInfoServlet?person=employer" role="button">
				<i class="icon-cog"></i> </a></li>
		<li class="settings hidden-xs hidden-sm"><a
			style="cursor: pointer;" onclick="out()" role="button"> <i
				class="icon-share-alt"></i> </a></li>
	</ul>
	</header>
	<!-- end navbar -->

	<!-- sidebar -->
	<div id="sidebar-nav">
		<ul id="dashboard-menu">
			<li class="active">
				<div class="pointer">
					<div class="arrow"></div>
					<div class="arrow_border"></div>
				</div> <a href="publish.jsp"> <i class="icon-home"></i> <span>信息发布</span>
			</a></li>
			<li>
				<div class="pointer"></div> <a
				href="<%=path%>/servlet/PerInfoServlet?person=employer"> <i
					class="icon-group"></i> <span>发布历史</span> </a></li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-share-alt"></i> <span>其他</span> <i
					class="icon-chevron-down"></i> </a>
				<ul class="submenu">
					<li><a style="cursor: pointer;" onclick="out()">注销</a>
					</li>
					<li><a style="cursor: pointer;" onclick="register()">注册</a>
					</li>
				</ul></li>
		</ul>
	</div>
	<!-- end sidebar -->


	<!-- main container -->
	<div class="content">

		<!-- settings changer -->
		<div class="skins-nav">
			<a href="#" class="skin first_nav selected"> <span class="icon"></span><span
				class="text">默认皮肤</span> </a> <a href="#" class="skin second_nav"
				data-file="css/compiled/skins/dark.css"> <span class="icon"></span><span
				class="text">深色皮肤</span> </a>
		</div>

		<div id="pad-wrapper" class="new-user">
			<div class="row header">
				<div class="col-md-12">
					<h3>发布新兼职</h3>
				</div>
			</div>

			<div class="row form-wrapper">
				<!-- left column -->
				<div class="col-md-9 with-sidebar">
					<div class="container">
						<form name="publishForm" action="" method="post"
							class="new_user_form">
							<div class="col-md-12 field-box">
								<label>工作类别：</label> <label> <input type="radio"
									name="category" value="兼职" checked />兼职</label> <label><input
									type="radio" name="category" value="实习" />实习</label> <label><input
									type="radio" name="category" value="校园代理" />校园代理</label>
							</div>
							<div class="col-md-12 field-box">
								<label>兼职简介：</label> <input name="jobTitle" class="form-control"
									type="text" placeholder="简单描述即可" />
							</div>
							<div class="col-md-12 field-box">
								<label>工作时间：</label> <input name="time"
									class="col-md-9 form-control" type="text"
									placeholder="开始时间至结束时间、或长期" />
							</div>
							<div class="col-md-12 field-box">
								<label>兼职地点：</label>
								<jsp:include page="position.jsp"></jsp:include>
							</div>
							<div class="col-md-12 field-box">
								<label>具体地址：</label> <input name="location"
									class="col-md-9 form-control" id="citySelect" type="text"
									placeholder="请尽量细致地填写" />
							</div>
							<div class="col-md-12 field-box">
								<label>联系方式：</label> <input name="contact"
									class="col-md-9 form-control" type="text" placeholder="请填写以供用户联系" />
							</div>
							<div class="col-md-12 field-box">
								<label>所需人数：</label> <input name="surplus"
									class="col-md-9 form-control" type="text" placeholder="请输入数字" />
							</div>
							<div class="col-md-12 field-box">
								<label>薪&nbsp;&nbsp;酬：</label> <input name="price"
									class="col-md-1 form-control" type="text" placeholder="请输入价格" />
								<label style="margin-top:15;"><input type="radio"
									name="meta" value="元/小时" checked />元/小时</label> <label
									style="margin-top:15;"><input type="radio" name="meta"
									value="元/天" />元/天</label> <label style="margin-top:15;"><input
									type="radio" name="meta" value="元/月" />元/月</label> <label
									style="margin-top:15;"><input type="radio" name="meta"
									value="元/年" />元/年</label>
							</div>
							<div class="col-md-12 field-box">
								<label>保  证  金：</label><label><input type="radio" name="bond"
									value="不需要" checked/>不需要</label> <label><input
									type="radio" name="bond" value="需要" />需要</label>
							</div>
							<div class="col-md-12 field-box">
								<label>工作时长：</label> <input name="duration"
									class="col-md-9 form-control" type="text" placeholder="每天工作时长" />
							</div>
							<div class="col-md-12 field-box textarea" style="margin-top:10;">
								<label>备&nbsp;&nbsp;注:</label>
								<textarea name="description" class="col-md-9"
									placeholder="可填写额外要求，如没有请填：无"></textarea>
								<span class="charactersleft">请保证在50字以内</span>
							</div>
							<div class="col-md-11 field-box actions"
								style="text-align: center;vertical-align:middle;margin-top:10;">
								<a class="btn btn-default" onclick="publish()">发布</a> <input type="reset" value="重置"
									class="reset">
							</div>
						</form>
					</div>
				</div>

				<!-- side right column -->
				<div class="col-md-3 form-sidebar pull-right">
					<div class="alert alert-info hidden-tablet">
						<i class="icon-lightbulb pull-left"></i> 发布兼职信息后，需要经过审核，请您耐心等待。
					</div>
					<div class="alert alert-info hidden-tablet">
						<i class="icon-lightbulb pull-left"></i>
						请发布真实的兼职信息，如存在欺诈，将被封号并承担相应法律责任。
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end main container -->


	<!-- scripts -->
	<script type="text/javascript">	
    			   				
			function htmlEncode ( str ) {  
			  var ele = document.createElement('span');  
			  ele.appendChild( document.createTextNode( str ) );  
			  return ele.innerHTML;  
			}
			
			function publish()
			{	
				
				var regForm = document.publishForm;
				regForm.category.value = htmlEncode(regForm.category.value);   
				if(regForm.category.value == "" || regForm.category.value.indexOf(" ") > -1)
				{
					regForm.category.focus();
					return;
				}
				regForm.jobTitle.value = htmlEncode(regForm.jobTitle.value);   
				if(regForm.jobTitle.value == "" || regForm.jobTitle.value.indexOf(" ") > -1)
				{
					regForm.jobTitle.focus();
					return;
				}
				regForm.time.value = htmlEncode(regForm.time.value);
				if(regForm.time.value == "")
				{
					regForm.time.focus();
					return;
				}
				regForm.location.value = htmlEncode(regForm.location.value);
				if(regForm.location.value == "")
				{
					regForm.location.focus();
					return;
				}
				regForm.contact.value = htmlEncode(regForm.contact.value);
				if(regForm.contact.value == "")
				{
					regForm.contact.focus();
					return;
				}
 				regForm.surplus.value = htmlEncode(regForm.surplus.value);
				if(regForm.surplus.value == "")
				{
					regForm.surplus.focus();
					return;
				}
				if (regForm.surplus.value.match(/^[0-9].*$/))   
				{   
						
				}    
				else    
				{   
					alert("请填写数字！");
					regForm.surplus.focus();
					return;
				}
				regForm.price.value = htmlEncode(regForm.price.value);
				if(regForm.price.value == "")
				{
					regForm.price.focus();
					return;
				}
				regForm.duration.value = htmlEncode(regForm.duration.value);
				if(regForm.duration.value == "")
				{
					regForm.duration.focus();
					return;
				}
				regForm.description.value = htmlEncode(regForm.description.value);
				if(regForm.description.value == "")
				{
					regForm.description.focus();
					return;
				}
				regForm.action = "<%=path%>/servlet/PublishServlet";
				regForm.submit();
		}
		 $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
	</script>
</body>
</html>
