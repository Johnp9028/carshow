<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<meta charset="UTF-8">
	<title>Shows</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1 class="text-center"><c:out value="${car.make}"/></h1>
		<h1 class="text-center"><c:out value="${car.carmodel}"/></h1>
		

		
		<div class="container">
			<h4>Posted by: <c:out value="${car.user.userName}"/></h4>
		
			
			<p>model: <span>  </span> <c:out value="${car.carmodel}"/></p>
			<p>price: <span>  </span> <c:out value="${car.price}"/></p>
			<p>year: <span>  </span> <c:out value="${car.year}"/></p>
			
			<p> description <span>  </span><c:out value="${car.description}"/></p>
			<hr />
			<c:if test="${idInSession==car.user.id}"> 
				<a href="/car/edit/${car.id}"><c:out value="edit"></c:out></a>
			</c:if>
			
					<a href="/home">back to show room</a>
		</div>
		<div class="text-center">
				<p>for inquires about this car please contact</p><c:out value="${car.user.email}"/>
		
		</div>
		
		
	</div>

</body>
</html>