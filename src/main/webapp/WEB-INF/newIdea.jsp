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
<title>Create</title>
</head>
<body>
	<div id="create">
		    <h2 style="margin-left:49px; margin-top:50px;">Create a New Idea</h2>
		
		    <p style="color:red; margin-left:49px;"><form:errors path="user.*"/></p>
		    
		        
		
		    <form:form class="p-5" method="POST" action="/ideas/newIdea" modelAttribute="idea">
	    		<div class="form-group row">
	        		<form:label path="content" class="col-sm-1 col-form-label"> Content:</form:label>
	        			<div class="col-sm-4">
			        		<form:errors path="content"/>
			        		<form:input path="content" class="form-control"/>
	        			</div>
	    		</div>
						<form:input path="creator" type="hidden" value="${user.id}"/>
		  		  <div class="form-group row">
		    		<div class="col-sm-10 offset-sm-2">
		              <button type="submit" id="sub" class="btn btn-primary">Create</button>
		    		</div>

		  		</div>
		   </form:form>
	</div>
</body>
</html>