<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String name = request.getParameter( "signin-username" );
   session.setAttribute( "theName", name );
   String password = request.getParameter( "signin-password" );
   session.setAttribute( "thePassword", password );   
%>
<HTML>
<head>
<script type="text/javascript">
location.href = "NextPage.jsp";
</script>
</head>
<BODY>
<A HREF="NextPage.jsp">Continue</A>
</BODY>
</HTML>