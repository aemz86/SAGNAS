<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Bootstrap -->
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/signin.css" rel="stylesheet">

<link href="static/css/style.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<style type='text/css'>
/*<![CDATA[*/
.square {
	height: 100px;
	width: 98%;
	background-color: red;
	position: absolute;
	right: 0px;
	color: white;
	text-align: center;
	z-index: 1;
	overflow: hidden;
}
/*]]>*/
html {
	overflow: hidden;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
}
.locate {
	width: 50%;
}
#content-box {
	position: relative;
	width: 240px;
	height: 200px;
	margin: 0;
	background-color: lightgreen;
	color: #333;
	padding: 10px;
	font-size: 14px;
}

#CloseButton a {
	color: #fff;
	text-decoration: none;
}

body {
	background: #ffffff url('static/img/dark_circles.png');
	overflow-x: hidden;
}

.main,.options {
	width: 100%;
}

.options {
	background: #ffffff url('static/img/roughcloth.png');
	display: none;
	width: 95%;
	margin-left: 2%;
}

.text-justify {
	text-align: justify;
}

.jumbotron {
	font-size: 0.9em;
}

.options-button {
	position: fixed;
	display: block;
	bottom: 0px;
	right: 19px;
	width: 41px;
	height: 31px;
	cursor: pointer;
	background: #FFF url("static/img/arrow-open.png") no-repeat 13px 13px;
	-webkit-box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	-webkit-border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0;
}

.options-div {
	position: fixed;
	display: block;
	bottom: 0px;
	height: 90%;
	right: 0%;
	width: 100%;
	cursor: pointer;
	background: #FFF no-repeat 13px 13px;
	-webkit-box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 7px rgba(0, 0, 0, 0.5);
	-webkit-border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0;

}
#map {
	width: 100%;
	height: 450px;
	margin-top: 10px;
}
</style>


<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="static/js/bootstrap.min.js"></script>
