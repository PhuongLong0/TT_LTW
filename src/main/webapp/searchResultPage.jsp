<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if (request.getAttribute("searchResults") == null) {
		System.out.println("<p>searchResults is null</p>");
	} else {
		System.out.println("<p>searchResults found</p>");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Results search</title>
	<!-- Font Awesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />

	<style>
		body {
			background-color: #f9f9f9;
			margin: 0;
			padding: 0;
		}

		.container {
			width: 90%;
			max-width: 1200px;
			margin: 40px auto;
		}

		.no-results {
			text-align: center;
			font-size: 20px;
			margin-top: 50px;
			color: #888;
		}

		.products {
			background-color: #fff;
			border: 1px solid #ddd;
			border-radius: 12px;
			padding: 20px;
			margin-bottom: 20px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.05);
			transition: transform 0.2s;
		}

		.products:hover {
			transform: translateY(-5px);
		}

		.products img {
			max-width: 100%;
			height: auto;
			margin-top: 10px;
			border-radius: 8px;
		}

		.products h2 {
			color: #333;
			margin-bottom: 10px;
		}

		.products p {
			margin: 6px 0;
		}

		.paging {
			text-align: center;
			margin: 30px 0;
		}

		.paging a {
			margin: 0 5px;
			text-decoration: none;
			padding: 8px 12px;
			background-color: #007bff;
			color: #fff;
			border-radius: 6px;
			transition: background-color 0.2s;
		}

		.paging a:hover {
			background-color: #0056b3;
		}

		header, footer {
			margin-bottom: 30px;
		}

	</style>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="container">
=======
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

>>>>>>> origin/Long-Admin
	<c:if test="${empty searchResults}">
		<p class="no-results">No products found matching your search.</p>
	</c:if>

	<!-- List of products -->
	<c:forEach var="products" items="${searchResults}">
		<div class="products">
<<<<<<< HEAD
			<h2>${products.productName}</h2>
			<p>
				<i class="fas fa-info-circle icon"></i>
				<strong>Description: </strong>${products.productDetail}
			</p>
			<p>
				<i class="fas fa-dollar-sign icon"></i>
				<strong>Cost: </strong>${products.priceSell} VND
			</p>
			<!-- Display images -->
			<div>
				<c:if test="${not empty products.listimg}">
					<img src="${products.listimg[0]}" alt="${products.productName}" />
				</c:if>
=======
			<h2>${products.name}</h2>
			<p>
				<strong>Description:</strong> ${products.detail}
			</p>
			<p>
				<strong>Cost:</strong> $${products.cost}
			</p>

			<!-- Display images -->
			<div>
				<c:forEach var="image" items="${products.listimg}">
					<img src="${image}" alt="${products.name}" />
				</c:forEach>
>>>>>>> origin/Long-Admin
			</div>
		</div>
	</c:forEach>
	<div class="paging">
<<<<<<< HEAD
		<c:forEach begin="1" end="${endPage}" var="i">
			<a href="SearchServlet?query=${searchQuery}&index=${i}">${i}</a>
		</c:forEach>

	</div>
=======
		<c:forEach begin="1" end= "${endPage}" var="i">
    		<a href="#">${i }</a>
    	</c:forEach>
>>>>>>> origin/Long-Admin
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>