<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<c:if test="${empty searchResults}">
		<p class="no-results">No products found matching your search.</p>
	</c:if>

	<!-- List of products -->
	<c:forEach var="products" items="${searchResults}">
		<div class="products">
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
			</div>
		</div>
	</c:forEach>
	<div class="paging">
		<c:forEach begin="1" end= "${endPage}" var="i">
    		<a href="#">${i }</a>
    	</c:forEach>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>