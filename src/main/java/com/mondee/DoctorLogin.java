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
import javax.servlet.http.HttpSession;

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
		String sql = "select * from doctor where name = ? and password = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			HttpSession hs = request.getSession();
			ResultSet rs = ps.executeQuery();
			
			 if(rs.next()) {
				 	hs.setAttribute("name",username);
				 	hs.setAttribute("id",rs.getInt(1));
				 	hs.setAttribute("specialist", rs.getString("specialist"));
				 	response.sendRedirect("./doctor_home.html");
				 	//pw.print("homepage");
				 	//pw.print("Login Successfully!!!");
			      }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}













