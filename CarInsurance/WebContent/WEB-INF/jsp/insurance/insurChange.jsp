<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@include file="../base/taglib.jspf" %>
<h2>保险过户</h2>
<div>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>车主</th>
			<th>车辆</th>
			<th>投保日期</th>
			<th>险种</th>
			<th>有效期</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="vo">
		<tr>
			<td>${vo.user.name }</td>
			<td>${vo.car.platenum }</td>
			<td>${vo.info.creatime }</td>
			<td>${vo.type.typename }</td>
			<td>${vo.type.expdate }年</td>
			<td>${vo.info.status }</td>
			<td>
				<a href="javascript:;" class="btn btn-info" onclick="win('办理过户','insur/changeForm.do?insur_id=${vo.info.id}')">办理过户</a>
			</td>
		</tr>
		</c:forEach>
		
	</tbody>
</table>
