<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-form {
	background: #fff;
	padding: 20px 30px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	width: 100%;
}

h1 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

label {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px;
	border-radius: 5px;
	width: 100%;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.error {
	color: red;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="login-form">
		<h1>Đăng Nhập</h1>
		<c:if test="${not empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
		<form action="AdminLoginServlet"
			method="post">
			<label for="email">Email:</label> <input type="text" id="email"
				name="email" placeholder="Nhập email" required> <label
				for="password">Mật khẩu:</label> <input type="password"
				id="password" name="password" placeholder="Nhập mật khẩu" required>

			<input type="submit" value="Đăng Nhập">
		</form>
	</div>
</body>
</html>
