<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
		<%@include file="../base/baseh.jspf" %>
	</head>
	<body>
		<div id="login-page" class="container">
			<h1>CarInsurance Login</h1>
		<form id="loginform" class="well" action="login/verify.do" method="post">
			<c:if test="${exp != null }">
				<div class="tip span3">
					${exp.msg }
				</div>
        	</c:if>
			<input type="text" class="span3" placeholder="用户名-UserName" name="userName" valid="required" valid-msg="请输入用户名"/><br /><br />
			<input type="password" class="span3" placeholder="密码-Password" name="password"  valid="required" valid-msg="请输入密码"/><br /><br />
			<div id="loginCode">
			<input type="text" class="span2" placeholder="验证码-Code" name="code"  valid="required" valid-msg="请输入验证码"/>
			<img  src="${ctx }/img/code.do" onclick="this.src='img/code.do?rand='+Math.random();" alt="" title="点击更换" style="width:35%;margin-top: -3%;cursor: pointer;" title="点击更换！" />
			</div>
			<br />
			<a href="javascript:;" class="btn btn-primary btn-block" onclick="valid('#loginform',function(){$('#loginform').submit();})">登录</a>
			<a href="javascript:" class="btn btn-link" onclick="showRigist()">没有账号？点这里</a>
		</form>
		<div id="regist" style="display: none;">
			<form id="registform" class="well" action="login/regist.do" method="post">
				<input type="text" class="span3" placeholder="姓名" name="name" valid="required" valid-msg="请输入姓名"/><br /><br />
				<input type="text" class="span3" placeholder="电话" name="tel" valid="tel"/><br /><br />
				<input type="text" class="span3" placeholder="邮箱" name="email" valid="email"/><br /><br />
				<input type="text" class="span3" placeholder="登陆账户" name="userName" valid="required" valid-msg="请输入用户名"/><br /><br />
				<input type="text" class="span3" placeholder="登录密码" name="password" valid="required" valid-msg="请输入密码"/><br /><br />
				<div id="registCode">
				<input type="text" class="span2" placeholder="验证码-Code" name="code"  valid="required" valid-msg="请输入验证码"/>
				<img  src="${ctx }/img/code.do" onclick="this.src='img/code.do?rand='+Math.random();" alt="" title="点击更换" style="width:35%;margin-top: -3%;cursor: pointer;" title="点击更换！" />
				</div><br/>
				<a href="javascript:;" class="btn btn-success btn-block" onclick="valid('#registform',function(){$('#registform').submit();})">提交注册</a>
			</form>
		</div>
		
		</div>
		<%@include file="../base/basef.jspf" %>
		<script type="text/javascript">
			function showRigist(){
				$('#regist').toggle();
				$('#loginCode').toggle();
			}
		</script>
	</body>
</html>