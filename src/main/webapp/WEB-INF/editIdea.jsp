<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#sub {
		margin-left:-10%;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<div id="wrapper">
		<div id="edit">
		    <h2 style="margin-left:49px; margin-top:50px;">Edit ${anIdea.content}</h2>
		
		    <p style="color:red; margin-left:49px;"><form:errors path="user.*"/></p>
		    
		        
		
		    <form:form class="p-5" method="POST" action="/ideas/edit/${anIdea.id}" modelAttribute="idea">
	    		<div class="form-group row">
	        		<form:label path="content" class="col-sm-1 col-form-label"> Content:</form:label>
	        			<div class="col-sm-4">
			        		<form:errors path="content"/>
			        		<form:input path="content" class="form-control" value="${anIdea.content}"/>
	        			</div>
	    		</div>
						<form:input path="creator" type="hidden" value="${user.id}"/>
		  		  <div class="form-group row">
		    		<div class="col-sm-10 offset-sm-2">
		              <button type="submit" id="sub" class="btn btn-primary">Update</button> <a href="/ideas"><button class="btn btn-primary">Back</button></a>
		    		</div>
		  		</div>
		    </form:form>
		</div>
	</div>
</body>
</html>