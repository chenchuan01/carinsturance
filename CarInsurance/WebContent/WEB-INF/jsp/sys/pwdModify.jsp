<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="pwdForm" class="form-horizontal">
  <div class="control-group">
    <label class="control-label" for="name">登录账号</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-user"></i></span>
		  <input class="span2" id="name" type="text" placeholder="Name" value="${sysuser.userName }" readonly="readonly">
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="name">新密码</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="name" type="password" placeholder="New Password" value="">
		</div>
    </div>
  </div>
  <div class="control-group">
  	 <div class="controls">
	  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	  <button class="btn btn-primary" onclick="">保存</button>
	 </div>
  </div>
</form>
