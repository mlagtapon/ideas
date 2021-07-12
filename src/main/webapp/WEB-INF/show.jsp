<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#navbutt {
		margin-left: 12%;
	}
	
	a{
		margin-right: 10px;
	}
	p {
		margin-right: 10px;
	}
	h1{
		padding-bottom: 15px;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Course</title>
</head>
<body>
	<div class="p-3">
		<h1><c:out value="${oneIdea.content}" /></h1>

		<p>Created by: <c:out value="${oneIdea.creator.name}" /></p>
		
		<h2>Users who liked your idea:</h2>
		
		<div id="outofstate">
					<table class="table table-hover w-75 p-3 mx-auto">
		    			<thead>
		        			<tr>
		            			<th>Name:</th>
		        			</tr>
		    			</thead>
		    			<tbody>
		    				
		        			<c:forEach items="${oneIdea.users}" var="oneUser">
		        			<tr>
		            			<td><c:out value="${oneUser.name}"/></td>
		        			</tr>
		        			</c:forEach>
	
		    			</tbody>
					</table>
				</div>
			<br><br>
		<div id="navbutt">
			<a href="/ideas/${oneIdea.id}/edit"><button class="btn btn-primary">Edit</button></a>
			<a href="/ideas"><button class="btn btn-primary">Back</button></a>
			<a href="/ideas/delete/${oneIdea.id}"><button class="btn btn-primary">Delete</button></a>
			<p><c:out value="${not_user_error}"/></p>
		</div>
	</div>
</body>
</html>