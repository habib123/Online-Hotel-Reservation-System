<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="main">
					<p>Login Form</p>
				<p>	$(error)<p>
					<form class="cmxform" id="signupForm" method="post" action="login_cust"">
						<fieldset>
							<legend>Complete the form with your information</legend>
							<p>
								<label for="username">Username</label>
								<input id="username" name="username" type="text" class="center">
							</p>
							<p>
								<label for="password">Password</label>
								<input id="password" name="password" type="password" class="center">
							</p>
							<p>
								<label for="email">Email</label>
								<input id="email" name="email" type="email" class="center">
							</p>
							<p>
								<input class="submit" type="submit" value="Submit">
							</p>
						</fieldset>
					</form>
				</div>
				
   
            



</body>
</html>