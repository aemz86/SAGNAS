<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Vector" %>

<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.jsp");
	}          
%>
<!DOCTYPE html>
 <html>
 <head>
 	<title>SAGNAS</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	
 	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 	<link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
 	<style type="text/css">
 		footer{
 			position: fixed;
 			width: 100%;
 			bottom: 0px;
 		}
 		.header {
			height: 10%;
			width: 100%;
		}
 	</style>
 
 	<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
    
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;

    function initialize() {
	      directionsDisplay = new google.maps.DirectionsRenderer();
	      var umkc = new google.maps.LatLng(39.033669,-94.576278);
	      var mapOptions = {
	        zoom:13,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,
	        center: umkc
	      }
	      map = new google.maps.Map(document.getElementById('map'), mapOptions);
	      directionsDisplay.setMap(map);
	      
	      navigator.geolocation.getCurrentPosition(
	  			function(position){
	  				  var start = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
		  		      console.log(position.coords.latitude);
		  		      var end = document.getElementById('to').value;
		  		      var request = {
		  		          origin:start,
		  		          destination:end,
		  		          travelMode: google.maps.DirectionsTravelMode.DRIVING
		  		      };
	  		      	  directionsService.route(request, function(response, status) {
		  		        if (status == google.maps.DirectionsStatus.OK) {
		  		          directionsDisplay.setDirections(response);
		  		        }
	  		          });
	  			 },
			     function(results, status) {
			     	console.log(position.coords.latitude + ",err" + position.coords.longitude);
			        if (status == google.maps.GeocoderStatus.OK)
			        	$("#" + addressId).val(results[0].formatted_address);
			       	else
			        	$("#error").append("Unable to retrieve your address<br />");
			     },
			     {
			     	enableHighAccuracy: true,
			     	timeout: 10 * 1000 // 10 seconds
				}
		);
	      var markers = [];
	      var current_marker;
	      
	      self.setInterval(function(){
	    	  navigator.geolocation.getCurrentPosition(
	  	  			function(position){
	  	  				var latLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		  	  			if(current_marker != undefined)
			    			  current_marker.setMap(null);
			  	  			current_marker = new google.maps.Marker({
			  		    		 position: latLng,
			  		    		 map: map,
			  		    		icon: {
			  		    		  path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
			  					  scale: 5
			  		    	    }
			  		    	});
			  	  			map.panTo(latLng);
			  	  		//	markers.push(current_marker);
			  	  		//	toggle_marker(current_marker);
	  	  			 },
	  			     function(results, status) {
	  			     	console.log(position.coords.latitude + ",err" + position.coords.longitude);
	  			        if (status == google.maps.GeocoderStatus.OK)
	  			        	$("#" + addressId).val(results[0].formatted_address);
	  			       	else
	  			        	$("#error").append("Unable to retrieve your address<br />");
	  			     },
	  			     {
	  			     	enableHighAccuracy: true,
	  			     	timeout: 10 * 1000 // 10 seconds
	  				}
	  		); 
	      }, 1000);
    }

      $(document).ready(function() {
        // If the browser supports the Geolocation API
        if (typeof navigator.geolocation == "undefined") {
          $("#error").text("Your browser doesn't support the Geolocation API");
          return;
        }
	 
	        $("#from-link, #to-link").click(function(event) {
	          event.preventDefault();
	          var addressId = this.id.substring(0, this.id.indexOf("-"));
	 
	          navigator.geolocation.getCurrentPosition(function(position) {
	            var geocoder = new google.maps.Geocoder();
	            geocoder.geocode({
	              "location": new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
	            },
	            function(results, status) {
	            	console.log(position.coords.latitude + "," + position.coords.longitude);
	              if (status == google.maps.GeocoderStatus.OK)
	                $("#" + addressId).val(results[0].formatted_address);
	              else
	                $("#error").append("Unable to retrieve your address<br />");
	            });
	          },
	          function(positionError){
	            $("#error").append("Error: " + positionError.message + "<br />");
	          },
	          {
	            enableHighAccuracy: true,
	            timeout: 10 * 1000 // 10 seconds
	          });
	        });
	 
	        
	        $("#calculate-route").submit(function(event) {
	          event.preventDefault();
	         // calculateRoute($("#from").val(), $("#to").val());
	          initialize();
	        //  self.setInterval(function(){getGPSCoordinates();}, 5000);
	        });
	 });
    </script>
    <style type="text/css">
      #map {
        width: 100%;
        height: 400px;
        margin-top: 10px;
      }
    </style>
  
 </head>
 
 <body>
 <!-- Modal content to choose destination -->
 	<!-- Start -->
 	<div class="modal hide fade" id="destination">
	  <div class="modal-header">
	    <a class="close" data-dismiss="modal">×</a>
	    <h3>Modal header</h3>
	  </div>
	  <form id="calculate-route" name="calculate-route" action="#" method="get">
	  	<div class="modal-body">
	      <label for="from">From:</label>
	      <input type="text" id="from" name="from" required="required" placeholder="An address" size="30" />
	      <a id="from-link" href="#">Get my position</a>
	      <br />
	 
	      <label for="to">To:</label>
	      <input type="text" id="to" name="to" required="required" placeholder="Another address" size="30" />
	      <a id="to-link" href="#">Get my position</a>
	      <br />
	 
	      <input type="reset" class="btn-primary"/>
	      <input type="button" class="btn" value="Submit" id="display_map" />
	    </div>
	  </form>
	
	</div>
 	<!-- End -->
 	<!-- Page Header Starts -->
 	<header>
 		<div class="header">
    		<div class="container-fluid">
        		<h1>SAGNAS</h1>
        	</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<p class="text-left"><a href="logout.jsp">Logout</a></p>
				<p class="text-right">Welcome <%=session.getAttribute("userid") %></p>
			</div>
		</div>
 	</header>
 	<!-- Page Header ends -->
 	
 	<!-- Container Section Starts -->
 	<section>
	 	<div class="container-fluid">
		    <div class="row-fluid">
			    <div id="map"></div>
			    <p id="error"></p>
		    </div>
		</div>
	</section>
 	<!-- Container Section Ends -->
 	<!-- Page Footer Starts -->
 	 <footer>
 		<div class="container-fluid">
		    <div class="row-fluid">
		        <a class="span12 text-center">SCE-UMKC</a>
		    </div>
		</div>
 	</footer>
 	<!-- Page Footer Ends -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="js/jquery-2.0.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
 <script type="text/javascript">
    $(window).load(function(){
        $('#destination').modal('show');
    });
    $("#display_map").click(function(event){
    	$(this).submit();
    	$('#destination').modal('hide');
    });
 </script>
</body>
</html>