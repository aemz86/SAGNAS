<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String usertype = request.getParameter("usertype");
	
	java.sql.Connection con;
    java.sql.Statement s;
    java.sql.ResultSet rs;

    con = null;
    s = null;
    rs = null;

	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcc_sagnas", "root", "root");
	    String sql = "select * from user_list where uname='" + username + "'";

            s = con.createStatement();
            rs = s.executeQuery(sql);
            rs.next();
            String usertype1 = rs.getString("user_type");
            
            //out.println(username+" -- "+ password +" -- "+ rs.getString("password"));
            if (password.equals(rs.getString("pass")) ) {
                session.setAttribute("userid", username);
                session.setAttribute("user_type", usertype);
                response.sendRedirect("home.jsp");
                return;
            } else {
                out.println("Login failed");
                session.invalidate();
            }

        } catch (Exception e) {
            out.println("<script> window.alert('Login Failed. . Try again')</script>");
            response.sendRedirect("index.jsp");            
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (s != null) {
                s.close();
            }
            if (con != null) {
                con.close();
            }
        }
%>