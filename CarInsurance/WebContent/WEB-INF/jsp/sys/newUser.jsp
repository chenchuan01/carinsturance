<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<center>
<form id="newUserform" action="sys/addUser.do" method="post">

	<input type="text"  placeholder="姓名" name="name" valid="required" valid-msg="请输入姓名"/><br /><br />
	<input type="text"  placeholder="电话" name="tel" valid="tel"/><br /><br />
	<input type="text"  placeholder="邮箱" name="email" valid="email"/><br /><br />
	<input type="text"  placeholder="登陆账户" name="userName" valid="required" valid-msg="请输入用户名"/><br /><br />
	<input type="text"  placeholder="登录密码" name="password" valid="required" valid-msg="请输入密码"/><br /><br />
	<a href="javascript:;" class="btn btn-primary" onclick="valid('#newUserform',save)">保存</a>

</form>
</center>	