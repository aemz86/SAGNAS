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
 </head>
 
 <body>
 	<!-- Modal Dialogs Starts -->
	<div id="group_options" class="modal hide fade container-fluid"
		tabindex="-1" data-backdrop="static" data-keyboard="false">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Choose an Option</h3>
		</div>
		<div class="modal-body">
			<div class="accordion" id="multi-user-coordination">
			  <div class="accordion-group">
			    <div class="accordion-heading">
			      <a class="accordion-toggle" data-toggle="collapse" data-parent="#multi-user-coordination" href="#createGroup">
			        Create a group
			      </a>
			    </div>
			    <div id="createGroup" class="accordion-body collapse in">
			      <div class="accordion-inner">
			      	<form action="gps_nav.jsp">
			      		<input type="hidden" value="0000" name="multi_user">
			      		<button type="submit" class="btn btn-primary">Confirm</button>
			      	</form>
			      </div>
			    </div>
			  </div>
<!-- Join a group -->			  
			  <div class="accordion-group">
			    <div class="accordion-heading">
			      <a class="accordion-toggle" data-toggle="collapse" data-parent="#multi-user-coordination" href="#joinGroup">
			        Join Existing Group
			      </a>
			    </div>
			    <div id="joinGroup" class="accordion-body collapse in">
			      <div class="accordion-inner">
			        <form action="gps_nav.jsp">
			      		<input type="text" name="multi_user">
			      		<button type="submit" class="btn btn-primary">Confirm</button>
			      	</form>
			      </div>
			    </div>
			  </div>
<!-- End of Join a group -->
			</div>
			</div>
		</div>
	</div>
	<!-- Modal for registration ends -->
 
 
 	<!-- Page Header Starts -->
 	<header>
 		<div class="hero-unit">
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
		        <a class="span10 btn pull-left" href="" role="button">Request Assistance</a>
		    </div>
		    <div class="row-fluid">
		        <a class="span10 btn pull-right" href="gps_nav.jsp" role="button">GPS Navigation</a>
		    </div>
		    <div class="row-fluid">
		        <a class="span10 btn pull-left" href="#group_options" role="button" data-toggle="modal">Friendly GPS</a>
		    </div>
		    <div class="row-fluid">
		        <a class="span10 btn pull-right" href="#admin" role="button">Statistics</a>
		    </div>
		    <div class="row-fluid">
		        <a class="span10 btn pull-left" href="#user" role="button">Settings</a>
		    </div>
		    <div class="row-fluid">
		        <a class="span10 btn pull-right" href="#admin" role="button">About Us</a>
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
	    $('#multi-user-coordination').collapse({
	    	  toggle: true
	    	});
	
	    var navID = "0000";
		function addToMarkersList(user, lat, lng) {
			
		}
		function parseJSON(data) {
			var keyRetrieved = false;
			$.each(data, function(key, value){
				if(!keyRetrieved){
					navID = key;
					console.log(value.length);
					keyRetrieved = true;
				} else{
					console.log("key = " + key + "value:: "  + value.length);
					addToMarkersList(value[0], value[1], value[2]);					
				}
			});
		}
	    $( "#createGroupID" ).click(function() {
	    	self.setInterval(function(){
			  	$.getJSON("http://localhost:8080/FirstRestWebService/rest/json/metallica/"+ navID +"/ " + <%=session.getAttribute("userid") %> + "/3/4/",  function(data) {
			  	parseJSON(data);
			  	
			});
			  	console.log("calling::: " + navID);
		  	}, 6000);
		  	
	    });
    </script>
 </body>
 </html>