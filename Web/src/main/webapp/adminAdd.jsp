<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm sản phẩm</title>
<style>
    form {
        margin: 20px auto;
        max-width: 400px;
    }
    label {
        display: block;
        margin: 10px 0 5px;
    }
    input, select, textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
    }
    button {
        padding: 10px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    button:hover {
        background-color: #45a049;
    }
    .error {
        color: red;
        margin-bottom: 15px;
    }
</style>
</head>
<body>
    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <h1>Thêm sản phẩm mới</h1>

    <!-- Hiển thị thông báo lỗi (nếu có) -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
        <!-- Tên sản phẩm -->
        <label for="name">Tên sản phẩm:</label>
        <input type="text" id="name" name="name" placeholder="Nhập tên sản phẩm" required>

        <!-- Danh mục -->
        <label for="category">Danh mục:</label>
        <select id="category" name="category" required>
            <option value="" disabled selected>Chọn danh mục</option>
            <c:choose>
                <c:when test="${not empty products.getCategories()}">
                    <c:forEach var="category" items="${products.getCategories()}">
                        <option value="${category.category}">${category.category}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option disabled>Không có danh mục nào</option>
                </c:otherwise>
            </c:choose>
        </select>

        <!-- Giá -->
        <label for="cost">Giá:</label>
        <input type="number" id="cost" name="cost" step="0.01" placeholder="Nhập giá sản phẩm" required>

        <!-- Số lượng -->
        <label for="quantity">Số lượng:</label>
        <input type="number" id="quantity" name="quantity" step="1" placeholder="Nhập số lượng" required>

        <!-- Chi tiết sản phẩm -->
        <label for="detail">Chi tiết sản phẩm:</label>
        <textarea id="detail" name="detail" rows="4" placeholder="Nhập chi tiết sản phẩm" required></textarea>

        <!-- Hình ảnh sản phẩm -->
        <label for="listimg">Hình ảnh sản phẩm:</label>
        <input type="file" id="listimg" name="listimg" multiple accept="image/*">

       <input type="submit" value="submit">
    </form>
</body>
</html>
