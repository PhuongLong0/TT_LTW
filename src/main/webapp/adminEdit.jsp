<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sửa sản phẩm</title>
<style>
/* Toàn bộ trang */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
	line-height: 1.6;
}

h1 {
	text-align: center;
	color: #4CAF50;
	margin-top: 20px;
}

/* Form */
form {
	background-color: #fff;
	padding: 20px;
	margin: 30px auto;
	max-width: 600px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin: 10px 0 5px;
	font-weight: bold;
}

input, select, textarea, button {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	box-sizing: border-box;
}

input:focus, select:focus, textarea:focus {
	border-color: #4CAF50;
	outline: none;
	box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
}

textarea {
	resize: vertical;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

/* Thông báo */
.error {
	color: #ff0000;
	margin-bottom: 15px;
	font-weight: bold;
}

.success {
	color: #4CAF50;
	margin-bottom: 15px;
	font-weight: bold;
}

/* Hình ảnh */
h3 {
	margin-top: 20px;
	color: #333;
}

img {
	display: inline-block;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	max-width: 100px;
	margin: 5px;
}

img:hover {
	border-color: #4CAF50;
	transform: scale(1.05);
	transition: transform 0.3s ease;
}

/* Responsive */
@media ( max-width : 768px) {
	form {
		padding: 15px;
	}
	button {
		padding: 10px;
	}
}
</style>

</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>

	<h1>Sửa Sản Phẩm</h1>

	<!-- Hiển thị thông báo lỗi -->
	<c:if test="${not empty errorMessage}">
		<div class="error">${errorMessage}</div>
	</c:if>

	<!-- Hiển thị thông báo thành công -->
	<c:if test="${not empty successMessage}">
		<div class="success">${successMessage}</div>
	</c:if>

	<form action="${pageContext.request.contextPath}/EditProductServlet" method="post" enctype="multipart/form-data">


		<input type="hidden" name="productId" value="${products.id}">

		<!-- Tên sản phẩm -->
		<label for="name">Tên sản phẩm:</label> <input type="text" id="name"
			name="name" value="${products.name}" placeholder="Nhập tên sản phẩm"
			required>

		<!-- Danh mục--> 
		<label for="category">Danh mục:</label> <select id="category"
			name="category" required>
			<option value="" disabled selected>Chọn danh mục</option>
			<c:choose>
				<c:when test="${not empty products.getCategories()}">
					<c:forEach var="category" items="${products.getCategories()}">
						<option value="${category.category}"
							${category.category == products.category ? 'selected' : ''}>
							${category.category}</option>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<option disabled>Không có danh mục nào</option>
				</c:otherwise>
			</c:choose>
		</select>

		<!-- Giá -->
		<label for="cost">Giá:</label> <input type="number" id="cost"
			name="cost" value="${products.cost}" step="0.01"
			placeholder="Nhập giá sản phẩm" required>

		<!-- Số lượng -->
		<label for="quantity">Số lượng:</label> <input type="number"
			id="quantity" name="quantity" value="${products.quantity}" step="1"
			placeholder="Nhập số lượng" required>

		<!-- Chi tiết sản phẩm -->
		<label for="detail">Chi tiết sản phẩm:</label>
		<textarea id="detail" name="detail" rows="4"
			placeholder="Nhập chi tiết sản phẩm" required>${products.detail}</textarea>


		<!-- Hình ảnh sản phẩm -->
		<label for="listimg">Hình ảnh sản phẩm:</label> <input type="file"
			id="listimg" name="listimg" multiple accept="image/*">
			
			
			 <input type="submit" value="submit">
	</form>
</body>
</html>
