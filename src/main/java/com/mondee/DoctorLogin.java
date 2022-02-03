package com.mondee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoctorLogin extends HttpServlet{
	Connection connection = null;
	PreparedStatement ps = null;
	public void init(ServletConfig config) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/mondee";
		try {
			connection = DriverManager.getConnection(url,"Amrutha","Amrutha@890");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		PrintWriter pw = response.getWriter();
		
		
		String sql = "select name,password from doctor where (name = ? and password = ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			 while (rs.next()) {
				 
				 	pw.println("<html><body><h1>");
					pw.println("Login Successfully</h1></body></html>");
			      }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}













