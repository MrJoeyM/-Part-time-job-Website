<%@ page language="java" import="java.util.*"
	import="com.baiyaotech.bean.*" pageEncoding="utf-8"
	contentType="text/html; charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	request.setCharacterEncoding("utf-8");
	Employer employer = null;
	ArrayList<JobInfo> jobList = null;
	if (session.getAttribute("user2") != null) {
		employer = (Employer) session.getAttribute("user2");
	}
	if (session.getAttribute("jobInfo2") != null) {
		jobList = (ArrayList<JobInfo>) session.getAttribute("jobInfo2");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百耀-单位主页</title>

<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
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
<link href="css/bootstrap/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet">

<!-- libraries -->
<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/compiled/layout.css">
<link rel="stylesheet" type="text/css" href="css/compiled/elements.css">
<link rel="stylesheet" type="text/css" href="css/compiled/icons.css">

<!-- this page specific styles -->
<link rel="stylesheet" href="css/compiled/user-profile.css"
	type="text/css" media="screen" />
<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<script type="text/javascript">
	function out() {
		window.location.href = "signin.jsp";
	}

	function register() {
		window.location.href = "signup2.jsp";
	}
	function reply(param) {
		document.getElementById("main").style.opacity = 0.3;
		document.getElementById("form"+param).style.display = "block";
	}

	function exit(param) {
		document.getElementById("main").style.opacity = 1;
		document.getElementById("form"+param).style.display = "none";
	}
	
	function reply2(param) {
		document.getElementById("main").style.opacity = 0.3;
		document.getElementById("formu"+param).style.display = "block";
	}

	function exit2(param) {
		document.getElementById("main").style.opacity = 1;
		document.getElementById("formu"+param).style.display = "none";
	}
</script>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>
	<div id="main">
		<header class="navbar navbar-inverse" role="banner">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				id="menu-toggler">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="publish.jsp"><img src="img/logo.png"></a>
		</div>
		<ul class="nav navbar-nav pull-right hidden-xs">

			<li class="settings hidden-xs hidden-sm"><a
				href="<%=path%>/servlet/PerInfoServlet?person=employer"
				role="button"> <i class="icon-cog"></i> </a>
			</li>
			<li class="settings hidden-xs hidden-sm"><a
				style="cursor: pointer;" onclick="out()" role="button"> <i
					class="icon-share-alt"></i> </a>
			</li>
		</ul>
		</header>
		<!-- end navbar -->

		<!-- sidebar -->
		<div id="sidebar-nav">
			<ul id="dashboard-menu">
				<li><a href="publish.jsp"> <i class="icon-home"></i> <span>信息发布</span>
				</a>
				</li>
				<li class="active">
					<div class="pointer">
						<div class="arrow"></div>
						<div class="arrow_border"></div>
					</div> <a href="<%=path%>/servlet/PerInfoServlet?person=employer"> <i
						class="icon-group"></i> <span>发布历史</span> </a>
				</li>
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

			<div id="pad-wrapper" class="user-profile">
				<!-- header -->
				<div class="row header">
					<div class="col-md-8">
						<img src="img/company.png" class="avatar img-circle">
						<%
							if (employer != null) {
						%>
						<h3 class="name"><%=employer.getCompany()%></h3>
						<span class="area"><%=employer.getPosition()%></span>
						<%
							} else {
						%>
						<h3 class="name">null</h3>
						<span class="area">null</span>
						<%
							}
						%>
					</div>

				</div>

				<div class="row profile">
					<!-- bio, new note & orders column -->
					<div class="col-md-9 bio">
						<div class="profile-box">
							<!-- biography -->
							<div class="col-md-12 section">
								<%
									if (employer != null) {
								%>
								<h6>单位简介</h6>
								<p><%=employer.getDescription()%></p>
								<%
									} else {
								%>
								<h6>单位简介</h6>
								<p>null</p>
								<%
									}
								%>
							</div>

							<h6>已发布兼职</h6>
							<br>
							<!-- recent orders table -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="col-md-1"><span class="line"></span>兼职内容</th>
										<th class="col-md-1"><span class="line"></span>地点</th>
										<th class="col-md-1"><span class="line"></span> 人数</th>
										<th class="col-md-2"><span class="line"></span> 薪酬</th>
										<th class="col-md-2"><span class="line"></span> 审核状态</th>
										<th class="col-md-2"><span class="line"></span> 查看详情</th>
										<th class="col-md-2"><span class="line"></span>兼职人员</th>
									</tr>
								</thead>
								<tbody>
									<!-- row -->
									<%
										if (jobList != null) {
											for (int i = 0; i < jobList.size(); i++) {
									%>
									<tr class="first">
										<td><%=jobList.get(i).getJobTitle()%></td>
										<td><%=jobList.get(i).getPosition()%></td>
										<td><%=jobList.get(i).getSurplus()%>/<%=jobList.get(i).getTotal()%></td>
										<td><%=jobList.get(i).getPrice()%></td>
										<td><%=jobList.get(i).getChecked()%></td>
										<td><form name="idForJob" action="" method="post">
											<a onclick="reply(<%=i %>)"  class="btn-flat success pull-right">查看详情</a>
											<input type="text" name="idFor" value="<%=jobList.get(i).getJobId() %>" style="display:none">
										</form>
										</td>
										<td>
											<form name="idForJob2" action="" method="post">
											<a onclick="reply2(<%=i %>)"  class="btn-flat success pull-right">兼职人员</a>
											<input type="text" name="idFor" value="<%=jobList.get(i).getJobId() %>" style="display:none">
											</form>
										</td>
									</tr>
									<%
										}
										}
									%>
								</tbody>
							</table>

							<!-- new comment form -->

						</div>
					</div>

					<!-- side address column -->
					<div class="col-md-3 col-xs-12 address pull-right">
						<ul>
							<%
								if (employer != null) {
							%>
							<li><%=employer.getPosition()%></li>
							<li class="ico-li"><i class="ico-phone"></i> <%=employer.getContact()%></li>
							<li class="ico-li"><i class="ico-mail"></i> <a>还未添加邮箱</a> <%
							 	} else {
							 %>
							
							<li>null</li>
							<li class="ico-li"><i class="ico-phone"></i>null</li>
							<li class="ico-li"><i class="ico-mail"></i> <a href="#">null</a>
								<%
									}
								%>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end main container -->
	<%
		if (jobList != null) {
		for (int i = 0; i < jobList.size(); i++) {
	%>
	<div class="modal-dialog" id="form<%=i %>"
		style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					onclick="exit(<%=i %>)" type="button">×</button>
				<h4 class="modal-title">兼职详情</h4>
			</div>
			<div class="modal-body">

				<form name="publishForm" action="" method="post"
					class="form-horizontal" role="form">
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-5 control-label">兼职类型：</label>
						<div class="col-lg-10" style="position:absolute;top:5%;left:25%">
							<%=jobList.get(i).getCategory() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼值人数：</label>
						<div class="col-lg-10" style="position:absolute;top:12%;left:25%">
						<%=jobList.get(i).getSurplus() %>/<%=jobList.get(i).getTotal() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼职要求：</label>
						<div class="col-lg-10" style="position:absolute;top:20%;left:25%">
						<%=jobList.get(i).getDescription() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">发布机构：</label>
						<div class="col-lg-10" style="position:absolute;top:27%;left:25%">
						<%=employer.getCompany() %>
						</div>
					</div>
					<hr/>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼职时间：</label>
						<div class="col-lg-10" style="position:absolute;top:39%;left:25%">
						<%=jobList.get(i).getTime() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作时长：</label>
						<div class="col-lg-10" style="position:absolute;top:46%;left:25%">
						<%=jobList.get(i).getDuration() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作地点：</label>
						<div class="col-lg-10" style="position:absolute;top:53%;left:25%">
						<%=jobList.get(i).getLocation() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">保证金：</label>
						<div class="col-lg-10" style="position:absolute;top:60%;left:25%">
						<%=jobList.get(i).getBond() %>
						</div>
					</div>
					<hr/>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作内容：</label>
						<div class="col-lg-10" style="position:absolute;top:73%;left:25%">
						<%=jobList.get(i).getJobTitle() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">联系方式：</label>
						<div class="col-lg-10" style="position:absolute;top:80%;left:25%">
						<%=jobList.get(i).getContact() %>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button onclick="exit(<%=i %>)" type="submit"
								class="btn btn-primary  col-lg-offset-3" style="margin-top:5px;">确定</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%}} %>
	
	<%
		for (int i = 0; i < jobList.size(); i++) {
			if(session.getAttribute("employees"+i) != null)
			{
				ArrayList<Employee> employees = (ArrayList<Employee>)session.getAttribute("employees"+i);
	%>
	<div class="modal-dialog" id="formu<%=i %>"
		style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					onclick="exit2(<%=i %>)" type="button">×</button>
				<h4 class="modal-title">兼职人员</h4>
			</div>
			<div class="modal-body">

				<form name="publishForm" action="" method="post"
					class="form-horizontal" role="form">
						<%
							if(employees != null){
							for(int j = 0 ;j < employees.size() ;j++){		
					 	%>
							<div class="form-group">
								<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">用户账号：</label>
								<div class="col-lg-10" style="position:absolute;top:13%;left:25%">
								<%=employees.get(j).getEmployeeId() %>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">联系方式：</label>
								<div class="col-lg-10" style="position:absolute;top:30%;left:25%">
								<%=employees.get(j).getContact() %>
								</div>
							</div>
							<hr/>
						<%}}%>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button onclick="exit2(<%=i %>)" type="submit"
								class="btn btn-primary  col-lg-offset-3" style="margin-top:5px;">确定</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%}}%>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>