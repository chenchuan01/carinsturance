<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<form id="carInfo" class="form-horizontal" action="car/carInfoModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="carplate">车辆牌照</label>
    <div class="controls">
      <input type="text" id="carplate" placeholder="车牌号-CarPlateNum" name="platenum" valid="required"/>
      <input type="hidden" name="user_id" value="${sysuser.id }"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="engineNum">发动机号</label>
    <div class="controls">
      <input type="text" id="engineNum" placeholder="发动机号-EngineNum" name="enginenum" valid="required"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="frameNum">车架号</label>
    <div class="controls">
      <input type="text" id="frameNum" placeholder="车架号-FrameNum" name="framenum" valid="required"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="seatNum">座位数</label>
    <div class="controls">
      <input type="text" id="seatNum" placeholder="座位数-SeatNum" name="seatnum" valid="required">
    </div>
  </div>
  <div class="control-group">
  	<div class="controls">
  	  <button type="button" class="btn btn-primary" onclick="valid('#carInfo',saveCarInfo)">保存</button>
	  <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
  </div>
</form>