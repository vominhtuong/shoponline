<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css -->
    <link rel="stylesheet" href="./dist/styles.css">
    <link rel="stylesheet" href="./dist/all.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <title>ADMIN</title>
</head>

<body>
<!--Container -->
<div class="mx-auto bg-grey-lightest">
    <!--Screen-->
    <div class="min-h-screen flex flex-col">

        <div class="flex flex-1">
            <h1>ADMIN</h1>
            <!--Main-->
            <main class="bg-white-500 flex-1 p-3 overflow-hidden">

                <div class="flex flex-col">
                   
                    <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                        <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                            
                               <a href="/bookshop/add-product">Thêm sản phẩm</a>
                            <div class="p-3">
                                <table class="table-responsive w-full rounded">
                                
                                    <thead>
                                      <tr>
                                      <th class="border w-1/6 px-4 py-2">Hình ảnh</th>
                                        <th class="border w-1/4 px-4 py-2">Mã loại sản phẩm</th>
                                        <th class="border w-1/6 px-4 py-2">Tên sản phẩm</th>
                                        <th class="border w-1/6 px-4 py-2">Giá</th>
                                        
                                        <th class="border w-1/7 px-4 py-2">Mô tả</th>
                                        <th class="border w-1/5 px-4 py-2">Nổi bật</th>
                                        <th class="border w-1/5 px-4 py-2">Chi tiết</th>
                                        <th class="border w-1/5 px-4 py-2">Trạng thái</th>
                                      </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="item" items="${ showProducts }" varStatus="index">
											<c:if test="${ index.first }">
						       
						        			</c:if>
						                               		
						        			<c:if test="${ not index.first }">
						            	
						        			</c:if>
						        			
						        			<tr>
	                                            <td class="border px-4 py-2">
	                                            	<img class="img-fluid w-100" src="<c:url value="/assets/user/img/${item.img }"/>" alt="" />
	                                            </td>
	                                            <td class="border px-4 py-2">${item.id_category }</td>
	                                            <td class="border px-4 py-2">${item.name }</td>
	                                            <td class="border px-4 py-2">${item.price }</td>
	                                            <td class="border px-4 py-2">${item.description }</td>
	                                            <td class="border px-4 py-2">${item.highlight }</td>
	                                            <td class="border px-4 py-2">${item.details }</td>
	                                            <td class="border px-4 py-2">
	                                                  <a href="/bookshop/editProduct?id=${item.id}" data-modal='toppedModalUp'
                        							class="modal-trigger bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
	                                                        <i class="fas fa-edit"></i></a>
	                                                <a href="/bookshop/deleteContact?id=${item.id}" class="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-red-500">
	                                                        <i class="fas fa-trash"></i>
	                                                </a>
	                                            </td>
	                                        </tr>
						        		</c:forEach>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--/Grid Form-->
                </div>
            </main>
            <!--/Main-->
        </div>
       

    </div>

</div>

<script src="./main.js"></script>

</body>

</html>