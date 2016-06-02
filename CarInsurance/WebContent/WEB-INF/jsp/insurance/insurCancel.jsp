<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<h2>撤销车保</h2>
<div>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
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
			<td>${vo.car.platenum }</td>
			<td>${vo.info.creatime }</td>
			<td>${vo.type.typename }</td>
			<td>${vo.type.expdate }年</td>
			<td>${vo.info.status }</td>
			<td>
				<c:choose>
					<c:when test="${not empty vo.cancel.id }">
						<a href="javascript:;" class="btn btn-warning" onclick="win('撤保详情','cancel/view.do?insur_id=${vo.info.id}')">查看详细</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:;" class="btn btn-primary" onclick="win('申请撤保','cancel/handle.do?insur_id=${vo.info.id}')">申请撤保</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
		
	</tbody>
</table>
