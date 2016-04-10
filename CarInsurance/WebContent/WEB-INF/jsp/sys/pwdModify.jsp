<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="pwdForm" action="sys/userModify.do" method="post" class="form-horizontal">
  <div class="control-group">
    <label class="control-label" for="userName">登录账号</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-user"></i></span>
		  <input class="span2" id="userName" name="userName" type="text" placeholder="UserName" value="${user.userName }" valid="required" valid-msg="请输入登录账户名"/><br/>
		  <input type="hidden" name="id" value="${user.id }"/>
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="name">新密码</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="name" type="password" name="password" placeholder="New Password" value="" valid="required" valid-msg="请输入新的登录密码"/><br/>
		</div>
    </div>
  </div>
  <div class="control-group">
  	 <div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#pwdForm',save)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	 </div>
  </div>
</form>
