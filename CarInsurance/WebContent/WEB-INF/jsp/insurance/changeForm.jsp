<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<script type="text/javascript">
$(function(){
	selectUserCars();
});
</script>
<form id="changeForm" action="insur/saveChange.do" method="post">
<input type="hidden" name="insur_id" value="${info.id}"/>
<table class="table table-bordered">
	<tbody>
		<tr>
			<th>原车主</th><td>${host.name }</td>
			<th>车牌</th><td>${car.platenum }</td>
		</tr>
	</tbody>
	<tbody>
		<tr>
			<th>险种</th><td>${type.typename }</td>
			<th>保额</th><td>￥${type.account }</td>
		</tr>
		<tr>
			<th>费率</th><td>${type.prerate }</td>
			<th>购买价格</th><td>￥${type.price }</td>
		</tr>
		<tr>
			<th>期限</th><td>${type.expdate }年</td>
			<th>投保状态</th>
			<td>
				<button class="btn btn-success">${info.status }</button>
			</td>
		</tr>
		<tr>
			<th>办理时间</th>
			<td colspan="3">
				${info.creatime }
			</td>
		</tr>
		<tr>
			<th>过户车主</th>
			<td colspan="3">
			  <select id="selectUser" class="input-middle" name="user_id" valid="required">
			  	<option value="">车主姓名选择</option>
			  	<c:forEach items="${userList }" var="user">
			  	<option value="${user.id }">${user.name }</option>
			  	</c:forEach>
			  </select>
			</td>
			
		</tr>
		<tr>
			<th>过户车辆</th>
			<td colspan="3">
				<select id="selectCar" class="input-middle" name="car_id" valid="required"></select>
			</td>
		</tr>
		<tr>
			<td colspan="4"><button type="button" class="btn btn-warning btn-block" onclick="valid('#changeForm',saveInsurChange)">确认过户</button></td>
		</tr>
		
	</tbody>
</table>
</form>