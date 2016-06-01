<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="typeInfo" class="form-horizontal" action="busys/typeModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="typename">险种名称</label>
    <div class="controls">
		  <input class="span3" id="typename" type="text" placeholder="TypeName" name="typename" value="${type.typename }" valid="required">
		  <input type="hidden" name="id" value="${type.id }"/>
    </div>
  </div>
   <div class="control-group">
    <label class="control-label" for="account">保险额度</label>
    <div class="controls">
		  <input class="span3" id="account" type="text" placeholder="Account" name="account" value="${type.account }" valid="required">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="prerate">费率</label>
    <div class="controls">
		  <input class="span3" id="prerate" type="text" placeholder="Prerate" name="prerate" value="${type.prerate }" valid="required">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="price">价格</label>
    <div class="controls">
		  <input class="span3" id="price" type="text" placeholder="Price" name="price" value="${type.price }" valid="required">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="expdate">期限(年)</label>
    <div class="controls">
		  <input class="span3" id="expdate" type="text" placeholder="Expdate" name="expdate" value="${type.expdate }" valid="required">
    </div>
  </div>
   <div class="control-group">
    <label class="control-label" for="remarks">险种说明</label>
    <div class="controls">
		 <textarea class="span3" cols="3" id="remarks"  placeholder="Remarks" name="remarks" valid="required">${type.remarks }</textarea>
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#typeInfo',save)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
  </div>
</form>
