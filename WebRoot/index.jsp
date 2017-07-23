<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=gbk"%>
<%@ page import="com.baiyaotech.bean.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	ArrayList<JobInfo> jobs = null;
	if(session.getAttribute("jobs") != null){
		jobs = (ArrayList<JobInfo>)session.getAttribute("jobs");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>百耀-首页</title>

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
<script language="JavaScript">	
	function reply(param) {
		document.getElementById("main").style.opacity = 0.3;
		document.getElementById("form"+param).style.display = "block";
	}

	function exit(param) {
		document.getElementById("main").style.opacity = 1;
		document.getElementById("form"+param).style.display = "none";
	}
	
	function searchJob(){
		var JobForm = document.JobForm;
		if(JobForm.jobType.value == "")
		{
			JobForm.jobType.focus();
			return;
		}
		JobForm.action = "<%=path%>/servlet/SearchJob";
		JobForm.submit();
	}
</script>
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
			<a class="navbar-brand" href="<%=path%>/servlet/GetJob"><img
				src="img/logo.png">
			</a>
		</div>
		<ul class="nav navbar-nav pull-right hidden-xs">

			<li class="settings hidden-xs hidden-sm"><a
				href="<%=path %>/servlet/GetRecord" style="cursor:pointer;" role="button"> <i
					class="icon-cog"></i> </a></li>
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
					</div> <a href="servlet/GetJob"> <i class="icon-home"></i>
						<span>招募信息</span> </a></li>
				<li>
					<div class="pointer"></div> <a href="<%=path %>/servlet/GetRecord" style="cursor:pointer;">
						<i class="icon-group"></i> <span>我的工作</span> </a></li>
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
					<h3>招募信息</h3>
					
					<div class="col-md-10 col-sm-12 col-xs-12 pull-right">
						<div class="ui-dropdown">
						
                        <div class="head" data-toggle="tooltip" title="点我!!!"  style="margin-left:100px;">
                            	工作类型
                            <i class="arrow-down"></i>
                        </div>  
                        
                        <div class="dialog">
                            <div class="pointer">
                                <div class="arrow"></div>
                                <div class="arrow_border"></div>
                            </div>
                            <div class="body">
                                <p class="title">
                                   	可选工作类型
                                </p>
                                <div class="form">
                                	<form name="JobForm" method="post" action="">
	                                    <select name="jobType">
	                                        <option>兼职</option>
	                                        <option>实习</option>
	                                        <option>校园代理</option>
	                                    </select>
	                                    <a class="btn-flat small" onclick="searchJob()">搜索工作</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
               
						<!-- custom popup filter -->
						<!-- styles are located in css/elements.css -->
						<!-- script that enables this dropdown is located in js/theme.js -->
					</div>
					
				</div>

				<!-- Users table -->
				<div class="row">
				<div style="margin-bottom: 20px">
				
				<div style="font-size: 10px;font-weight: bold;color:red;float:left;">提示：</div><div style="font-size: 8px;font-family:黑体">点击"添加兼职"查看联系方式</div>
				
				</div>
					<div class="col-md-6">
						<table class="table table-hover">
								<%
									if(jobs != null){
								                            		for(int i = 0;i < jobs.size();i++){
								%>
								<tr style="background:#EBEBEB;">

									<th class="col-md-2 sortable" style="font-size: 10px;"><span class="line"></span>
										<%=jobs.get(i).getJobId()%></th>
									<th class="col-md-2 sortable" style="font-size: 10px;"><span class="line"></span><%=jobs.get(i).getCategory()%>
									</th>
									<th class="col-md-2 sortable" style="font-size: 10px;"><span class="line"></span>工作时间
									</th>
									<th class="col-md-3 sortable align-right" style="font-size: 10px;"><span
										class="line"></span><a onclick="reply(<%=i %>)"  class="btn-flat success pull-right" style="font-size: 10px;">查看详情</a></th>
								</tr>
							<tbody>
								<!-- row -->

								

								<tr>
									<td style="border:0">兼职标题：</td>
									<td style="border:0"><%=jobs.get(i).getJobTitle()%></td>
								</tr>
								<tr>
									<td style="border:0">人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：</td>
									<td style="border:0"><%=jobs.get(i).getSurplus()%>/<%=jobs.get(i).getTotal()%></td>
								</tr>
								<tr>
									<td style="border:0">薪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;酬：</td>
									<td style="border:0"><%=jobs.get(i).getPrice()%></td>
									<td style="border:0"></td>
									
								</tr>
								<tr>
									<td style="border:0">工作时间：</td>
									<td style="border:0"><%=jobs.get(i).getTime()%></td>
								</tr>
							<%
									} }
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
<%
		if (jobs != null) {
		for (int i = 0; i < jobs.size(); i++) {
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
							<%=jobs.get(i).getCategory() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼值人数：</label>
						<div class="col-lg-10" style="position:absolute;top:12%;left:25%">
						<%=jobs.get(i).getSurplus() %>/<%=jobs.get(i).getTotal() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼职要求：</label>
						<div class="col-lg-10" style="position:absolute;top:20%;left:25%">
						<%=jobs.get(i).getDescription() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">发布机构：</label>
						<div class="col-lg-10" style="position:absolute;top:27%;left:25%">
						<%=jobs.get(i).getCompany() %>
						</div>
					</div>
					<hr/>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">兼职时间：</label>
						<div class="col-lg-10" style="position:absolute;top:39%;left:25%">
						<%=jobs.get(i).getTime() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作时长：</label>
						<div class="col-lg-10" style="position:absolute;top:46%;left:25%">
						<%=jobs.get(i).getDuration() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作地点：</label>
						<div class="col-lg-10" style="position:absolute;top:53%;left:25%">
						<%=jobs.get(i).getLocation() %>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">保证金：</label>
						<div class="col-lg-10" style="position:absolute;top:60%;left:25%">
						<%=jobs.get(i).getBond() %>
						</div>
					</div>
					<hr/>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">工作内容：</label>
						<div class="col-lg-10" style="position:absolute;top:74%;left:25%">
						<%=jobs.get(i).getJobTitle() %>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button onclick="exit(<%=i%>)" type="submit" class="btn btn-primary" style="margin-top:5px;">退出</button>
							<a href="<%=path%>/servlet/AddJob?jobId=<%=jobs.get(i).getJobId()%>&surplus=<%=jobs.get(i).getSurplus()%>"  class="btn-flat success pull-right" style="margin-top:5px;">添加兼职</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%}} %>
	<script type="text/javascript">	
		function out() {
			window.location.href = "signin.jsp";
		}

		function register() {
			window.location.href = "signup.jsp";
		}
	</script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>