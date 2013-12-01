

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
</script>