<%@ page language="java" %>
<!DOCTYPE html> <!-- default -->
<html>
	<head>
		<meta charset="UTF-8"> <!--  default charset can change to chinese or whatever -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>SalEats</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" href="/Assignment4/fontawesome-free-5.13.0-web/css/all.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		
		<style>
 			 a:link {
  				text-decoration: none;
			}	
		</style>
		<script src="https://apis.google.com/js/platform.js?onload=googlesignin" async defer></script>
		<meta name="google-signin-client_id" content="498792960961-rllkqui1j8n3cigmqq33amchejf38ahl.apps.googleusercontent.com">
	
		<script>
			function googlesignin(){
				console.log('entered');
				gapi.load('auth2', function() {
					auth2 = gapi.auth2.init({
					      client_id: '498792960961-rllkqui1j8n3cigmqq33amchejf38ahl.apps.googleusercontent.com',
					      scope: 'profile'
					  });
					var button = document.getElementById("gsignin");
					console.log(button);
					auth2.attachClickHandler(button,{},success,fail);		
			});	
			
			}
				
			function success(user){
				var profile = user.getBasicProfile();
				console.log("ID = "+profile.getId());
				console.log("name = "+profile.getName());
				console.log("email = "+profile.getEmail());
				
				var form = document.createElement("form");
				form.setAttribute('method','post');
				form.setAttribute('action','SigninServlet');
				var input = document.createElement("input");
				input.name = "googlesignin";
				input.type = 'text';
				input.value = "1";
				var inputName = document.createElement("input");
				inputName.name = "username";
				inputName.type = 'text';
				inputName.value = profile.getName();
				
				var inputEmail = document.createElement("input");
				inputEmail.name = "email";
				inputEmail.type = 'text';
				inputEmail.value = profile.getEmail();
				
				form.appendChild(inputEmail);
				form.appendChild(input);
				form.appendChild(inputName);
				document.body.appendChild(form);
				form.submit();	
			}	
			
			function fail(){
				
			}
		
		</script>	
	</head>
	
	<body>
		<%
			String username = request.getParameter("username");
			if(username == null){
				username="";
			}
			String password = request.getParameter("password");
			if(password == null){
				password="";
			}
			
			String usererror =(String)request.getAttribute("error1");
			if(usererror==null){
				usererror="";
			}
			String passworderror = (String)request.getAttribute("error2");
			if(passworderror==null){
				passworderror="";
			}
		%>

		<nav class="navbar" style="margin-left:100px; margin-right:100px" >
   			<a class="navbar-brand head" href="index.jsp">
   				<h1>SalEats!</h1>
   			</a>	
   			<div class="navbar-right">
     			 <a href="index.jsp" class="text-secondary">Home </a>
     			 <a href="loginsignup.jsp" class="text-secondary"> Login</a> / 
     			 <a href="loginsignup.jsp" class="text-secondary">Sign Up</a>
  			  </div> 
		</nav>
		
		<hr>
		
		<div class="container">
			<div class="form row" style="color:gray">
				<div class="col" >
					<h3> Login </h3>
				</div>
				<div class="col">
					<h3> Sign Up</h3>
				</div>
			</div>
		</div>
		
		<div class = "container">
			
			
					<div class = "form row">
						
						<div class = "col-6">
							<form name ="loginform" method="GET" action="SigninServlet" >
								<div class="form-group">
			   						 <label for="username" style="color:gray">Username</label>
			    						<input type="text" class="form-control" name="username" placeholder="Username" value="<%=username%>">
			    						<%if(request.getAttribute("error1")!=null){
											String error_message = (String) request.getAttribute("error1");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
										
			  					</div>
			  					<div class="form-group">
			  				  		<label for="password" style="color:gray">Password</label>
			   						 <input type="password" class="form-control" name="password" placeholder="Password">
			   							<%if(request.getAttribute("error2")!=null){
											String error_message = (String) request.getAttribute("error2");%>
										<p style="color:red" ><%=error_message%></p>
										<%} %>
										<%if(request.getAttribute("err3")!=null){
											String error_message = (String) request.getAttribute("err3");%>
										<p style="color:red" ><%=error_message%></p>
										<%} %>
			 					</div>
			 					
		   					 	<div class = "cardinal">
		   					 		<button class = "btn btn-lg btn-block roundbutton" type = "submit" name="submit" value="value">
		   				 			<div class="white">	<i class="fas fa-sign-in-alt white"></i> Sign In</div>
		   							 </button>	 
		   						</div>
	   					 	
		   					 	<hr width="50%">
		   					 	
		   					 	
		   						<!--  <div class="g-signin2" name="googlesubmit" data-onsuccess="onSignIn" ></div>-->
	   						</form>
	   						<div class="white">
		   					 		<button type="button" class = "btn btn-primary btn-lg btn-block" id="gsignin" >
		   				 				<i class="fab fa-google "></i> Sign In with Google
		   							 </button>
		   					</div>
		 				</div>
	 				
	 				
		 				<div class = "col-6">
		 					<form name ="signupform" method="GET" action="SignupServlet" >
								<div id="errormessage"></div>
			 					<div class="form-group">
			    					<label for="email"style="color:gray">Email</label>
			    					<input type="email" class="form-control" name="email" placeholder="name@example.com">
			    					<%if(request.getAttribute("emailerror")!=null){
											String error_message = (String) request.getAttribute("emailerror");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
			 					 </div>
			 					<div class="form-group">
			   						 <label for="username"style="color:gray">Username</label>
			    					<input type="text" class="form-control" name="username" placeholder="Enter username">
			    					<%if(request.getAttribute("usererror")!=null){
											String error_message = (String) request.getAttribute("usererror");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
										<%if(request.getAttribute("error3")!=null){
											String error_message = (String) request.getAttribute("error3");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
			  					</div>
			  					<div class="form-group">
			  				  		<label for="password"style="color:gray">Password</label>
			   						 <input type="password" class="form-control" name="password" placeholder="Enter password">
			   						 <%if(request.getAttribute("passworderror")!=null){
											String error_message = (String) request.getAttribute("passworderror");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
			 					 </div>
			 					 <div class="form-group">
			  				  		<label for="confirm_password"style="color:gray">Confirm Password</label>
			   						 <input type="password" class="form-control" name="confirm_password" placeholder="Enter password">
			   						 <%if(request.getAttribute("confirmerror")!=null){
											String error_message = (String) request.getAttribute("confirmerror");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
									<%if(request.getAttribute("matcherror")!=null){
											String error_message = (String) request.getAttribute("matcherror");%>
										<p  style="color:red" ><%=error_message%></p>
										<%} %>
			 					 </div>
			 					 
			 					
			 					 <input type="checkbox" name="checkbox" value="c"> 
			 					  <label class="checkbox-inline text-secondary">I have read and agree to all terms and conditions of SalEats</label>
			 							 <%if(request.getAttribute("checkboxerror")!=null){
											String error_message = (String) request.getAttribute("checkboxerror");%>
											<p  style="color:red" ><%=error_message%></p>
										<%} %>
		   					 	<div class = "cardinal">
		   					 		<button class = "btn btn-lg btn-block" type = "submit" name="submit" value="value">
		   				 				<div class="white"><i class="fas fa-user-plus"></i> Create Account</div>		
		   							 </button>
		   						</div>
	   					 	</form>	
		 				</div>
	 				</div>
				
		
		</div>
		
		
	</body> 
</html>