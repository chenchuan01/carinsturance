<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<form id="cancelForm" class="form-horizontal " action="cancel/newCancel.do" method="post">
  <div class="control-group well">
    <label class="control-label" for="reason">撤保申请理由</label>
    <div class="controls">
      <textarea rows="10" class="span3" name="reason" valid="required"></textarea>
      <input type="hidden" name="insur_id" value="${insur_id}"/>
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#cancelForm',saveCancel)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
  </div>
</form>