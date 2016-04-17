<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@include file="../base/taglib.jspf" %>
<h2>投保查询</h2>
<div>
<form id="search" class="form-search" action="insur/insurRecordPage.do" method="post">
  <select class="input-middle" name="user_id">
  <option value="">车主姓名查询</option>
  	<c:forEach items="${userList }" var="user">
  	<option value="${user.id }">${user.name }</option>
  	</c:forEach>
  </select>
   <select class="input-middle" name="type_id">
   <option value="">保险种类查询</option>
  	<c:forEach items="${typeList }" var="type">
  	<option value="${type.id }">${type.typename }</option>
  	</c:forEach>
  </select>
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