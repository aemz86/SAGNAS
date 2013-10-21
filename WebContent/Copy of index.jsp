<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <html>
 <head>
 <title>SAGNAS</title>
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
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

<script type='text/javascript'>
function validateMyForm(){
	//alert(3333);
    var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
    var emailInput = $('#email').val();

    if (testEmail.test(emailInput)) {
        alert('Thank you for entering correct information.');
        //alert(emailInput);
        //redirect = "success.html";
		//redirect =             
        //alert(JSON.stringify({ user: myUser }));
        return true;
    }

    else {
        //alert(emailInput);
        alert('Please enter a valid e-mail address! (e.g. test@site.com) ');
        redirect = "#";
        return false;
    }
	
	
	
}
$(document).ready(function () {
    var test = document.getElementById("#submit");
    var redirect = "";
    var valid = false;

    $('#submit').on('click', function () {


        //****Checking e-mail correctness ****//
        /*
        var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
        var emailInput = $('#email').val();

        if (testEmail.test(emailInput)) {
            alert('Thank you for entering correct information.');
            //alert(emailInput);
            redirect = "success.html";
			//redirect =             
            //alert(JSON.stringify({ user: myUser }));
            valid = true;
        }

        else {
            //alert(emailInput);
            alert('not in fn Please enter a valid e-mail address! (e.g. test@site.com) ');
            redirect = "index.jsp";
        }

        myUser = {
            username: user.val(),
            password: pass.val(),
            email: email.val(),
			usertype: "user"
        };
		*/
    });


    var user = $("#user");
	var pass = $("#pass");
	var email = $("#email");	

	
	var myUser = {
	    username: user.val(),
		password: pass.val(), 
		email: email.val()
	};	
	//make sure all input fields are correct and unique first
	if (valid) {

	    $('#submit').click(function () {
	    });
	}
});

</script>
    
 
 </head>
 <body>
 <center><h1>Safety Aware GPS Navigation and Assistance</h1></center>
    <div class="container">
    
<div data-role="page" id="page1">
  <div data-role="header">
    <h1>Login</h1>
  </div>
  <FORM METHOD=POST onsubmit="return validateMyForm();" ACTION="Continue.jsp">
  <div data-role="content">
    <div data-role="fieldcontain">
      <p>
        <label for="username">Username</label>
        <input type="text" name="username" id="user" value=""/>
      </p>
      
      <div data-role="fieldcontain">
        <p>
          <label for="passwordinput">Password</label>
          <input type="password" name="password" id="pass" value=""  />
        </p>

        <div data-role="fieldcontain">
        
          <p>
           <label for="textinput2">Email</label>
            <input type="text" name="textinput2" id="email" value=""  />
          </p>
          <p>
            <input type="submit" class = "list" id ="submit" value="Register" />
          </p>
        </div>
      </div>
    </div>
  </div>
  </form>
  
  
  
</div>
</div> <!-- /container -->
    
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
 </body>
 </html>