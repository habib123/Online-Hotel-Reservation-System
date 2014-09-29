<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login Form</title>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    
    
    <script src="lib/jquery.js"></script>
	<script src="dist/jquery.validate.js"></script>
	<script>

	$().ready(function() {
		// validate the comment form when it is submitted
		//$("#commentForm").validate();

		// validate signup form on keyup and submit
		$("#signin").validate({
			rules: {
				firstname: "required",
				lastname: "required",
				address: "required",
				username: {
					required: true,
					minlength: 2
				},
				password: {
					required: true,
					minlength: 5
				},
				confirm_password: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true
				},
				agree: "required"
			}, 
			messages: {
				firstname: "Please enter your firstname",
				lastname: "Please enter your lastname",
				address: "Please enter your address",
				username: {
					required: "Please enter a username",
					minlength: "Your username must consist of at least 2 characters"
				},
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
				confirm_password: {
					required: "Please provide a password",
					minlength: "Your password must be 5 characters long",
					equalTo: "Please enter the same password as above"
				},
				email: "Please enter a valid email address",
				agree: "Please accept our policy"
			}
		});


		
	});
	</script>
	
	
    <style>
    .error{
    color: red;
    }
     .error1{
    color: green;
    margin-left: 480px; !important;
    //margin-right: auto !important;
    
    }
    </style>

</head>

<body>

  <body>
  			    <c:if test="${not empty message }">
				    <h3 class="error1">${message}</h3>
			    </c:if>
	<div class="login">
		<div class="login-screen">
			<div class="app-title">

				<h1 style="color:#0099FF;">Login</h1>
			</div>
				
			<div class="login-form">
			<form id="signin" method="post" action="status">

				<c:if test="${not empty error}">
				    <h3 class="error">${error}</h3>
				</c:if>
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" id="login-name" name="username">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass" name="password">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
                 <input class="btn btn-primary btn-large btn-block" type="submit" value="login">
				
			</form>	
			</div>
		</div>
	</div>
</body>

</body>

</html>

