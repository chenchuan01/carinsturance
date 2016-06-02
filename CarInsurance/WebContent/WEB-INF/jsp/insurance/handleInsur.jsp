<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>

<table class="table table-bordered">
	<tbody>
		<tr>
			<th>车主</th><td>${user.name }</td>
			<th>电话</th><td>${user.tel }</td>
		</tr>
	</tbody>
	<tbody>
		<tr>
			<th>车牌</th><td>${carInfo.platenum }</td>
			<th>车架号</th><td>NO.${carInfo.framenum }</td>
		</tr>
		<tr>
			<th>发动机号</th><td>NO.${carInfo.enginenum }</td>
			<th>座位数</th><td>${carInfo.seatnum }/座</td>
		</tr>
	</tbody>
	<tbody>
		<tr>
			<th>名称</th><td>${type.typename }</td>
			<th>保额</th><td>￥${type.account }</td>
		</tr>
		<tr>
			<th>费率</th><td>${type.prerate }</td>
			<th>购买价格</th><td>￥${type.price }</td>
		</tr>
		<tr>
			<th>期限</th><td>${type.expdate }年</td>
			<th colspan="2"></th>
		</tr>
		<tr>
			<th >保险介绍</th>
			<td colspan="3">${type.remarks }</td>
		</tr>
		<tr>
			<th >办理日期</th>
			<td colspan="3">${today }</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-primary btn-block" onclick="payInsur('${sysuser.id}','${carInfo.id }','${type.id }')">确认购买</button>
			</td>
		</tr>
	</tbody>
</table>
