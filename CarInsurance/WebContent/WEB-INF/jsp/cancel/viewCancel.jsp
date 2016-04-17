<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<table class="table table-bordered">
	
	<tbody>
		<tr>
			<td colspan="4"><a href="javascript:;" class="btn btn-success btn-block">${cancel.remarks }</a></td>
		</tr>
		<tr>
			<th>申请日期</th><td >${empty cancel.creatime?'****-**-**':cancel.creatime }</td>
			<th>通过日期</th><td >${empty cancel.passtime?'****-**-**':cancel.passtime }</td>
		</tr>
		<tr>
			<th >申请理由</th>
			<td colspan="3">${cancel.reason }</td>
		</tr>
		<sys:auth opreat="${op_admin }" roles="${sysuser.roles }">
		<tr>
			<td colspan="4"><button type="button" class="btn btn-primary" onclick="passCheck('cancel/passCheck.do?id=${cancel.id}')">通过审核</button></td>
		</tr>
		</sys:auth>
	</tbody>
</table>
