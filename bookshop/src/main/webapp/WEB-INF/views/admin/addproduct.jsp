<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



 <body>

	<link href="<c:url value = "/assets/user/css/style-login.css"></c:url>"
		rel="stylesheet" />
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
		crossorigin="anonymous" />

	<!-- Form without bootstrap -->
	<div class="auth-wrapper">
		<div class="auth-container">
			<div class="auth-action-left">
				<div class="auth-form-outer">
					
					<form:form action="saveproduct" method="post" modelAttribute="products" class="login-form">
					 <form:hidden path="id"/>			
						<form:input path="id_category"  type="text" class="auth-form-input"
							placeholder="mã loại sản phẩm"/> 
							<form:input path="name"
							class="auth-form-input" placeholder="tên sản phẩm"/>
							
							
							
						<div class="input-icon">
							<form:input path="price"
							class="auth-form-input" placeholder="giá"/>
						</div>
						<form:input path="img"
							class="auth-form-input" placeholder="Hình Ảnh"/>
							
							<form:input path="description"
							class="auth-form-input" placeholder="mô tả"/>
							
							<form:input path="highlight"
							class="auth-form-input" placeholder="nổi bật"/>
							<form:input path="details"
							class="auth-form-input" placeholder="chi tiết"/>
							
						</span>
						</label>
						<div class="footer-action">
							<input type="submit" value="Thêm sản phẩm" class="auth-submit">
							
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script src="/bookshop/assets/user/js/common.js"></script>
</body> 


