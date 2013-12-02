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
              <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="map.jsp?type='basic-gps'" role="button">Try Now &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>Group Navigation</h2>
              <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="map.jsp?type='multi-user-gps'" role="button">Try Now &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>Statistics</h2>
              <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="stats.jsp" role="button">View Stats &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>About SAGNAS</h2>
              <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">Know More &raquo;</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-6 col-lg-4">
              <h2>About Team</h2>
              <p class="text-justify">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
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