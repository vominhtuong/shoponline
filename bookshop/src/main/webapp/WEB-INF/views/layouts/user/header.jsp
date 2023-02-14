<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<header id="header">
	
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a data-target=".nav-collapse" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="nav-collapse">
				<ul class="nav">
					<c:forEach var="item" items="${ menus }" varStatus="index">
							<c:if test="${index.first }">
								<li class="active">
							</c:if>
							<c:if test="${ not index.first }">
								<li class="">
							</c:if>
						<a href="<c:url value="/home"/>">${ item.name } </a>
					</c:forEach>

					
				</ul>
				<form action="#" class="navbar-search pull-left">
					<input type="text" placeholder="Tìm kiếm" class="search-query span2">
				</form>
				<ul class="nav pull-right">
				<c:if test="${empty LoginInfo }">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"><span class="icon-lock"></span>
							Đăng nhập</a>
					</li>
						</c:if>
						<c:if test="${not empty LoginInfo }">
							<li><a href="#">${LoginInfo.display_name } <b class="caret"></b></a></li>
						</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>