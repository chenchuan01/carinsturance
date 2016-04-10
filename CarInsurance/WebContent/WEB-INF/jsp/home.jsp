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
								<li class="dropdown">
									<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">我的保险 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li class="active">
											<a href="home.html">我的车保</a>
										</li>
										<li>
											<a href="insuranceSale.html">购买保险</a>
										</li>
										<li>
											<a href="insuranceCancel.html">撤销投保</a>
										</li>
									</ul>
								</li>
								
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
							<li class="nav-header">
								汽车保险
							</li>
							<li class="active">
								<a href="home.html"><i class="icon-home"></i> 我的车保</a>
							</li>
							<li>
								<a href="insuranceSale.html"><i class="icon-folder-open"></i> 购买保险</a>
							</li>
							<li>
								<a href="insuranceCancel.html"><i class="icon-check"></i> 撤销投保</a>
							</li>
							<li class="nav-header">
								保险管理
							</li>
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
							<li class="nav-header">
								系统功能
							</li>
							<li>
								<a href="javascript:;"><i class="icon-check"></i>用户管理</a>
							</li>
							<li>
								<a href="javascript:;"><i class="icon-check"></i>险种设置</a>
							</li>
							<li>
								<a href="javascript:;"><i class="icon-check"></i>系统配置</a>
							</li>
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
				<div id="pageContent" class="span9">
					<h2>
						我的车保
					</h2>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									车辆
								</th>
								<th>
									投保日期
								</th>
								<th>
									有效期
								</th>
								<th>
									状态
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									京A:00001
								</td>
								<td>
									2014-01-08
								</td>
								<td>
									1年
								</td>
								<td>
									已到期
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									京A:00001
								</td>
								<td>
									2015-01-08
								</td>
								<td>
									1年
								</td>
								<td>
									已到期
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									京A:00001
								</td>
								<td>
									2016-01-08
								</td>
								<td>
									1年
								</td>
								<td>
									保险生效
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									赣A:88888
								</td>
								<td>
									2015-02-08
								</td>
								<td>
									1年
								</td>
								<td>
									已到期
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									赣A:88888
								</td>
								<td>
									2016-02-08
								</td>
								<td>
									1年
								</td>
								<td>
									保险生效
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									赣A:88881
								</td>
								<td>
									2016-02-08
								</td>
								<td>
									1年
								</td>
								<td>
									撤保审核
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
							<tr>
								<td>
									赣A:88883
								</td>
								<td>
									2015-02-08
								</td>
								<td>
									1年
								</td>
								<td>
									已撤保
								</td>
								<td>
									<a href="#" class="view-link">查看</a>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						<ul>
							<li class="disabled">
								<a href="#">&laquo;</a>
							</li>
							<li class="active">
								<a href="#">1</a>
							</li>
							<li>
								<a href="#">2</a>
							</li>
							<li>
								<a href="#">3</a>
							</li>
							<li>
								<a href="#">4</a>
							</li>
							<li>
								<a href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@include file="base/basef.jspf" %>
	</body>
</html>