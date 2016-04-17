<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@include file="../base/taglib.jspf" %>
<h2>报险管理</h2>
<div>
<form id="search" class="form-search" action="insurTips/insurTipsPage.do" method="post">
  <input type="text" class="input-middle" name="recon" placeholder="报险单号"/>
  <button type="button" class="btn btn-primary" onclick="page(1)">查询</button>
  <button type="button" class="btn btn-success" onclick="win('新增报险','insurTips/insurTipsForm.do')">报险</button>
</form>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>报险单号</th>
			<th>车主</th>
			<th>电话</th>
			<th>车牌</th>
			<th>报险时间</th>
			<th>事故地点</th>
			<th>报险单内容</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr id="template">
			<td item="tips.recno"></td>
			<td item="user.name"></td>
			<td item="user.tel"></td>
			<td item="car.platenum"></td>
			<td item="tips.creatime"></td>
			<td item="tips.place"></td>
			<td item="tips.des"></td>
			<td item="oprea" itemFiled="tips.id">
				<a href="javascript:;"  onclick="win('报险单详情','insurTips/insurTipsForm.do?id=')">查看</a>
			</td>
		</tr>
	</tbody>
	<tbody id="tableData"></tbody>
</table>
<%@include file="../base/page.jspf"%>