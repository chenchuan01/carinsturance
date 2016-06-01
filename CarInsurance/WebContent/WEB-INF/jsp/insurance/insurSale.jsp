<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<script type="text/javascript">
var handleInsur=function(insur_id){
	
};
$(function(){
	loadMyCarInfos();
});
</script>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<h2>购买保险</h2>
<!-- 车辆选择 -->
<form class="form-inline">
  <select id="myCarInfos" class="input-middle">
  	<option>请先添加车辆信息</option>
  </select>
  <a href="javascript:;" class="btn btn-primary" onclick="loadMyCarInfos()">
  <i class="icon-white icon-refresh" data-toggle="tooltip" title="刷新车辆"></i>
  </a>
  <a href="javascript:;" class="btn btn-primary" onclick="win('添加车辆','car/carInfoForm.do')">
  <i class="icon-white icon-plus" data-toggle="tooltip" title="添加车辆"></i>
  </a>
</form>
<!-- 保险展示 -->
<ul class="thumbnails">
	<c:forEach items="${types }" var="type">
	<li class="span3">
		<div class="thumbnail">
			<img src="${ctx }/img/carinsurance.jpg" alt="" />
			<div class="caption">
				<a href="javascript:;" data-toggle="tooltip" title="${type.remarks }"><h5>${type.typename }</h5></a>
				<p><a class="btn btn-primary btn-small">RMB:${type.price }</a>
				<a class="btn btn-success btn-small">保期：${type.expdate }年</a></p>
				<p><a class="btn btn-warning btn-block" href="javascript:;" onclick="handleInsur(${type.id})">点击办理</a></p>
			</div>
		</div>
	</li>
	</c:forEach>
</ul>
