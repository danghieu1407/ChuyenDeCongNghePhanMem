<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/login.css" >


    <title>Login</title>
</head>
<body>

<div class="container" id="container">
	<div class="form-container sign-up-container">
	
		 <form:form action="register" method="post" modelAttribute="User">
		 	<h1>Create Account</h1>
		 										
            <form:input path="name" placeholder="Name" type="text" />
			<form:input path="email" placeholder="Email"/>       
			<form:input path="password" placeholder="Password" type="Password"/>     
			<form:input path="phone" placeholder="Phone number"/>   
			<form:input path="address" placeholder="Address"/>            
                 
            <form:button >Register</form:button>
        </form:form>
	</div>


	<div class="form-container sign-in-container">
		<form action="/login" method="post">
			<h1>Sign in</h1>
			<input type="email" name="emaillogin" placeholder="Email" />
			<input type="password" name ="passwordlogin" placeholder="Password" />
			<a href="#">Forgot your password?</a>
			<button>Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with Dang Hieu - Bao Thai - Hoai Bao</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<p>
		Created <i class="fa fa-heart"></i> by
		Dang Hieu - Bao Thai - Hoai Bao
	</p>
</footer>
<Script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
</Script>


</body>

</html>