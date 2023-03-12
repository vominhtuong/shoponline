<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<style>
	.product-content{
		overflow-x: hidden
	}
</style>
</head>
<body>
<!-- 
Body Section 
-->

<h1>${Cart.size() }</h1>
	<div class="row product-content">


    <ul class="breadcrumb">
    <li><a href="<c:url value="/home"/>">Trang chủ</a> <span class="divider">/</span></li>
    <li><a href="">Sản phẩm</a> <span class="divider">/</span></li>
    <li class="active">Chi tiết sản phẩm</li>
    </ul>	
	<div class="well well-small">
	<div class="row-fluid">
			<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="#"> <img src="<c:url value="/assets/user/img/${ product.img }"/>" alt="" style="width:100%"></a>
                  </div>

                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
			</div>
			<div class="span7">
				<h3>${ product.name }</h3>
				<hr class="soft"/>
				
				<form class="form-horizontal qtyFrm" method="get" action="<c:url value="/AddCart/${product.id_pr}"/>">
				  <div class="control-group">
					<label class="control-label"><span><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}" />đ</span></label>
					<div class="controls">
					<input type="number" min ="0" value="0" class="span6">
					</div>
				  </div>
				
				  
		
				  <h4></h4>
				  <p>${product.description }<p>
				  <button type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> Thêm vào giỏ</button>
				</form>
			</div>
			</div>
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Chi tiết sản phẩm</a></li>
              
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			  ${product.details }
			</div>
			
              
          
            </div>

</div>
</div> <!-- Body wrapper -->
</body>
</html>