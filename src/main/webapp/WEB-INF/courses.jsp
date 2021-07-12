<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#align {
		margin-left:12%;
	}
	#nav {
		display:flex;
		justify-content:space-between;
	}
	
	#navbutton {
		margin-right:20px;
	}
	
	h2 {
		margin-left:12%;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Courses </title>
</head>
<body>
	<div class="p-3">
		<div id="nav">
			<h1>Welcome, ${user.name}</h1>
			<a href="/logout"><button id="navbutton" class="btn btn-primary">Logout</button></a>
		</div>
		<div id="outofstate">
			<br><br>
			<h2>Courses</h2>
			<br><br>
				<table class="table table-hover w-75 p-3 mx-auto">
	    			<thead>
	        			<tr>
	            			<th>Courses</th>
	            			<th>Instructor</th>
	            			<th>Sign Ups</th>
	            			<th>Action</th>
	        			</tr>
	    			</thead>
	    			<tbody>
	        				
	        			<c:forEach items="${allCourse}" var="oneCourse">
		        			<tr>
							
	            			<td><a href="/courses/${oneCourse.id}"><c:out value="${oneCourse.name}"/></a></td>

	            			<td><c:out value="${oneCourse.instructor}"/></td>
	            			
							<td><c:out value="${oneCourse.users.size()}" />/<c:out value="${oneCourse.capacity}" /></td>
							<td>
						
						<c:if test="${oneCourse.users.size() != oneCourse.capacity}">
							<% boolean joining = false; %>
							<c:if test="${oneCourse.users != null}">
								<c:forEach items="${oneCourse.users}" var="eachuser">
									<c:if test="${eachuser.name == user.name}"> 
									<% joining = true; %>
									</c:if>
								</c:forEach>
							</c:if>
							
							<% if (joining == true) { %>
									Already Added
							<% } else { %>
									<form action="/join/${oneCourse.id}" method="post">
						        		<input type="hidden" name="user" value="${user.id}"/>
						        		<button type="submit" class="btn btn-primary">Add</button>
									</form>
							<% } %>
						</c:if>
						<c:if test="${oneCourse.users.size() == oneCourse.capacity}">
							<span style="color:red;">Full</span>
						</c:if>
		
							</td>
	        			</tr>
	        			</c:forEach>
	    			</tbody>
				</table>
			</div>
			<br><br>
		<a href="/courses/new"><button id="align" class="btn btn-primary">Add a course</button></a>
	</div>
</body>
</html>