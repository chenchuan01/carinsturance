<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<form id="passCheck" action="cancel/passCheck.do" method="post">
<input type="hidden" name="id" value="${cancel.id}"/>
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
		<tr>
			<td colspan="4"><button type="button" class="btn btn-primary btn-block" onclick="valid('#passCheck',saveCancelPass)">通过审核</button></td>
		</tr>
	</tbody>
</table>
</form>