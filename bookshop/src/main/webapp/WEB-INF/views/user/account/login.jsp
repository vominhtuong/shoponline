<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %> 
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
<div class="row">
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="<c:url value="/home"/>">Trang chủ</a> <span class="divider">/</span></li>
		<li class="active">Đăng nhập</li>
    </ul>
	<h3> Đăng nhập</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<form:form action="dang-nhap" method="POST" modelAttribute="user">  
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email</label>
				<div class="controls">
				    <form:input type="email" class="span3" placeholder="Email" path="user" /> 
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Mật khẩu</label>
				<div class="controls">
				 <form:input type="password" class="span3" placeholder="Mật khẩu" path="password" />
				</div>
			  </div>
			  
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="defaultBtn">Đăng nhập</button> <a href="#"> Quên mật khẩu?</a>
				</div>
			  </div>
			</form:form>
		</div>
		</div>
	</div>	
	
</div>
</div>
</body>
