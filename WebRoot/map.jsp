<%@ page language="java" import="java.util.*" import="com.baiyaotech.bean.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Employer employer = null;
	Employee employee = null;
	if(session.getAttribute("user1") != null)
	{
		employee = (Employee)session.getAttribute("user1");
	}
	if(session.getAttribute("user2") != null)
	{
		employer = (Employer)session.getAttribute("user2");
	}
%>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Dchvoxvu4MksGpVK6sNDsuQZR4VgFObi"></script>


<div id="allmap" style="width=200px;height:30%">
	<%if(employee != null){%>
		<input type="text" id="position" value="<%=employee.getPosition() %>" style="visibility:hidden">
	<%}else if(employer != null){ %>
		<input type="text" id="position" value="<%=employer.getPosition() %>" style="visibility:hidden">
	<%} %>
</div>

<script type="text/javascript">
	// 百度地图API功能
	var position = document.getElementById("position").value;
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(position, 6);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity(position);          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>
