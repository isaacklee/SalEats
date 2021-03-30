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
		<style>
 			 a:link {
  				text-decoration: none;
			}	
		</style>
    	 

		<script src ="/Assignment4/googlemap.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key="></script>
	
	
	</head>
	<body>
	
	
		<nav class="navbar" style="margin-left:100px; margin-right:100px">
   			<a class="navbar-brand head" href="index.jsp" >
   				<h1>SalEats!</h1>
   			</a>	
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
		
		<div class = "container" >
			<img src="image.jpg" class="img-fluid rounded" alt="Responsive image">
		</div>
		<br>
		<div class = "container" >
			<form name="searchform" method="GET" action="SearchServlet">
				<input type="hidden" name="resultpage" value="index">
  				<div class="form-row">
  				  	<div class="col-7">
      					<input type="text" name="name" class="form-control" placeholder="Restaurant Name" >
      					<%if(request.getAttribute("error1")!=null){
							String error_message = (String) request.getAttribute("error1");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
   					 </div>
   					 <div class="space"></div>
   					 
   					 <div >
   					 	<button class = "btn btn-primary " style="background-color : #990000 !important"  type = "submit">
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
	  						<input type="radio" id="rating" name="button" class="custom-control-input" value="rating">
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
    					<input id ="lat" name="latitude" type="number" class="form-control"  placeholder="Latitude" step="0.01" min="-1000" max="1000"  oninvalid="return false">
    					<%if(request.getAttribute("error2")!=null){
							String error_message = (String) request.getAttribute("error2");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
					</div>
					<div class = "col-4">
    					<input id="long" name="longitude" type="number" class="form-control"  placeholder="Longitude" step="0.01" min="-1000" max="1000"  oninvalid="return false">
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
    			
    	</div>
    			
    	<div id="map" style="z-index:-1; width:50%;height:400px; position:relative; margin:auto; margin-top:-400px;display:none"></div>
    	
    			
		
	</body> 
</html>
