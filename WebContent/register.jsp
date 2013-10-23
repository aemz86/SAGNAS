<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="com.mysql.jdbc.Driver" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>test</title>
	</head>
	<body>


<%
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String user = request.getParameter("uname");    
    String pwd = request.getParameter("passwd");
   
    try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcc_sagnas",
	            "root", "root");
	    Statement st = con.createStatement();
	    //ResultSet rs;
	    int i = st.executeUpdate("insert into user_list(first_name, last_name, email, uname, pass, user_type, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','cop', CURDATE())");
	    if (i > 0) {
	        session.setAttribute("userid", user);
	 		response.sendRedirect("home.jsp");
	    } else {
	        response.sendRedirect("index.jsp");
	    }
    } catch(Exception e){
    	e.printStackTrace();	
    }
%>
</body>
</html>