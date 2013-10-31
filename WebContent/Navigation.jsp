<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Geolocation</title>

    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>    
    <!--
    Include the maps javascript with sensor=true because this code is using a
    sensor (a GPS locator) to determine the user's location.
    See: https://developers.google.com/maps/documentation/javascript/tutorial#Loading_the_Maps_API
    -->
    <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&libraries=places"></script>-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyADjgrg2F4c04gPROMib2sX7L4MIaF6m1I&sensor=true&libraries=places"></script>
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
 <script type='text/javascript'>
// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see a blank space instead of the map, this
// is probably because you have denied permission for location sharing.

var map;
var infowindow;
//var $win = null;
//var currentPos;
//var service;
function initialize() {


  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);
									   
	  map = new google.maps.Map(document.getElementById('map-canvas'),
	  {
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		  center: pos,
		  zoom: 11
	  });

	  
	  var request = {
		location: pos,
		radius: 10000,
		types: ['police']
		//query: "dog parks in kansas city"
		};
		
	  infowindow = new google.maps.InfoWindow();
	  service = new google.maps.places.PlacesService(map);
	  service.search(request, callback);	  


	  map.setCenter(pos);

	  var marker = new google.maps.Marker({
			position: map.getCenter(),
			icon: {
			  path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
			  scale: 10
			},
			draggable: true,
			map: map
		  });	  
	  
	  
	  
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
}

function handleNoGeolocation(errorFlag) {

  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  //var infowindow = new google.maps.InfoWindow(options);
  //map.setCenter(options.position);
}

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
    });

    var request = { reference: place.reference };
    service.getDetails(request, function(details, status) {
      if (status == google.maps.places.PlacesServiceStatus.OK) {	
		//alert(details);
		  google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(details.name + "<br />" + details.formatted_address +"<br />" + details.website + "<br />" + details.formatted_phone_number);
			infowindow.open(map, this);
		  });
	  }
    });
  }
  
  function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }
  


  google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
  <br/>
  <br/>
  <p>You are located at the large black arrow. All of the red markers are
  the closest police stations. </p>
    <div id="map-canvas"></div>
  </body>
</html>