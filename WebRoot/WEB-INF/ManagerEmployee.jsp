<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=gbk"%>
<%@ page import="com.baiyaotech.bean.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	ArrayList<JobRecord> informations = null;
	if(session.getAttribute("informations") != null){
		informations = (ArrayList<JobRecord>)session.getAttribute("informations");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百耀-用户管理页面</title>

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
<!-- bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet">

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/compiled/layout.css">
<link rel="stylesheet" type="text/css" href="css/compiled/elements.css">
<link rel="stylesheet" type="text/css" href="css/compiled/icons.css">

<!-- libraries -->
<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- this page specific styles -->
<link rel="stylesheet" href="css/compiled/user-list.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>
	<!-- navbar -->
	<div id="main">
		<header class="navbar navbar-inverse" role="banner">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				id="menu-toggler">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"><img
				src="img/logo.png">
			</a>
		</div>
		</header>
		<!-- end navbar -->
		
		<!-- end sidebar -->
		<div class="content">

			<!-- settings changer -->
			<div class="skins-nav">
				<a href="#" class="skin first_nav selected"> <span class="icon"></span><span
					class="text">默认皮肤</span> </a> <a href="#" class="skin second_nav"
					data-file="css/compiled/skins/dark.css"> <span class="icon"></span><span
					class="text">深色皮肤</span> </a>
			</div>

			<div id="pad-wrapper" class="users-list">
				<div class="row header">
					<h3>管理兼职用户</h3>
				</div>

				<!-- Users table -->
				<div class="row">
					<div class="col-md-6">
						<table class="table table-hover">
							<thead>
								<tr>

									<th class="col-md-1 sortable"><span class="line"></span>
										用户账号</th>
									<th class="col-md-1 sortable"><span class="line"></span>所在学校
									</th>
									<th class="col-md-2 sortable"><span class="line"></span>联系方式
									</th>
									<th class="col-md-2 sortable"><span class="line"></span>兼职记录
									</th>
									<th class="col-md-2 sortable"><span class="line"></span>兼职地点
									</th>
									<th class="col-md-2 sortable"><span class="line"></span>兼职单位
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->

								<%
									if(informations != null){
									  Employee employee = informations.get(0).getEmployee();;
								  %>
								  <tr>
								  		<td><%=informations.get(0).getEmployee().getEmployeeId()%></td>
										<td><%=informations.get(0).getEmployee().getUniversity()%></td>
										<td><%=informations.get(0).getEmployee().getContact() %></td>
										<td><%=informations.get(0).getJobInfo().getJobTitle()%></td>
										<td><%=informations.get(0).getJobInfo().getPosition()%></td>
										<td><%=informations.get(0).getJobInfo().getCompany()%></td>
								  </tr>
								  <%  
								  	for(int i = 1;i < informations.size();i++){
								     		if(employee.getEmployeeId().equals(informations.get(i).getEmployee().getEmployeeId())){      
								 	%>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td><%=informations.get(i).getJobInfo().getJobTitle()%></td>
										<td><%=informations.get(i).getJobInfo().getPosition()%></td>
										<td><%=informations.get(i).getJobInfo().getCompany()%></td>
									</tr>
								<%}else{ 
									employee = informations.get(i).getEmployee();
								%>
									<tr>
										<td><%=informations.get(i).getEmployee().getEmployeeId()%></td>
										<td><%=informations.get(i).getEmployee().getUniversity()%></td>
										<td><%=informations.get(i).getEmployee().getContact() %></td>
										<td><%=informations.get(i).getJobInfo().getJobTitle()%></td>
										<td><%=informations.get(i).getJobInfo().getPosition()%></td>
										<td><%=informations.get(i).getJobInfo().getCompany()%></td>
									</tr>
								<%
									}} }
								%>

							</tbody>
						</table>
					</div>
				</div>
				<!-- end users table -->
			</div>
		</div>
	</div>
	<!-- end main container -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>