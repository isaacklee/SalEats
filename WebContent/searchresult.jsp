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
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFgwJ77ovXcaWwmOfUBSu0wbwDyJENl4I"></script>
	
	</head>
	
	<body>
		
		<nav class="navbar" style="margin-left:100px; margin-right:100px">
   			<a class="navbar-brand head" href="index.jsp">
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
   					 	<button class = "btn btn-primary" style="background-color : #990000 !important" type = "submit">
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
    					<input id ="lat" name="latitude" type="number" class="form-control"  placeholder="Latitude" step="0.000001" min="-1000" max="1000" value="lat" oninvalid="return false">
    					<%if(request.getAttribute("error2")!=null){
							String error_message = (String) request.getAttribute("error2");%>
							<p  style="color:red" ><%=error_message%></p>
						<%} %>
					</div>
					<div class = "col-4">
    					<input id="long" name="longitude" type="number" class="form-control"  placeholder="Longitude" step="0.000001" min="-1000" max="1000" value="long" oninvalid="return false" >
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
    		<br>
    		<br>
    		<div id="map" style="z-index:-1; width:50%;height:400px; position:relative; margin:auto; margin-top:-200px;display:none"></div>		
    		
    		<%String name = request.getParameter("name");%>
			<div class="textposition">	
				<p style="color:gray; font-size:30px;margin-left:80px"> Results for "<%=name %>" </p>
			</div>
			<br>
			<br>
			<br>
			<hr width="78%">
		<!-- search result -->
		<!-- forloop -->
		<% String image0 = (String) request.getAttribute("image0");%>
		<% String name0 = (String) request.getAttribute("name0"); %>
		<% String address0 = (String) request.getAttribute("address0"); %>
		<% String url0 = (String) request.getAttribute("url0"); %>
		<% String number0 = (String) request.getAttribute("number0");%>
		<% String category0 = (String) request.getAttribute("category0"); %>
		<% String price0 = (String) request.getAttribute("price0"); %>
		<% String rating0 = (String) request.getAttribute("rating0"); %>
		<% String id0 = (String) request.getAttribute("id0"); %>
		
		
		<% String image1 = (String) request.getAttribute("image1");%>
		<% String name1 = (String) request.getAttribute("name1"); %>
		<% String address1 = (String) request.getAttribute("address1"); %>
		<% String url1 = (String) request.getAttribute("url1"); %>
		<% String number1 = (String) request.getAttribute("number1");%>
		<% String category1 = (String) request.getAttribute("category1"); %>
		<% String price1 = (String) request.getAttribute("price1"); %>
		<% String rating1 = (String) request.getAttribute("rating1"); %>
		<% String id1 = (String) request.getAttribute("id1"); %>
		
		
		<% String image2 = (String) request.getAttribute("image2");%>
		<% String name2 = (String) request.getAttribute("name2"); %>
		<% String address2 = (String) request.getAttribute("address2"); %>
		<% String url2 = (String) request.getAttribute("url2"); %>
		<% String number2 = (String) request.getAttribute("number2");%>
		<% String category2 = (String) request.getAttribute("category2"); %>
		<% String price2 = (String) request.getAttribute("price2"); %>
		<% String rating2 = (String) request.getAttribute("rating2"); %>
		<% String id2 = (String) request.getAttribute("id2"); %>
		
		<% String image3 = (String) request.getAttribute("image3");%>
		<% String name3 = (String) request.getAttribute("name3"); %>
		<% String address3 = (String) request.getAttribute("address3"); %>
		<% String url3 = (String) request.getAttribute("url3"); %>
		<% String number3 = (String) request.getAttribute("number3");%>
		<% String category3 = (String) request.getAttribute("category3"); %>
		<% String price3 = (String) request.getAttribute("price3"); %>
		<% String rating3 = (String) request.getAttribute("rating3"); %>
		<% String id3 = (String) request.getAttribute("id3"); %>
		
		<% String image4 = (String) request.getAttribute("image4");%>
		<% String name4 = (String) request.getAttribute("name4"); %>
		<% String address4 = (String) request.getAttribute("address4"); %>
		<% String url4 = (String) request.getAttribute("url4"); %>
		<% String number4 = (String) request.getAttribute("number4");%>
		<% String category4 = (String) request.getAttribute("category4"); %>
		<% String price4 = (String) request.getAttribute("price4"); %>
		<% String rating4 = (String) request.getAttribute("rating4"); %>
		<% String id4 = (String) request.getAttribute("id4"); %>
		
		<% String image5 = (String) request.getAttribute("image5");%>
		<% String name5 = (String) request.getAttribute("name5"); %>
		<% String address5 = (String) request.getAttribute("address5"); %>
		<% String url5 = (String) request.getAttribute("url5"); %>
		<% String number5 = (String) request.getAttribute("number5");%>
		<% String category5 = (String) request.getAttribute("category5"); %>
		<% String price5 = (String) request.getAttribute("price5"); %>
		<% String rating5 = (String) request.getAttribute("rating5"); %>
		<% String id5 = (String) request.getAttribute("id5"); %>
		
		<% String image6 = (String) request.getAttribute("image6");%>
		<% String name6 = (String) request.getAttribute("name6"); %>
		<% String address6 = (String) request.getAttribute("address6"); %>
		<% String url6 = (String) request.getAttribute("url6"); %>
		<% String number6 = (String) request.getAttribute("number6");%>
		<% String category6 = (String) request.getAttribute("category6"); %>
		<% String price6 = (String) request.getAttribute("price6"); %>
		<% String rating6 = (String) request.getAttribute("rating6"); %>
		<% String id6 = (String) request.getAttribute("id6"); %>
		
		<% String image7 = (String) request.getAttribute("image7");%>
		<% String name7 = (String) request.getAttribute("name7"); %>
		<% String address7 = (String) request.getAttribute("address7"); %>
		<% String url7 = (String) request.getAttribute("url7"); %>
		<% String number7 = (String) request.getAttribute("number7");%>
		<% String category7 = (String) request.getAttribute("category7"); %>
		<% String price7 = (String) request.getAttribute("price7"); %>
		<% String rating7 = (String) request.getAttribute("rating7"); %>
		<% String id7 = (String) request.getAttribute("id7"); %>
		
		<% String image8 = (String) request.getAttribute("image8");%>
		<% String name8 = (String) request.getAttribute("name8"); %>
		<% String address8 = (String) request.getAttribute("address8"); %>
		<% String url8 = (String) request.getAttribute("url8"); %>
		<% String number8 = (String) request.getAttribute("number8");%>
		<% String category8 = (String) request.getAttribute("category8"); %>
		<% String price8 = (String) request.getAttribute("price8"); %>
		<% String rating8 = (String) request.getAttribute("rating8"); %>
		<% String id8 = (String) request.getAttribute("id8"); %>
		
		<% String image9 = (String) request.getAttribute("image9");%>
		<% String name9 = (String) request.getAttribute("name9"); %>
		<% String address9 = (String) request.getAttribute("address9"); %>
		<% String url9 = (String) request.getAttribute("url9"); %>
		<% String number9 = (String) request.getAttribute("number9");%>
		<% String category9 = (String) request.getAttribute("category9"); %>
		<% String price9 = (String) request.getAttribute("price9"); %>
		<% String rating9 = (String) request.getAttribute("rating9"); %>
		<% String id9 = (String) request.getAttribute("id9"); %>
		
		
		<br>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-4">
					<a href="details.jsp?userId=${name0}&imageurl=${image0}&address=${address0}&number=${number0}&category=${category0}&price=${price0}&rating=${rating0}&url=${url0}&id=${id0}">
					<img src="<%=image0%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name0}&imageurl=${image0}&address=${address0}&number=${number0}&category=${category0}&price=${price0}&rating=${rating0}&url=${url0}&id=${id0}" class = "text-secondary" style="font-size:30px"><%=name0 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address0%></p>
					<a href="<%=url0 %>" class = "text-secondary" style="font-size:15px"><%=url0 %> </a>
							
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name1}&imageurl=${image1}&address=${address1}&number=${number1}&category=${category1}&price=${price1}&rating=${rating1}&url=${url1}&id=${id1}">
					<img src="<%=image1%>" class="img-thumbnail" style="width:380px;height:250px" >
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name1}" class = "text-secondary" style="font-size:30px"><%=name1 %>
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address1%></p>
					<a href="<%=url1 %>" class = "text-secondary" style="font-size:15px"><%=url1 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name2}&imageurl=${image2}&address=${address2}&number=${number2}&category=${category2}&price=${price2}&rating=${rating2}&url=${url2}&id=${id2}">
					<img src="<%=image2%>" class="img-thumbnail" style="width:380px;height:250px" >
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name2}" class = "text-secondary" style="font-size:30px"><%=name2 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address2%></p>
					<a href="<%=url2 %>" class = "text-secondary" style="font-size:15px"><%=url2 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name3}&imageurl=${image3}&address=${address3}&number=${number3}&category=${category3}&price=${price3}&rating=${rating3}&url=${url3}&id=${id3}">
					<img src="<%=image3%>" class="img-thumbnail" style="width:380px;height:250px" >
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name3}" class = "text-secondary" style="font-size:30px"><%=name3 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address3%></p>
					<a href="<%=url3 %>" class = "text-secondary" style="font-size:15px"><%=url3 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name4}&imageurl=${image4}&address=${address4}&number=${number4}&category=${category4}&price=${price4}&rating=${rating4}&url=${url4}&id=${id4}">
					<img src="<%=image4%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name4}" class = "text-secondary" style="font-size:30px"><%=name4 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address4%></p>
					<a href="<%=url4 %>" class = "text-secondary" style="font-size:15px"><%=url4 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				
				<div class="col-4">
					<a href="details.jsp?userId=${name5}&imageurl=${image5}&address=${address5}&number=${number5}&category=${category5}&price=${price5}&rating=${rating5}&url=${url5}&id=${id5}">
					<img src="<%=image5%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name5}" class = "text-secondary" style="font-size:30px" ><%=name5 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address5%></p>
					<a href="<%=url5 %>" class = "text-secondary" style="font-size:15px"><%=url5 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name6}&imageurl=${image6}&address=${address6}&number=${number6}&category=${category6}&price=${price6}&rating=${rating6}&url=${url6}&id=${id6}">
					<img src="<%=image6%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name6}" class = "text-secondary" style="font-size:30px" ><%=name6 %>
					 </a>
					<p  class="text-secondary" style="font-size:20px" ><%=address6%></p>
					<a href="<%=url6 %>" class = "text-secondary" style="font-size:15px"><%=url6 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name7}&imageurl=${image7}&address=${address7}&number=${number7}&category=${category7}&price=${price7}&rating=${rating7}&url=${url7}&id=${id7}">
					<img src="<%=image7%>"  class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name7}" class = "text-secondary" style="font-size:30px" ><%=name7%>
					 </a>
					<p  class="text-secondary" style="font-size:20px" ><%=address7%></p>
					<a href="<%=url7%>" class = "text-secondary" style="font-size:15px"><%=url7%> </a>		
				</div>
				<br>
				<hr width="100%"><div class="col-4">
				
					<a href="details.jsp?userId=${name8}&imageurl=${image8}&address=${address8}&number=${number8}&category=${category8}&price=${price8}&rating=${rating8}&url=${url8}&id=${id8}">
					<img src="<%=image8%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name8}" class = "text-secondary" style="font-size:30px" ><%=name8 %>
					 </a>
					<p  class="text-secondary" style="font-size:20px" ><%=address8%></p>
					<a href="<%=url8 %>" class = "text-secondary" style="font-size:15px"><%=url8 %> </a>		
				</div>
				<br>
				<hr width="100%">
				
				<div class="col-4">
					<a href="details.jsp?userId=${name9}&imageurl=${image9}&address=${address9}&number=${number9}&category=${category9}&price=${price9}&rating=${rating9}&url=${url9}&id=${id9}">
					<img src="<%=image9%>" class="img-thumbnail" style="width:380px;height:250px">
					</a>
				</div>
				<div class="col-1"></div>
				<div class="col-7">
					<a href="details.jsp?userId=${name9}" class = "text-secondary" style="font-size:30px" ><%=name9 %> 
					</a>
					<p  class="text-secondary" style="font-size:20px" ><%=address9%></p>
					<a href="<%=url9 %>" class = "text-secondary" style="font-size:15px"><%=url9 %> </a>		
				</div>
				<br>
				<hr width="100%">
    	</div>
    	</div>
		
	
		
	</body> 
</html>