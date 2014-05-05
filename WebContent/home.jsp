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
<title>Home Page</title>

<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="fixed-nav.jsp"></jsp:include>
    
    <div class="container">
	
	<div class="row jumbotron">
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>GPS Navigation</h2>
              <p class="text-justify"> This service allows users to display and get their current location on a map. In addition, the user can get live GPS directions from point to point. Another feature of this service is that users have the ability to locate the nearest police department within a desired raduis. </p>
              <p><a class="btn btn-default" href="map.jsp?type=basic-gps" role="button">Try Now &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>Group Navigation</h2>
              <p class="text-justify"> Any user can initiate a group navigation session where other users can also join if they know its Nav_ID. After creating or joining the session, map will displayed showing the current location of all users in that group. Locations get updated continuously. The group navigation session ends when the last user leaves the group. </p>
              <p><a class="btn btn-default" href="map.jsp?type=multi-user-gps" role="button">Try Now &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>Statistics</h2>
              <p class="text-justify"> This service allows users to display a chart including types and numbers of crimes for a specific zip code. </p>
              <p><a class="btn btn-default" href="stats.jsp" role="button">View Stats &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>About SAGNAS</h2>
              <p class="text-justify"> SAGNAS is short of" Safety Aware GPS Navigation and Assistance System". This application gives users in the Kansas City area the ability to be more knowledgable about their surroundings by providing them with crime information based on their current location, as well as the ability to share their geolocation with other users of the application via shared rooms. </p>
              <p><a class="btn btn-default" href="#" role="button">Know More &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>About Team</h2>
              <p class="text-justify"> Avinash Reddy        adt42@mail.umkc.edu </p>
              <p class="text-justify"> Koushik Tammineedi   ktxv3@mail.umkc.edu </p>
              <p class="text-justify"> Alex McLaurian       alex.mclaurian@gmail.com </p>
              <p class="text-justify"> Rayan Katib          rfkfy6@mail.umkc.edu </p>
              <p><a class="btn btn-default" href="#" role="button">Find Out &raquo;</a></p>
            </div><!--/span-->
      </div>
	</div>
	 <div class="options-button">
    	<span class="text-center"></span>
    </div>
    
	<jsp:include page="footer-lib.jsp"/>
</body>
</html>
