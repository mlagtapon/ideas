<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Ideas</title>
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
</head>
<body>
	<div class="p-3">
		<div id="nav">
			<h1>Welcome, ${user.name}</h1>
			<a href="/logout"><button id="navbutton" class="btn btn-primary">Logout</button></a>
		</div>
		<div id="outofstate">
			<br><br>
			<h2>Ideas</h2>
			<br><br>
				<table class="table table-hover w-75 p-3 mx-auto">
	    			<thead>
	        			<tr>
	            			<th>Likes</th>
	            			<th>Created By:</th>
	            			<th>Likes</th>
	            			<th>Action</th>
	        			</tr>
	    			</thead>
	    			<tbody>
	        				
	        			<c:forEach items="${allidea}" var="oneIdea">
		        			<tr>
							
	            			<td><a href="/ideas/${oneIdea.id}"><c:out value="${oneIdea.content}"/></a></td>

	            			<td><c:out value="${oneIdea.creator.name}"/></td>
	            			
							<td>
<%-- 								<c:forEach items="${userIdea}" var="oneUserIdea">
	        						<c:if test="${oneUserIdea.ideas.id == oneIdea.id}"> --%>
	        							<c:if test="${oneIdea.users.size() != null}">
	        								<% System.out.println("inside null"); %>
	        								<c:out value="${oneIdea.users.size()}"/>
	        							</c:if>
	        							<c:if test="${oneIdea.users.size() == null}">
	        								<% System.out.println("inside null"); %>
	        								<p>0</p>
	        							</c:if>
<%-- 	        						</c:if>
	        					</c:forEach> --%>
							</td>
							
							<td>
						
							<% boolean liked = false; %>
							<c:if test="${oneIdea.users != null}">
								<c:forEach items="${oneIdea.users}" var="eachuser">
									<c:if test="${eachuser.name == user.name}"> 
									<% liked = true; %>
									</c:if>
								</c:forEach>
							
							<% if (liked == true) { %>
									<form action="/ideas/unlike/${oneIdea.id}" method="post">
						        		<input type="hidden" name="user" value="${user.id}"/>
						        		<button type="submit" class="btn btn-primary">Unlike</button>
									</form>
							<% } else { %>
									<form action="/ideas/like/${oneIdea.id}" method="post">
						        		<input type="hidden" name="user" value="${user.id}"/>
						        		<button type="submit" class="btn btn-primary">Like</button>
									</form>
							<% } %>
						</c:if>
		
						</td>
	        			</tr>
	        			</c:forEach>
	    			</tbody>
				</table>
			</div>
			<br><br>
		<a href="/ideas/new"><button id="align" class="btn btn-primary">Create an Idea</button></a>
	</div>
</body>
</html>