<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://sys.com/sys" prefix="sys"%>
<html style="height: 100%;">
<header>
<title>汽车保险</title>
<link rel="shortcut icon" href="img/icon.ico">
<link rel="stylesheet" href="css/site.css"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
</header>
<body style="height: 100%;">
<div id="load">
	<div id="load_bg">
	</div>
	<div id="load_show"><img alt="loading" src="img/spinner.gif"/></div>	
</div>
<script type="text/javascript">
$(function(){
	window.location.href = "${pageContext.request.contextPath}/home.do";
});
</script>
</body>
</html>