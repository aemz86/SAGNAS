<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Vector"%>
<%@ page language="java" session="true" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
if (session.getAttribute("userid") != null) {
	response.sendRedirect("home.jsp");
} else {
	
}            
%>
<!DOCTYPE html>
<html>
<head>
<title>SAGNAS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-responsive.css" rel="stylesheet"
	media="screen">
<style type="text/css">
footer {
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
	<!-- Modal for registration starts-->
	<div id="register" class="modal hide fade container-fluid"
		tabindex="-1" data-backdrop="static" data-keyboard="false">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
			<h3>Registration</h3>
		</div>
		<form id="form_reg" name="form_reg" method="post"
			action="register.jsp">

			<div class="modal-body">
				<div class="row-fluid">
					<div class="span6">
						<p>
							<input type="text" class="span12" placeholder="First Name"
								name="fname" required>
						</p>
						<p>
							<input type="text" class="span12" placeholder="Last Name"
								name="lname" required>
						</p>
						<p>
							<input type="email" class="span12" placeholder="E-Mail"
								name="email" required>
						</p>
						<p>
							<input type="text" class="span12" placeholder="username"
								name="uname" required>
						</p>
						<p>
							<input type="password" class="span12" placeholder="Password"
								name="passwd" required>
						</p>
						<p>
							<input type="password" class="span12"
								placeholder="Confirm Password" name="confirm_passwd" required>
						</p>
						<p>
						<fieldset>
							<input type="radio" value="cop" name="user_type"><span>cop</span><br>
							<input type="radio" value="user" name="user_type"><span>user</span><br>
							<input type="radio" value="admin" name="user_type"><span>admin</span>
						</fieldset>
						</p>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Reset</button>
				<button type="submit" id="submit_registration"
					class="btn btn-primary">Register</button>
			</div>
		</form>

	</div>
	<!-- Modal for registration ends -->

	<% 
 	Vector<String> userTypeVector = new Vector<String>();
 	String current_user = "";
 	userTypeVector.add("cop");
 	userTypeVector.add("user");
 	userTypeVector.add("admin");
 	
 	Iterator<String> it = userTypeVector.iterator();
 	for(;it.hasNext();){
 		current_user = it.next().toString();
 %>
	<div id="<%=current_user %>" class="modal hide fade container-fluid"
		tabindex="-1" data-backdrop="static" data-keyboard="false">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">�</button>
			<h3><%=current_user.toUpperCase() %>
				Login
			</h3>
		</div>
		<form id="<%=current_user %>_login" name="<%=current_user %>_login" action="login.jsp" method="post">
				
		<div class="modal-body">
			<div class="row-fluid">
					<div class="span6">
						<h4>Username</h4>
						<p>
							<input type="text" class="span12" name="username">
						</p>
					</div>
					<div class="span6">
						<h4>Password</h4>
						<p>
							<input type="password" class="span12" name="password">
						</p>
						<p>
							<input type="hidden" class="span12" value="<%=current_user %>" name="usertype">
						</p>
					</div>
					<div class="span6">
						<h4>Not registered yet</h4>
						<a href="#register" class="text-center" data-toggle="modal"
							data-dismiss="modal">Click here to Register</a>
					</div>
				
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary">Reset</button>
			<button type="submit"
				class="btn btn-primary">Login</button>
		</div>
		</form>
	</div>
	<% } %>

	<!-- Modal Dialogs Ends -->


	<!-- Page Header Starts -->
	<header>
		<div class="header">
			<div class="container-fluid">
				<h1>SAGNAS</h1>
			</div>
		</div>
	</header>
	<!-- Page Header ends -->

	<!-- Container Section Starts -->
	<section>
		<div class="container-fluid">
			<div class="row-fluid">
				<a class="span10 btn pull-left" href="#cop" role="button"
					data-toggle="modal">COP</a>
			</div>
			<div class="row-fluid">
				<a class="span10 btn pull-right" href="#user" role="button"
					data-toggle="modal">User</a>
			</div>
			<div class="row-fluid">
				<a class="span10 btn pull-left" href="#admin" role="button"
					data-toggle="modal">Admin</a>
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
		$(function() {
			//twitter bootstrap script
			$("button#submit_cop").click(function() {
			//	$.ajax({
			//		type : "POST",
			//		url : "login.jsp",
			//		data : $('form#cop_auth').serialize(),
			//		success : function(msg) {
			//			alert("works");
			//		},
			//		error : function() {
			//			alert("failure");
			//		}
			//	});
				$('form#cop_auth').submit();
			});
			$("button#submit_user").click(function() {
			/*	$.ajax({
					type : "POST",
					url : "login.jsp",
					data : $('form.user_auth').serialize(),
					success : function(msg) {
						alert("works");
					},
					error : function() {
						alert("failure");
					}
				});
			*/$('form#user_auth').submit();
			});
			$("button#submit_admin").click(function() {
			//	$.ajax({
			//		type : "POST",
			//		url : "login.jsp",
			//		data : $('form.admin_auth').serialize(),
			//		success : function(msg) {
			//			alert("works");
			//		},
			//		error : function() {
			//			alert("failure");
			//		}
			//	});
				$('form#admin_auth').submit();
			});

			$("button#submit_registration").click(function() {
				//  $.ajax({
				//      type: "POST",
				//  	url: "RegisterationHandler",
				//  	data: $('form.form_reg').serialize(),
				//       success: function(msg){
				//                alert("works during registration");
				//            },
				//   	error: function(){
				//       	alert("failure during registration");
				//       }
				//   });

//				$('form#form_reg').submit();
			});

		});
	</script>
</body>
</html>