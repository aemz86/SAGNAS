<jsp:include page="java-import.jsp" />
<%
if (session.getAttribute("userid") != null) {
	response.sendRedirect("home.jsp");
}
%>
<!DOCTYPE html>
<html>
  <head>
    <title>SAGNAS</title>
    <jsp:include page="header.jsp" />
    <style type="text/css">
    	.header {
    		color: #FFFFFF;
    	}
    	h3 {
    		margin-top: 10px;
    	}
    	
    	.fixed {
    		position: fixed;
    	}
    	
	    	.form-signin {
			  max-width: 330px;
			  padding: 15px;
			  margin: 0 auto;
			}
		.form-signin label {
			display: inline-block !important;
			margin-bottom: 10px !important;
		}
		
		.jumbotron {
			font-size: 13px;
			margin-top: 6%;
		}
    </style>
  </head>
  <body>	
  
  <!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
     <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
       -->
      <a class="navbar-brand" href="#">SAGNAS</a>
    </div>
   <!-- <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="text-right"><a href="javascript:void(0);"><span>Welcome <%=session.getAttribute("userid") %></span></a></li>
        <li class="text-right"><a href="logout.jsp"><span>Logout</span></a></li>
      </ul>
    </div>/.nav-collapse -->
  </div>
</div>
  
    <div class="container">
    	<div class="main jumbotron">
    	<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne">Login</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<form class="form-signin" action="login.jsp" method="POST">
					        <h2 class="form-signin-heading"></h2>
					        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
					        <input type="password" name="password" class="form-control" placeholder="Password" required>
					        <input type="hidden" name="usertype" value="cop">
					        <p class="text-center small">Forgot Password</p>
					        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
					      </form>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo">Register</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<form class="form-signin">
					        <h2 class="form-signin-heading"></h2>
					        <input type="text" class="form-control" placeholder="First Name" required autofocus>
					        <input type="text" class="form-control" placeholder="Name" required>
					        <input type="email" class="form-control" placeholder="Email address" required>
					        <input type="text" class="form-control" placeholder="Username" required>
					        <input type="password" class="form-control" placeholder="Password" required>
					        <input type="password" class="form-control" placeholder="Confirm Password" required>
					        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
					      </form>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree"> About us </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">About US</div>
				</div>
			</div>
		</div>
		</div>
    	<div class="row options">
    		Options
    	</div>
    </div>
    
    <div class="options-button">
    	<span class="text-center"></span>
    </div>
    
	<jsp:include page="footer-lib.jsp"/>
  </body>
</html>