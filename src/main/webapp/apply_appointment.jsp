<!DOCTYPE html>
<html>
<body bgcolor = "wheat">
<br><br><br>
	<h1 align="center">WELCOME TO DOCTOR HOME PAGE!!</h1>
<br><br><br>
<h1 align="center"><a href="apply_appointment.jsp">Apply Appointment</a></h1>
<h1 align="center"><a href="index.html">LOGOUT</a></h1>
<br><br><br>
<form action="./patient_appointment.jsp" method="post" align="center">
		<input type="text" name = "pname" placeholder = "Enter PatientName"></input>
		<input type="date" name = "doa" placeholder = "Select Date"></input>
		<input type="text" name = "toa" placeholder = "Select Time"></input>
		<input type="number" name = "phone" placeholder = "Enter MobileNumber"></input>
		<select name="specialist">
		<option value="ENT">ENT</option>
		<option value="Dentist">Dentist</option>
		<option value="ENT">ENT</option>
		</select>
		<input type ="submit" value = "Apply"></input>
	</form>
</body>
</html>




