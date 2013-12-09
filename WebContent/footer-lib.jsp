<!-- 
<script src="static/js/stroll.min.js"></script>

<script>
	stroll.bind('.options-div ul' );
</script>
 -->

<script>
	$(function(){
	  $(".options-button").on("click", function() {
		 $(".options-div").toggle('slow');
	  });
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
               console.log("Unable to retrieve your address<br />");
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
	  
	  $("#update-map").click(function(event) {		  
		  markMyPosition();
		  if($("#from").val() != "" && $("to").val != "")
		  		calcRoute();
		  console.log("Radius value" + $("#radius").val());		  
		  markPolice($("#radius").val());

		  $(".options-div").hide('slow');
	  });
	});
 
  	var markers = [];
 	var navID;
 	var latitude;
 	var longitude;
  	
 	function addToMarkersList(user, lat, lng) {
		var marker = new google.maps.Marker({
			position:	 new google.maps.LatLng(lat, lng),
			map:	map,
			title: user
			});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(user);
			infowindow.open(map, this);
		});
		markers.push(marker);
	}
	
	function parseJSON(data) {
		var keyRetrieved = false;
		$.each(data, function(key, value){
			console.log(data);
			if(!keyRetrieved){
				navID = key;
				$("#join-group").val(navID);
				$("#create-group").text("Click to Leave Group");
				console.log(value.length);
				keyRetrieved = true;
			} else{
				console.log("key = " + key + "value:: "  + value.length);
				// Generating markers to plot and storing them to an array
				addToMarkersList(value[0], value[1], value[2]);
			}
		});
	}

	function clearPreviousMarkers() {
		for (var i = 0; i < markers.length; i++) {
		    markers[i].setMap(null);
		  }
		 markers = [];
	}
	
	
 	function callService(){
 		var domain = document.domain;
 		self.setInterval(function(){
 			navigator.geolocation.getCurrentPosition(
	  	  			function(position){
	  	  				latitude = position.coords.latitude;
	  	  				longitude = position.coords.longitude;
	  	  				clearPreviousMarkers();
		  	  			$.getJSON("http://"+ domain + "/FirstRestWebService/rest/json/metallica/"+ navID +"/" + "<%=session.getAttribute("userid")%>" + "/" + latitude + "/" + longitude + "/",  parseJSON);
	  	  			});
		  	console.log("calling::: " + navID);
	  	}, 600);
 	 }
 	
	$("#create-group").click(function() {
		console.log("create group click method "+ $("#join-group").val());
		if($("#join-group").val() == "") {
			console.log("resetting navID from  " + $("#join-group").val());
			navID = "aaaa";
		}
		else {
			navID = $("#join-group").val();
		}
		
		if($("#create-group").text() == "Click to Leave Group") {
			self.setInterval(function(){
				clearPreviousMarkers();
			}, 4);
			$("#create-group").text("Click to create a group");
			$("#join-group").prop('disabled', false);
		}
		else{
		callService();
		callService();
		}
		$("#join-group").prop('disabled', true);
	});


	$("#join-group").focus(function(){	    // Select input field contents
	    this.select();
	    $("#create-group").text("Enter ID and Click to Join Group");
	    console.log("selected");
	});
</script>