<%@ page language="java" %>
<!DOCTYPE html> <!-- default -->
<html>
	<head>
		<meta charset="UTF-8"> <!--  default charset can change to chinese or whatever -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>SalEats</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" href="/Assignment4/fontawesome-free-5.13.0-web/css/all.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<style>
 			 a:link {
  				text-decoration: none;
			}	
		</style>
		<script src ="/Assignment4/googlemap.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFgwJ77ovXcaWwmOfUBSu0wbwDyJENl4I"></script>
		
		
	
		
		
		<script>
			function error(){
				document.getElementById("error").innerHTML = "<div style=\"color:red\"> First sign in</div>";	
			}
		
			function addFavorite(){
				console.log(document.getElementById('rid').value);
				console.log( document.getElementById("name").value);
				console.log( document.getElementById("number").value);
				console.log(document.getElementById("rating").value);
				console.log( document.getElementById("image").value);
				console.log( document.getElementById("username").value);
				$.ajax({
					url: "FavoritesServlet",
					data:{
						restaurantid: document.getElementById("rid").value,
						name: document.getElementById("name").value,
						number:document.getElementById("number").value,
						cuisine :document.getElementById("cuisine").value,
						price : document.getElementById("price").value,
						rating : document.getElementById("rating").value,
						username : document.getElementById("username").value,
						address : document.getElementById("address").value,
						imageurl : document.getElementById("image").value,
						url : document.getElementById("url").value,
						
					
						
					},
					success: function (result){
						result=result.trim();
						console.log(result);
						if(result=='false'){
							document.getElementById("add_remove").innerHTML="<div style=\"color:gray\"><i class=\"fas fa-star\" ></i> Add to Favorites </div>";
						}
						else if(result=='true'){
							document.getElementById("add_remove").innerHTML="<div style=\"color:gray\"><i class=\"fas fa-star\" style=\"color:gray\"></i> Remove from Favorites </div>";
						}
					}
				});	
			}
			
			function addReservation(){
				//console.log(document.getElementById('rid').value);
			
				document.getElementById("add_reservation").innerHTML+="<div class=\"row\"><div class=\"col-6\"><input type=\"date\" id=\"date\" name=\"date\" placeholder=\"date\"></div><div class=\"col-6\"><input type=\"time\" id=\"time\" name=\"time\" placeholder=\"time\"></div></div><input type=\"text\" style=\"width:100%; height:50px\" /><button class = \"btn btn-lg btn-block\"style=\"background-color:#990000\" onclick=\"addReservation();\" id=\"add_reservation\" value=\"value\"><div style=\"color:white\"><i class=\"far fa-calendar-plus\"></i> Submit Reservation</div></button>";
				
			}
		
		</script>
		
		
	</head>
	
	<body>
		
		<nav class="navbar" style="margin-left:100px; margin-right:100px">
   			<a class="navbar-brand head" href="index.jsp">
   				<h1>SalEats!</h1>
   			</a>
   			<%String username = (String)session.getAttribute("username"); %>	
   			<% if(session.getAttribute("username")==null){ %>
   			<div class="navbar-right">
     			 <a href="index.jsp" class = "text-secondary">Home </a>
     			 <a href="loginsignup.jsp" class = "text-secondary"> Login</a> / 
     			 <a href="loginsignup.jsp" class = "text-secondary">Sign Up</a>
  			  </div> 
  			  <%}else{ %>
  			  <div class="navbar-right">
     			 <a href="index.jsp" class = "text-secondary">Home </a>
     			 <a href="favorites.jsp" class = "text-secondary"> Favorites</a> / 
     			 <a href="LogoutServlet" class = "text-secondary">Logout</a>
  			  </div> 
  			  <%} %>
		</nav>
		
		<hr>
		
		
	
		<div class = "container">
			<form name="searchresultform" method="GET" action="SearchServlet">
				<input type="hidden" name="resultpage" value="result">
  				<div class="form-row" >
  				  	<div class="col-7">
      					<input type="text" name="name" class="form-control" placeholder="Restaurant Name" >
      					<%if(request.getAttribute("error1")!=null){
							String error_message = (String) request.getAttribute("error1");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
   					 </div>
   					 <div class="space"></div>
   					 
   					 <div >
   					 	<button class = "btn btn-primary" style="background-color : #990000 !important"type = "submit">
   				 			<i class="fas fa-search white"></i>
   						 </button>
   					</div>
   					
   				 <!-- Radio Button -->
   					 
   					 <div class = "col mb-1">
	   					 <div class="custom-control custom-radio custom-control-inline">
	  						<input type="radio" id="match" name="button" class="custom-control-input" value="best_match" >
	 						 <label class="custom-control-label text-secondary" for="match">Best Match</label>
						</div>
					
						
						<div class="custom-control custom-radio custom-control-inline">
	  						<input type="radio"  name="button" class="custom-control-input" value="rating">
	 						 <label class="custom-control-label text-secondary" for="rating">Rating</label>
						</div>
						
						<%if(request.getAttribute("error4")!=null){
							String error_message = (String) request.getAttribute("error4");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
					</div>
					
					<div class = "col mb-2">
						<div class="custom-control custom-radio custom-control-inline">
	  						<input  type="radio" id="review" name="button" class="custom-control-input" value="review_count">
	 						 <label class="custom-control-label text-secondary" for="review">Review Count</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
	  						<input type="radio" id="distance" name="button" class="custom-control-input" value="distance">
	 						 <label class="custom-control-label text-secondary" for="distance">Distance</label>
						</div>
						
					</div>
    			</div>
    			
    			<div class = "form-row">
    				<div class = "col-4">
    					<input id = "lat" name="latitude" type="number" class="form-control"  placeholder="Latitude" step="0.01" min="-1000" max="1000" value="latitude">
    					<%if(request.getAttribute("error2")!=null){
							String error_message = (String) request.getAttribute("error2");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
					</div>
					<div class = "col-4">
    					<input id ="long" name="longitude" type="number" class="form-control"  placeholder="Longitude" step="0.01" min="-1000" max="1000" value="longitude" >
    					<%if(request.getAttribute("error3")!=null){
							String error_message = (String) request.getAttribute("error3");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
					</div>	
					<div class = "col-4">
						<button type="button" onclick="initMap()" class="btn btn-primary">
						<i class="fas fa-map-marker-alt"></i>Google Maps (Drop a pin!)
						</button>
					</div>
											
    			</div>
    		</form>
    		<div id="map" style="z-index:-1; width:50%;height:400px; position:relative; margin:auto; margin-top:-100px;display:none"></div>			
    		
    		</div>
    		<br>
    		<br>
    		
    		<%String name = request.getParameter("userId");%>
			<p style="color:gray; font-size:30px; margin-left:120px">  <%=name %> </p>
			<br>
			<hr width="78%">
			
			<%String imageurl = request.getParameter("imageurl"); %>
			<%String address = request.getParameter("address"); %>
			<%String number = request.getParameter("number"); %>
			<%String category = request.getParameter("category"); %>
			<%String price = request.getParameter("price"); %>
			<%String rating = request.getParameter("rating"); %>
			<%String url = request.getParameter("url"); %>
			<%String id = request.getParameter("id");%>
			
			
			<div class="container">
				<div class="row">
					<div class="col-4">
						<a href="<%=url %>">
							<img src="<%=imageurl%>"  class="img-thumbnail" style="width:380px;height:250px">
						</a>
					</div>
					<div class="col-1"></div>
					<div class="col-7">
						
						<p style="color:gray; font-size:20px;">Address :  <%=address %> </p>
						<p style="color:gray; font-size:20px;">Phone No :  <%=number %> </p>
						<p style="color:gray; font-size:20px;">Cuisine :  <%=category %> </p>	
						<p style="color:gray; font-size:20px;">Price :  <%=price %> </p>
						<p style="color:gray; font-size:20px;">Rating :  <%if(rating.equals("4.0")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
																		<%}%> 
																		<% if(rating.equals("5.0")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
																		<%}%> 
																		<% if(rating.equals("3.0")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
																		<%}%> 
																		<% if(rating.equals("2.0")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i>
																		<%}%> 
																		<% if(rating.equals("1.0")) {%>
																		<i class="fas fa-star"></i>	
																		<%}%> 
																		<% if(rating.equals("1.5")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star-half"></i>
																		<%}%> 
																		<% if(rating.equals("2.5")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>
																		<%}%> 
																		<% if(rating.equals("3.5")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>
																		<%}%>
																		<%if(rating.equals("4.5")) {%>
																		<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>
																		<%}%> 
						</p>
					</div>
					
					<hr width="100%">
					<%@page import = "SalEats.*" %>
					<!--  <form name ="favoriteform" method="GET" action="FavoritesServlet" >-->
						<input type="hidden" name="name" id="name" value="<%=name%>"/>
						<input type="hidden" name="address" id="address" value="<%=address%>"/>
						<input type="hidden" name="number" id="number" value="<%=number%>"/>
						<input type="hidden" name="cuisine" id="cuisine" value="<%=category%>"/>
						<input type="hidden" name="price" id="price" value="<%=price%>"/>
						<input type="hidden" name="rating" id="rating" value="<%=rating%>"/>
						<input type="hidden" name="username" id="username" value="<%=username%>"/>
						<input type="hidden" name="id" id= "rid" value="<%=id%>"/>
						<input type="hidden" name="imageurl" id= "image" value="<%=imageurl%>"/>
						<input type="hidden" name="url" id= "url" value="<%=url%>"/>
						
						<% if(session.getAttribute("username")!=null){%>
							
							<button class = "btn btn-lg btn-block" style="background-color:#FFCC00" onclick="addFavorite();" id="add_remove" value="value">
			   					<div style="color:gray">
				   					<% if(SalEats.Database.existingRestaurant(name)){%>
				   						<i class="fas fa-star"></i> Remove from Favorites
				   					<%}else{ %>	
				   						<i class="fas fa-star"></i> Add to Favorites
	   								<%} %>
	   							</div>	
	   						</button>	
   						<%} %>
   						
   						<% if(session.getAttribute("username")==null){%>
   							
   							<button class = "btn btn-lg btn-block" style="background-color:#FFCC00" onclick="error();" id="error" value="value">
			   					<div style="color:gray">
				   					<i class="fas fa-star"></i> Add to Favorites
	   								
   						<%} %>		
   								
			   				</div>
			   			</button>
			   		<!--  </form>-->
			   		
		   			<br>
		   			<button class = "btn btn-lg btn-block"style="background-color:#990000" onclick="addReservation();" id="add_reservation" value="value">
		   				<div style="color:white">
		   					<i class="far fa-calendar-plus"></i> Add Reservation
		   					
		  	
		   					
		   				</div>
		   				
		   			</button>
		   			
				</div>
			</div>
			

	</body>
</html>