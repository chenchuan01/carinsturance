<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<h2>险种设置</h2>
<div>
<form id="search" class="form-search" action="busys/typePage.do" method="post">
  <input type="text" class="input-medium search-query" name="typename" placeholder="险种名称"/>
  <button type="button" class="btn btn-info" onclick="page(1)">查询</button>
  <button type="button" class="btn btn-success" onclick="win('新增险种', 'busys/typeForm.do')">新增险种</button>
</form>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>#</th>
			<th>名称</th>
			<th>额度</th>
			<th>费率</th>
			<th>价格</th>
			<th>期限(年)</th>
			<th>介绍</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr id="template">
			<td item="index"></td>
			<td item="typename"></td>
			<td item="account"></td>
			<td item="prerate"></td>
			<td item="price"></td>
			<td item="expdate"></td>
			<td item="remarks"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" class="btn btn-warning" onclick="win('险种修改','busys/typeForm.do?id=')">修改</a>
				<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('busys/typeDelete.do?id=')">删除</a> 
			</td>
		</tr>
	</tbody>
	<tbody id="tableData"></tbody>
</table>
<%@include file="../base/page.jspf"%>