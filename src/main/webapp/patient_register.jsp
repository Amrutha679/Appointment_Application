<html>
<body bgcolor ="wheat">
<%@page import="java.sql.*"%>
<%

Connection connection = null;
PreparedStatement ps = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mondee";
connection = DriverManager.getConnection(url,"Amrutha","Amrutha@890");
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String sql = "insert into patient(name,password,email,phone,address)values(?,?,?,?,?)";
ps = connection.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, password);
ps.setString(3, email);
ps.setString(4, phone);
ps.setString(5, address);

int x = ps.executeUpdate();
if(x != 0)
	response.sendRedirect("patient_login.html");
%>
<h1 align="center">Registered Successfully!!</h1>

</html>