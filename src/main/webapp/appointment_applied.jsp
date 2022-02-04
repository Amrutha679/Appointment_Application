
<!DOCTYPE html>
<html>
<body bgcolor = "wheat">
<br><br><br>
<h1 align="center"><a href="apply_appointment.jsp">Apply Appointment</a></h1>
<h1 align="center"><a href="appointment_applied.jsp">View Appointment</a></h1>
<h1 align="center"><a href="index.html">LOGOUT</a></h1>
<br><br><br>
<%@page import="java.sql.*"%>
<table align="center" width="800",height="400" border="2">
<tr><td>Id</td><td>PatientName</td><td>Date</td><td>Time</td><td>Specialist</td><td>Status</td><td>Doctor Name</td></tr>
<%
Connection connection = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mondee";
connection = DriverManager.getConnection(url,"Amrutha","Amrutha@890");
String specialist = (String)session.getAttribute("specialist");

PreparedStatement ps = connection.prepareStatement("select * from appointment");
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1) %></td><td><%=rs.getString("pname") %><td><%=rs.getString("doa")%></td>
</td><td><%=rs.getString("toa") %></td><td><%=rs.getString("specialist")%></td><td><%=rs.getString("status") %></td>
<td><%=rs.getString("dname") %><td>
</tr>
<%} %>
</table>
</body>
</html>