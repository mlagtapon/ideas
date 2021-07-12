<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
	<style>
		#nameInput {
			width: 65%;
		}
	</style>
    <meta charset="UTF-8">
    <title>Registration Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

	<div>
		<h1>Welcome!</h1>
		<div id="reg">
		    <h2 style="margin-left:49px; margin-top:50px;">Register</h2>
		
		<%--      <form:errors path="user.*"/> --%>
		    
		        
		
 		    <form:form class="p-5" method="POST" action="/registration" modelAttribute="user">
	    		<div class="form-group row">
	        		<form:label path="name" class="col-sm-2 col-form-label">Name:</form:label>
	        			<div class="col-sm-4">
	        				<p style="color:red;"><form:errors path="name"/></p>
			        		<form:input path="name" id="nameInput" class="form-control"/>
	        			</div>
	    		</div>

	    		 <div class="form-group row">
		            <form:label class="col-sm-2 col-form-label" path="email">Email:</form:label>
		            <div class="col-sm-10">
		            	<p style="color:red;"><form:errors path="email"/></p>
		            	<form:input type="email" path="email" class="form-control w-25"/>
		            </div>
		  		</div>
		  		
		        <div class="form-group row">
		            <form:label class="col-sm-2 col-form-label" path="password">Password:</form:label>
		            <div class="col-sm-10">
		            	<p style="color:red;"><form:errors path="password"/></p>
		            	<form:password path="password" class="form-control w-25"/>
		            </div>
		  		</div>
		        <div class="form-group row">
		            <form:label class="col-sm-2 col-form-label" path="passwordConfirmation">Password Confirmation:</form:label>
		            <div class="col-sm-10">
		            	<p style="color:red;"><form:errors path="passwordConfirmation"/></p>
		            	<form:password path="passwordConfirmation" class="form-control w-25"/>
		            </div>
		  		</div>
		  		  <div class="form-group row">
		    		<div class="col-sm-10 offset-sm-2">
		              <button type="submit" class="btn btn-primary">Register</button>
		    		</div>
		  		</div>
		    </form:form>
		</div>
		<div id="log">
		    <h2 style="margin-left:49px; margin-top:50px;">Login</h2>
		    <p style="color:red; margin-left:189px;"><c:out value="${error}" /></p>
		
		    <p style="color:red; margin-left:189px;">${login_error }</p>
		    <p style="color:red; margin-left:189px;">${ success_error }</p>
		    
			<form action="/login" method="post" class="p-5">
				<div class="form-group row">
				    <label for="email" class="col-sm-2 col-form-label">Email</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control w-25" id="email" name="email">
				    </div>
				</div>
				
				<div class="form-group row">
				    <label for="password" class="col-sm-2 col-form-label">Password</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control w-25" id="password" name="password">
				    </div>
				</div>
				
				
				<div class="form-group row">
				    <div class="col-sm-10 offset-sm-2">
				      <button type="submit" class="btn btn-primary">Sign in</button>
				    </div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>