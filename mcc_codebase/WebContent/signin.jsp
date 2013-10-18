<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
 <!-- Bootstrap -->
 <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
 <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
    <![endif]-->
    
<script type='text/javascript'>
var nombre = "<%= session.getAttribute( "registeredUsername" ) %>";
var passwerd= "<%= session.getAttribute( "registeredPassword" ) %>";
function validateMyForm()
{
    var passInput1 = passwerd;
    var passInput2 = $('#pass2').val();	
    var userInput1= nombre;
    var userInput2 = $('#user2').val();	    

  //alert("in fn");

  if(passInput1 != passInput2)
  { 
    alert("Please enter your registered password");
  	location.href = "#";
    return false;
  }
  else if (userInput1 != userInput2)
	  {
	  	//alert(userInput1);
	  	//alert(userInput2);
	  	alert("please enter your registered username");
	  	location.href = "#";
	    return false;	  	
	  }
	  
//location.href = "signin.jsp";
  alert("validations passed");
  return true;
}

//alert(nombre);
//alert(passwerd);
$(document).ready(function () {
	
	var valid = false;
	$('#submit').on('click', function () {
	//	alert("wahhh");
	    /*Checking that passwords equal each other */
	/*
	    var passInput1 = passwerd;
	    var passInput2 = $('#pass2').val();
	
	    if (passInput1 == passInput2) {
	        valid = true;
	        alert("passwords match up");
	        //alert(passInput1);
	        //alert(passInput2);
	    }
	
	    else {
	        valid = false;
	        alert("Passwords do not match up");
	        alert(passInput1 + " 1");
	        alert(passInput2 + " 2");	        
	      //	location.href = "signin.jsp";

	    }
	    */
	});
	if (valid) {
		alert("valid");
	    $('#submit').click(function () {
	    });
	}	
	
});
	
</script>    
</head>
<BODY>

<FORM METHOD=POST onsubmit="return validateMyForm();" 	ACTION="SaveName.jsp">
Username: <INPUT TYPE=TEXT id="user2" NAME=signin-username SIZE=20>
<br/>
<br/>
Password: <INPUT TYPE=password id="pass2" NAME=signin-password SIZE=20>
<P><INPUT id ="submit" TYPE=SUBMIT>
</FORM>
</BODY>
</HTML>