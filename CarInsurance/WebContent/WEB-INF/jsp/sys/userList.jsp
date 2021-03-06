<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<h2>用户管理</h2>
<div>
<form id="search" class="form-search" action="sys/userPage.do" method="post">
  <input type="text" class="input-medium search-query" name="name" placeholder="姓名"/>
  <input type="text" class="input-medium search-query" name="tel" placeholder="电话"/>
  <input type="text" class="input-medium search-query" name="userName" placeholder="登录账户"/>
  <button type="button" class="btn btn-info" onclick="page(1)">查询</button>
  <button type="button" class="btn btn-success" onclick="win('新增用户', 'sys/newUser.do')">新增用户</button>
</form>
</div>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>#</th>
			<th>用户姓名</th>
			<th>联系电话</th>
			<th>常用邮箱</th>
			<th>登录账户</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr id="template">
			<td item="index"></td>
			<td item="name"></td>
			<td item="tel"></td>
			<td item="email"></td>
			<td item="userName"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" class="btn btn-warning" onclick="win('用户修改','sys/userForm.do?id=')">修改</a>
				<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('sys/userDelete.do?id=')">删除</a> 
			</td>
		</tr>
	</tbody>
	<tbody id="tableData"></tbody>
</table>
<%@include file="../base/page.jspf"%>