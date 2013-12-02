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

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var works = "Test";
      var crime_types = ['Misc Voilation', 'Possession', 'Stolen Property', '', ''];
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Crime Type', 'Count'],
          ['Misc Voilation',     11],
          ['Possession',      2],
          ['Stolen Property',  2],
          ['Weapons Law Voilation', 2],
          ['Sex Offence',    0],
          ['Auto Theft',    0],
          ['Property Damage',    0],
          ['Sex Offence',    0],
          
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
</script>



</head>
<body>

	<jsp:include page="fixed-nav.jsp"></jsp:include>

	<div class="container">

		<div class="row jumbotron">
			<!-- Map is inserted here -->
			<div id="piechart"></div>
		</div>

		<div class="options-div" id="options">
			<article>
				<ul class="cards">
					
					<li>
						
					</li>
	
					<li>
						<div class="text-center">Find Stats based on ZIPCODE</div>
					</li>
					<li>
						<div class="input-group">
							<input type="text" class="form-control" id="from" placeholder="Please Enter ZIPCODE">
						</div>
					</li>
					<li></li>
					<li></li>
					<li>
						<button class="btn btn-primary text-center" id="get-stats">Get Statistics</button>
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