<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<form id="config" class="form-horizontal" action="sys/configModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="key">配置索引</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="key" type="text" placeholder="Key" name="key" value="${config.key }" valid="requried">
		  <input type="hidden" name="id" value="${config.id }"/>
		</div>
    </div>
  </div>
   <div class="control-group">
    <label class="control-label" for="value">配置值</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="value" type="text" placeholder="Value" name="value" value="${config.value }" valid="requried">
		</div>
    </div>
  </div>
   <div class="control-group">
    <label class="control-label" for="remarks">配置说明</label>
    <div class="controls">
      <div class="input-prepend">
		  <span class="add-on"><i class="icon-tag"></i></span>
		  <input class="span2" id="remarks" type="text" placeholder="Remarks" name="remarks" value="${config.remarks }" valid="requried">
		</div>
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#config',save)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
  </div>
</form>
