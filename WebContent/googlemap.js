function initMap() {
   $("#map").css("display","block");
   $("#map").css("z-index","50");

	var myLatlng = {lat: 34.02116, lng: -118.287132};

    var map = new google.maps.Map(
        document.getElementById('map'), {zoom: 4, center: myLatlng});

    // Create the initial InfoWindow.
    var infoWindow = new google.maps.InfoWindow(
        {content: 'Click the map to get Lat/Lng!', position: myLatlng});
    infoWindow.open(map);

    // Configure the click listener.
    map.addListener('click', function(mapsMouseEvent) {
      // Close the current InfoWindow.
      infoWindow.close();

      // Create a new InfoWindow.
      infoWindow = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
      infoWindow.setContent(mapsMouseEvent.latLng.toString());
      infoWindow.open(map);
      
      google.maps.event.addListener(map,'click',function(event) {   
    	  console.log( event.latLng.lat());
    	  console.log( event.latLng.lng());
          document.getElementById('lat').value = event.latLng.lat();
          document.getElementById('long').value =  event.latLng.lng();
          $("#map").css("display","none");
          
    	  //$("#lat")
      });
    });
 }