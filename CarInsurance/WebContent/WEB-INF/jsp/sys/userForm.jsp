<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="userInfo" class="form-horizontal" action="sys/userModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="name">姓名</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-user"></i></span>
		  <input class="span2" id="name" type="text" placeholder="Name" name="name" value="${user.name }" valid="requried">
		  <input type="hidden" name="id" value="${user.id }"/>
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="tel">电话</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="tel" type="text" placeholder="Tel." name="tel" value="${user.tel }">
		</div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="email">邮箱</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-envelope"></i></span>
		  <input class="span2" id="email" type="text" placeholder="Email" name="email" value="${user.email }">
		</div>
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#userInfo',save)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
  </div>
</form>
