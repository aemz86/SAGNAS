<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Map</title>

<jsp:include page="header.jsp"></jsp:include>
<script src="http://maps.google.com/maps/api/js?libraries=places&sensor=true"></script>

<script type="text/javascript">
	var map;

	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var service;

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var mapOptions = {
			zoom : 12,
			center : new google.maps.LatLng(39.033669, -94.576278)
		};
		map = new google.maps.Map(document.getElementById('map'), mapOptions);
		directionsDisplay.setMap(map);

		
		infowindow = new google.maps.InfoWindow();
		service = new google.maps.places.PlacesService(map);
	}

	function markMyPosition() {
		console.log("Marking your position");
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
			  	  		//	map.panTo(latLng);
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
	function calcRoute() {
		var start = document.getElementById('from').value;
		var end = document.getElementById('to').value;
		var request = {
			origin : start,
			destination : end,
			travelMode : google.maps.TravelMode.DRIVING
		};
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
			}
		});
	}
	
	function markPolice(radius) {
		var request = {
				location : new google.maps.LatLng(39.033669, -94.576278),
				radius : radius,
				types : [ 'police' ]
			};
		service.nearbySearch(request, callback);
	}
	
	function callback(results, status) {
		if (status == google.maps.places.PlacesServiceStatus.OK) {
			for (var i = 0; i < results.length; i++) {
				createMarker(results[i]);
			}
		}
	}

	function createMarker(place) {
		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>



</head>
<body>

	<%
		String map_type = request.getParameter("type");
	%>

	<jsp:include page="fixed-nav.jsp"></jsp:include>

	<div class="container">

		<div class="row jumbotron">
			<!-- Map is inserted here -->
			<div id="map"><%=map_type%></div>

		</div>

		<div class="options-div" id="options">
			<article>
				<ul class="cards">
					<li>
						<div class="text-center">Directions</div>
					</li>
					<li>
						<div class="input-group">
							<input type="text" class="form-control" id="from"
								placeholder="From"> <span class="input-group-addon"
								id="from-link">C</span>
						</div> <br />
						<div class="input-group">
							<input type="text" class="form-control" id="to" placeholder="To">
							<span class="input-group-addon" id="to-link">C</span>
						</div>
					</li>
					<li></li>
					<li>
						<div class="text-center">Markers</div>

					</li>
					<li>
						<div class="container">
							<div class="row">
								<form class="form">
									<fieldset>
										<legend>Locate</legend>
										<div class="input-group">
											<input type="number" class="form-control"
												placeholder="Police Station" value="0" id="radius">

											<div class="input-group-btn">
												<button type="button"
													class="btn btn-default dropdown-toggle"
													data-toggle="dropdown">
													Miles<span class="caret"></span>
												</button>
												<!-- <ul class="dropdown-menu">
							          <li><a href="#">Miles</a></li>
							          <li><a href="#">ZipCode</a></li>
							          <li class="divider"></li>
							        </ul>-->
											</div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</fieldset>
								</form>
							</div>
						</div>
					</li>
					<li>
						<div class="container">
							<div class="row">
								<form class="form">
									<fieldset>
										<legend>Retrieve</legend>
										<div class="input-group">
											<input type="number" class="form-control"
												placeholder="Crime Information">
											<div class="input-group-btn">
												<button type="button"
													class="btn btn-default dropdown-toggle"
													data-toggle="dropdown">
													Miles<span class="caret"></span>
												</button>
												<!-- <ul class="dropdown-menu">
							          <li><a href="#">Miles</a></li>
							          <li><a href="#">ZipCode</a></li>
							          <li class="divider"></li>
							        </ul> -->
											</div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</fieldset>

								</form>
							</div>
						</div>
					</li>
					<li></li>
					<li>
						<button class="btn btn-primary pull-right" id="update-map">Update</button>
						<div class="clearfix"></div>
					</li>
				</ul>
			</article>

		</div>
	</div>


	<div class="settings-toggle">set</div>
	<div class="options-button">
		<span class="text-center"></span>
	</div>


	<jsp:include page="footer-lib.jsp" />
</body>
</html>