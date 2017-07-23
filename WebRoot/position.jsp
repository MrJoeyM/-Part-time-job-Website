<%@ page language="java" import="java.util.*" import="com.baiyaotech.bean.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>

<link rel="stylesheet" href="css/cityselect.css">
<script type="text/javascript" src="js/cityselect.js"></script>


<div>
	<input type="text" name="position" class="cityinput form-control" id="citySelect" placeholder="点击选择城市">
<script type="text/javascript">
var test=new Vcity.CitySelector({input:'citySelect'});
</script>
</div>
