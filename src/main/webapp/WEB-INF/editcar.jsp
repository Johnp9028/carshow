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

	<h1 class="text-center">Edit car</h1>
	<h1 class="text-center"><c:out value="${car.make}"/></h1>

	<a href="/home">back to show room</a>

	<div class="container">
		<form:form action="/cars/${car.id}/edit" modelAttribute="car" class="form" method="put">
		
			<div class="form-row">
			 	<form:errors path="make" class="error"/>
				<form:label for="make" path="make">make:</form:label>
				<form:input type="text" path="make" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="carmodel" class="error"/>
				<form:label for="carmodel" path="carmodel">model:</form:label>
				<form:input type="text" path="carmodel" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="price" class="error"/>
				<form:label for="price" path="price">price:</form:label>
				<form:input type="text" path="price" class="form-control"/>
			</div>
			<div class="form-row">
				<form:errors path="year" class="error"/>
				<form:label for="year" path="year">year:</form:label>
				<form:input type="text" path="year" class="form-control"/>
			</div>
			
			
			<div class="form-row">
				<form:errors path="description" class="error"/>
				<form:label for="description" path="description">Thoughts:</form:label>
				<form:textarea path="description" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
		
	</div>
				<a class="btn btn-outline-danger" href="/car/delete/${car.id}"><c:out value="delete"></c:out></a>



</div>

</body>
</html>