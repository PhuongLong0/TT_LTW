<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản Lý Đơn Hàng</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
}

h1 {
	text-align: center;
	margin: 20px 0;
	color: #4CAF50;
}

table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

.actions button {
	padding: 5px 10px;
	margin: 0 5px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-view {
	background-color: #2196F3;
	color: white;
}

.btn-edit {
	background-color: #FF9800;
	color: white;
}

.btn-delete {
	background-color: #f44336;
	color: white;
}

.btn-view:hover, .btn-edit:hover, .btn-delete:hover {
	opacity: 0.8;
}
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>

	<h1>Quản Lý Đơn Hàng</h1>

	<table>
		<thead>
			<tr>
				<th>Mã Đơn Hàng</th>
				<th>Ngày Lập Hóa Đơn</th>
				<th>Giá Tiền</th>
				<th>Trạng Thái Đơn Hàng</th>
				<th>Hành Động</th>
			</tr>
		</thead>
		<tbody>
			<!-- Sử dụng JSTL để duyệt danh sách đơn hàng -->
			<c:forEach var="order" items="${orders.all()}">
				<tr>
					<td>${order.id}</td>
					<td>${order.ngaylaphoadon}</td>
					<td>${order.price() } $</td>
					<td><c:choose>
							<c:when test="${order.pheduyet}">
								<span style="color: green; font-weight: bold;">Đã Phê
									Duyệt</span>
							</c:when>
							<c:otherwise>
								<span style="color: red; font-weight: bold;">Chưa Phê
									Duyệt</span>
							</c:otherwise>
						</c:choose></td>
					<td class="actions">
						<button class="btn-view"
							onclick="location.href='DuyetDonHangServlet?id=${order.id}'">Phê
							duyệt</button>

					</td>
				</tr>
			</c:forEach>
			<!-- Hiển thị thông báo nếu không có đơn hàng -->
			<c:if test="${empty orders}">
				<tr>
					<td colspan="4">Không có đơn hàng nào.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

</body>
</html>
