<html>
<body bgcolor ="wheat">
<%@page import="java.sql.*"%>
<%

Connection connection = null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mondee";
connection = DriverManager.getConnection(url,"Amrutha","Amrutha@890");
String pname = request.getParameter("pname");
String doa = request.getParameter("doa");
String toa = request.getParameter("toa");
String specialist = request.getParameter("specialist");
String sql = "insert into appointment(pid,pname,dname,doa,toa,specialist,status)values(?,?,?,?,?,?,?)";
PreparedStatement ps = connection.prepareStatement(sql);
int pid = (Integer)session.getAttribute("pid");
ps.setInt(1,pid);
ps.setString(2, pname);
ps.setString(3,"None");
ps.setString(4,doa);
ps.setString(5,toa);
ps.setString(6,specialist);
ps.setString(7,"Pending");
int x = ps.executeUpdate();
if(x!=0){
	response.sendRedirect("appointment_appiled.jsp");
}
%>

</html>