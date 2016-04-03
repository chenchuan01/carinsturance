<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<h3>个人信息</h3>
<form id="userInfo" class="form-horizontal" action="sys/userModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="name">姓名</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-user"></i></span>
		  <input class="span2" id="name" type="text" placeholder="Name" value="${sysuser.name }" valid="requried">
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="name">电话</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="name" type="text" placeholder="Tel." value="${sysuser.tel }">
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="name">邮箱</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-envelope"></i></span>
		  <input class="span2" id="name" type="text" placeholder="Email" value="${sysuser.email }">
		</div>
    </div>
  </div>
  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
     <button class="btn btn-primary" onclick="">保存</button>
</form>
