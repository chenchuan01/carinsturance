<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<table class="table table-bordered">
	<tbody>
		<tr>
			<th>车主</th><td>${vo.user.name }</td>
			<th>电话</th><td>${vo.user.tel }</td>
		</tr>
	</tbody>
	<tbody>
		<tr>
			<th>车牌</th><td>${vo.car.platenum }</td>
			<th>车架号</th><td>NO.${vo.car.framenum }</td>
		</tr>
		<tr>
			<th>发动机号</th><td>NO.${vo.car.enginenum }</td>
			<th>座位数</th><td>${vo.car.seatnum }/座</td>
		</tr>
	</tbody>
	<tbody>
		<tr>
			<th>险种</th><td>${vo.type.typename }</td>
			<th>保额</th><td>￥${vo.type.account }</td>
		</tr>
		<tr>
			<th>费率</th><td>${vo.type.prerate }</td>
			<th>购买价格</th><td>￥${vo.type.price }</td>
		</tr>
		<tr>
			<th>期限</th><td>${vo.type.expdate }年</td>
			<th>投保状态</th>
			<td>
				<button class="btn btn-success">${vo.info.status }</button>
			</td>
		</tr>
		<tr>
			<th >保险介绍</th>
			<td colspan="3">${vo.type.remarks }</td>
		</tr>
		<tr>
			<th>投保日期</th><td >${vo.info.creatime }</td>
			<th>保险到期</th><td >${vo.info.duetime }</td>
		</tr>
	</tbody>
</table>
