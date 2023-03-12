<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %> 	

<title>Trang chủ</title>
<body>


	<!-- 
Body Section 
-->
	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${ categorys }">
						<li><a href='<c:url value="/product/${item.id }"/>'><span
								class="icon-circle-blank"></span> ${item.name }</a></li>
					</c:forEach>
				</ul>
			</div>

			

			
		</div>
		<div class="span9">
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">					
						<c:forEach var="item" items="${ slides }" varStatus="index">					
							<c:if test="${index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${ not index.first }">
								<div class="item">
							</c:if>
							
									<img style="width: 100%"
										src="<c:url value="/assets/user/img/slides/${item.img }"/>"
										alt="bootstrap ecommerce templates">
									<div class="carousel-caption">
										<h4>${item.caption }</h4>
										<p>
											<span>${item.content }</span>
										</p>
									</div>
								</div>
						</c:forEach>												
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</div>
			
			<!--
	Featured Products
	-->
			<div class="well well-small">
				<h3>
					
					Sản phẩm nổi bật
				</h3>
				<hr class="soften" />
				<div class="row-fluid">
				
				<c:if test="${products.size() > 0 }">
					<ul class="thumbnails">
					
					<c:forEach var="item" items="${ products }" varStatus="loop">
						<li class="span4">
							<div class="thumbnail">
								<a class="zoomTool" href="<c:url value="/detail/${ item.id_pr }"/>"
									title="Chi tiết sản phẩm"><span class="icon-search"></span> Chi Tiết 
									</a> <a href="detail/${item.id_pr }"><img
									src="<c:url value="/assets/user/img/${ item.img }"/>" alt=""></a>  
								<div class="caption">
									<h5>${ item.name }</h5>
									<h4>
										
										<a class="shopBtn" href="<c:url value="/AddCart/${ item.id_pr }"/>" title="thêm vào giỏ hàng"><span
											class="icon-plus"></span></a> <span class="pull-right"> <fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" />đ</span>
									</h4>
								</div>
							</div>
						</li>

						<c:if test="${ (loop.index +1) % 3 == 0 || (loop.index + 1) == products.size() }">
								</ul>
								<c:if test="${ (loop.index + 1) < products.size() }">
									<ul class="thumbnails">
								</c:if>
						</c:if>
					</c:forEach>
				</c:if>

				</div>
			</div>
			</ul>
		
		</div>
	</div>


</body>

