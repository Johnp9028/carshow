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
	<title>CAR SHOW</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<h1 class="text-center">CAR SHOW DATABASE!</h1>
<div  class="container-sm">



	<h2 class="fst-italic">Register</h2>

	<div class="container">
		<form:form action="/register" modelAttribute="newUser" class="form">
		
			<div class="form-row">
			 	<form:errors path="userName"/>
				<form:label for="userName" path="userName">User Name:</form:label>
				<form:input type="text" path="userName" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="password" path="password" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="confirm"/>
				<form:label for="" path="confirm">Confirm:</form:label>
				<form:input type="password" path="confirm" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>
	
	<h2>Log In</h2>

	<div class="container">
		<form:form action="/login" modelAttribute="newLogin" class="form">
			<div class="form-row">
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="password" path="password" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
		
		</form:form>
	</div>

</div>

</body>
</html>