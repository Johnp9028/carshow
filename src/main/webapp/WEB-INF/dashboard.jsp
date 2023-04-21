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

	<div class="d-flex justify-content-evenly">>
			<h1 class="text-center">Welcome, <c:out value="${user.userName}"/></h1><a   class="btn btn-outline-danger"href="/logout">logout</a>
	
	</div>
	<div class="container">

		
		<h3>THE CAR SHOW:</h3>

		<a  type="button" class="btn btn-primary"href="addCar">+ Add a car</a>
		
				<table class="table">
		
			<tr>
				<th>Make</th>
				<th>Model</th>
				<th>Price</th>
				<th>year</th>
				<th>Posted By</th>
			</tr>
			<c:forEach var="car" items="${cars}">
			
				<tr>
					<td><a href="cars/${car.id}"><c:out value="${car.make}"/></a></td>
					<td><c:out value="${car.carmodel}"/></td>
					<td><c:out value="${car.price}"/></td>
					<td><c:out value="${car.year}"/></td>
					<td><c:out value="${car.user.userName}"/></td>
				</tr>
			</c:forEach>
		
		</table>

        

		
		

	</div>

</body>
</html>