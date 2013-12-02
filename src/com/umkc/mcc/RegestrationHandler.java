package com.umkc.mcc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegestrationHandler
 */
public class RegestrationHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegestrationHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String fname = request.getParameter("fname");
		
		
		//loading the driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcc", "root", "root");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO TABLE_NAME VALUES(?)");
			ps.setString(1, fname);
			
			int i = ps.executeUpdate();
			if(i > 0) {
				out.println("You are successfully regestered");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		out.println("works great");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String fname = request.getParameter("fname");
		
		
		//loading the driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcc", "root", "root");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO TABLE_NAME VALUES(?)");
			ps.setString(1, fname);
			
			int i = ps.executeUpdate();
			if(i > 0) {
				out.println("You are successfully regestered");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		out.println("works great");
	}

}
