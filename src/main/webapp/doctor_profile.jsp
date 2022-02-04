
<!DOCTYPE html>
<html>
<body bgcolor = "wheat">
<br><br><br>
	<h1 align="center">WELCOME TO DOCTOR HOMEPAGE!!</h1>
	<h1 align="center"><a href="doctor_profile.jsp">Doctor Profile</a></h1>
	<h1 align="center"><a href="index.hrml">Logout</a></h1>
<br><br><br>
<%@page import="java.sql.*"%>
<table align="center" width="800",height="400" border="2">
<tr><td>Id</td><td>Name</td><td>Email</td><td>Phone</td><td>Specialist</td></tr>
<%
Connection connection = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mondee";
connection = DriverManager.getConnection(url,"Amrutha","Amrutha@890");
int id = (Integer)session.getAttribute("id");
PreparedStatement ps = connection.prepareStatement("select * from doctor where id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %><td><%=rs.getString(4)%></td>
</td><td><%=rs.getString(5) %><td><%=rs.getString(6)%></td>
</tr>
<%} %>
</table>
</body>
</html>