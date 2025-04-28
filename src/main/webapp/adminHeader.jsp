<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #333;
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header .logo {
            font-size: 20px;
            font-weight: bold;
        }
        nav {
            display: flex;
            gap: 15px;
        }
        nav a {
            text-decoration: none;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }
        nav a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
	<header>
		<nav>
			<a href="adminListProduct.jsp">Danh sách sản phẩm</a> 
			<a href="adminAdd.jsp">Thêm sản phẩm</a>
			<a href="adminOrder.jsp">Quản lý đơn hàng</a>
			<a href="index.jsp">Logout</a>
		</nav>
	</header>
</body>
</html>