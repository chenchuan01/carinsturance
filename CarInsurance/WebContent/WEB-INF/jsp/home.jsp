<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html><!--<![endif]--> 
	<head>
		<%@include file="base/baseh.jspf" %>
	</head>
	<body>
		<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
						</a> <a class="brand" href="#">汽车保险</a>
						<div class="nav-collapse">
							<ul class="nav">
								<sys:auth opreat="${op_front }" roles="${sysuser.roles }">
								<li class="dropdown">
									<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">我的保险 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li>
											<a href="javascript:;" onclick="pageView('home/myInsurance.do?custom_id=${sysuser.id}');">我的车保</a>
										</li>
										<li>
											<a href="javascript:;" onclick="pageView('home/insurSale.do?custom_id=${sysuser.id}');">购买保险</a>
										</li>
										<li>
											<a href="javascript:;" onclick="pageView('home/insurCancel.do?custom_id=${sysuser.id}');">撤销投保</a>
										</li>
									</ul>
								</li>
								</sys:auth>
								<sys:auth opreat="${op_admin }" roles="${sysuser.roles }">
								<li class="dropdown">
									<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">保险管理 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li>
											<a href="insuranceCancel.html"><i class="icon-check"></i> 投保查询</a>
										</li>
										<li>
											<a href="insuranceCancel.html"><i class="icon-check"></i> 报险管理</a>
										</li>
										<li>
											<a href="insuranceCancel.html"><i class="icon-check"></i> 保险过户</a>
										</li>
										<li>
											<a href="insuranceCancel.html"><i class="icon-check"></i> 撤保审核</a>
										</li>
									</ul>
								</li>
								</sys:auth>
								<sys:auth opreat="${op_sys }" roles="${sysuser.roles }">
								<li class="dropdown">
									<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">系统功能 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li>
											<a href="javascript:;" onclick="pageView('home/userList.do?superAdmin_id=${sysuser.id}');"><i class="icon-user"></i>用户管理</a>
										</li>
										<li>
											<a href="javascript:;" onclick="pageView('home/typeList.do?superAdmin_id=${sysuser.id}');"><i class="icon-edit"></i>险种设置</a>
										</li>
										<li>
											<a href="javascript:;" onclick="pageView('home/configList.do?superAdmin_id=${sysuser.id}');"><i class="icon-cog"></i>系统配置</a>
										</li>
									</ul>
								</li>
								</sys:auth>
							</ul>
							<ul class="nav pull-right">
								<li>
									<a href="#userModal" data-toggle="modal">@${sysuser.name }</a>
								</li>
								<li>
									<a href="login/logout.do">Logout</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="span3">
					<div class="well" style="padding: 8px 0;">
						<ul class="nav nav-list">
							
							<sys:auth opreat="${op_front }" roles="${sysuser.roles }">
							<li class="nav-header">
								汽车保险
							</li>
							<li id="myInsNav">
								<a href="javascript:;" onclick="pageView('home/myInsurance.do?custom_id=${sysuser.id}');">我的车保</a>
							</li>
							<li>
								<a href="javascript:;" onclick="pageView('home/insurSale.do?custom_id=${sysuser.id}');">购买保险</a>
							</li>
							<li>
								<a href="javascript:;" onclick="pageView('home/insurCancel.do?custom_id=${sysuser.id}');">撤销投保</a>
							</li>
							</sys:auth>
							<sys:auth opreat="${op_admin }" roles="${sysuser.roles }">
							<li class="nav-header">
								保险管理
							</li>
							<li id="insListNav">
								<a href="insuranceCancel.html"><i class="icon-check"></i> 投保查询</a>
							</li>
							<li>
								<a href="insuranceCancel.html"><i class="icon-check"></i> 报险管理</a>
							</li>
							<li>
								<a href="insuranceCancel.html"><i class="icon-check"></i> 保险过户</a>
							</li>
							<li>
								<a href="insuranceCancel.html"><i class="icon-check"></i> 撤保审核</a>
							</li>
							</sys:auth>
							<sys:auth opreat="${op_sys }" roles="${sysuser.roles }">
							<li class="nav-header">
								系统功能
							</li>
							<li id="userListNav">
								<a href="javascript:;" onclick="pageView('home/userList.do?superAdmin_id=${sysuser.id}');"><i class="icon-user"></i>用户管理</a>
							</li>
							<li>
								<a href="javascript:;" onclick="pageView('home/typeList.do?superAdmin_id=${sysuser.id}');"><i class="icon-edit"></i>险种设置</a>
							</li>
							<li>
								<a href="javascript:;" onclick="pageView('home/configList.do?superAdmin_id=${sysuser.id}');"><i class="icon-cog"></i>系统配置</a>
							</li>
							</sys:auth>
							<li class="nav-header">
								系统账户
							</li>
							<li>
								<a href="javascript:;" onclick="win('个人信息','sys/userForm.do?id=${sysuser.id}')" ><i class="icon-user"></i>个人信息</a>
							</li>
							<li>
								<a href="javascript:;" onclick="win('密码修改','sys/pwdModify.do?id=${sysuser.id}')"><i class="icon-cog"></i>密码修改</a>
							</li>
							<li class="divider">
							</li>
							<li>
								<a href="login/logout.do"><i class="icon-sign-out"></i> 退出登录</a>
							</li>
						</ul>
					</div>
					
				</div>
				<div id="pageContent" class="span9"></div>
			</div>
		</div>
		<%@include file="base/basef.jspf" %>
		<script type="text/javascript">
			$(function(){
				loadFristPage('${sysuser.id}','${sysuser.roles}');
			});
		</script>
	</body>
</html>