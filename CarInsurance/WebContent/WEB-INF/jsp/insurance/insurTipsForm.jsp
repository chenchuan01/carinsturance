<%@page import="com.sys.common.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf" %>
<script type="text/javascript">
$(function(){
	selectUserCars();
});
</script>
<form id="tipsForm" action="insurTips/insurTipsModify.do" method="post">
<input type="hidden" name="id" value="${vo.tips.id}"/>
<table class="table table-bordered" style="margin: 0px;">
	<tbody>
		<tr>
			<th>报险车主</th>
			<td colspan="3">
			 <c:choose>
			 	<c:when test="${empty vo.user }">
			 		<select id="selectUser" class="span3" name="user_id" valid="required">
					  	<option value="">车主姓名选择</option>
					  	<c:forEach items="${userList }" var="userC">
					  	<option value="${userC.id }">${userC.name }</option>
					  	</c:forEach>
					  </select>
			 	</c:when>
			 	<c:otherwise>
			 	<input type="text" class="span3" value="${vo.user.name }" readonly="readonly"/>
			 		<input type="hidden" name="user_id" value="${vo.user.id }"/>
			 	</c:otherwise>
			 </c:choose>
			  
			</td>
			
		</tr>
		<tr>
			<th>报险车辆</th>
			<td colspan="3">
			<c:choose>
			 	<c:when test="${empty vo.car }">
			 		<select id="selectCar" class="span3" name="car_id" valid="required"></select>
			 	</c:when>
			 	<c:otherwise>
			 		<input type="text" class="span3" value="${vo.car.platenum }" readonly="readonly"/>
			 		<input type="hidden" name="car_id" value="${vo.car.id }"/>
			 	</c:otherwise>
			 </c:choose>
				
			</td>
		</tr>
		<tr>
			<th>事故时间</th>
			<td colspan="3">
			<c:choose>
			 	<c:when test="${empty vo.tips }">
			 		<input class="span3" type="text" name="creatime" value="<%=DateUtil.getNow()%>" valid="required"/>
			 	</c:when>
			 	<c:otherwise>
			 		<input type="span3" name="creatime" value="${vo.tips.creatime }" valid="required"/>
			 	</c:otherwise>
			 </c:choose>
				
			</td>
		</tr>
		<tr>
			<th>事故地点</th>
			<td colspan="3">
				<input class="span3" type="text" name="place" value="${vo.tips.place }" valid="required"/>
			</td>
		</tr>
		<tr>
			<th>报险描述</th>
			<td colspan="3">
				<textarea rows="5"class="span3" name="des" valid="required"><c:choose><c:when test="${empty vo.tips }">定损描述:...定损保费:...</c:when><c:otherwise>${vo.tips.des }</c:otherwise></c:choose></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<c:choose>
			 	<c:when test="${empty vo.tips }">
			 		<button type="button" class="btn btn-warning btn-block" onclick="valid('#tipsForm',saveInsurTips)">确认报险</button>
			 	</c:when>
			 	<c:otherwise>
			 		<button type="button" class="btn btn-default btn-block btn-disable" >线下办理报险审核和理赔</button>
			 	</c:otherwise>
			 </c:choose>
				
			
			</td>
		</tr>
		
	</tbody>
</table>
</form>