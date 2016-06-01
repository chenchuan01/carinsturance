<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<h2>系统配置</h2>
<div>
<form id="search" class="form-search" action="sys/configPage.do" method="post">
  <input type="text" class="input-medium search-query" name="key" placeholder="KEY"/>
  <input type="text" class="input-medium search-query" name="value" placeholder="VALUE"/>
  <input type="text" class="input-medium search-query" name="reamrks" placeholder="REMARKS"/>
  <button type="button" class="btn btn-info" onclick="page(1)">查询</button>
</form>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>#</th>
			<th>配置索引</th>
			<th>配置值</th>
			<th>配置说明</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr id="template">
			<td item="index"></td>
			<td item="key"></td>
			<td item="value"></td>
			<td item="remarks"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" class="btn btn-warning" onclick="win('配置修改','sys/configForm.do?id=')">修改</a>
			</td>
		</tr>
	</tbody>
	<tbody id="tableData"></tbody>
</table>
<%@include file="../base/page.jspf"%>