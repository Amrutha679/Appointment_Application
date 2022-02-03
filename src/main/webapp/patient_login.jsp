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
String sql = "select * from patient where name=? and password=?";
ps = connection.prepareStatement(sql);
ps.setString(1, username);
ps.setString(2, password);
ResultSet rs = ps.executeQuery();
if(rs.next())
	response.sendRedirect("home_page.html");
%>

</html>