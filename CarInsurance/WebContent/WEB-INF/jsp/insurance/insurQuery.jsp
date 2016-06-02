<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<h2>投保查询</h2>
<div>
<form id="search" class="form-search" action="insur/insurRecordPage.do" method="post">
  <input type="hidden" name="user_id" value=""/>
  <button type="button" class="btn btn-primary" onclick="page(1)">查询</button>
</form>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>投保日期</th>
			<th>车主</th>
			<th>电话</th>
			<th>车辆</th>
			<th>险种</th>
			<th>有效期(年)</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr id="template">
			<td item="info.creatime"></td>
			<td item="user.name"></td>
			<td item="user.tel"></td>
			<td item="car.platenum"></td>
			<td item="type.typename"></td>
			<td item="type.expdate"></td>
			<td item="info.status"></td>
			<td item="oprea" itemFiled="info.id">
				<a href="javascript:;"  onclick="win('详情','insur/viewInsur.do?id=')">查看</a>
			</td>
		</tr>
	</tbody>
	<tbody id="tableData"></tbody>
</table>
<%@include file="../base/page.jspf"%>