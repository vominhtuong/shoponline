<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<header class="bg-nav">
            <div class="flex justify-between">
                <div class="p-1 mx-3 inline-flex items-center">
                    <i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()"></i>
                    <h1 class="text-white p-2"></h1>
                </div>
                <div class="p-1 flex flex-row items-center">
                    <a href="admin/products" onclick="profileToggle()" class="text-white p-2 no-underline hidden md:block lg:block">Chuyển đến trang quản trị</a>
                </div>
            </div>
</header>
</body>
</html>