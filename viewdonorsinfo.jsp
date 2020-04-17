<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>
<html>
<head>
<link href="logo.css" rel="stylesheet">
<style>
.hl{
margin-left : 30%;
margin-top : 1%;
font-size : 20px;
}

table,th,td{
border : 1px solid black;
border-collapse :  collapse;
font-size : 30px;
padding : 10px;
}

a{
margin : 15px;
}

</style>
</head>
<body bgcolor="skyblue">
	<header class="logo">
		<nav>
			<div class="logoimage">
				<img src="blood.png">
			</div>
			<div class="logoname">
				<h1>Blood Bank</h1>
				<h3>Management System</h3>
			</div>
			<div class="hl">
				<h4><a href="homepage.html">Home Page</a>
				<a href = "adminpage.html">Back</a></h4>
			</div>
		</nav>
	</header>	
<center>
<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try {

	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");

	stmt = conn.createStatement();

	rs = stmt.executeQuery("select * from donors");
	out.print("<h3>");
	out.print("<h1>Donor Information</h1>");
	out.print("<h1><table><tr><th>First Name</th><th>Last Name</th><th>Blood Group</th><th>City</th></tr></h1>");

	while(rs.next())
	{
		String fname = rs.getString("firstname");
		String lname =rs.getString("lastname");
		String bloodgroup = rs.getString("bloodgroup");
		String city = rs.getString("city");
		out.print("<tr align='center'><td>"+fname+"</td><td>"+lname+"</td><td>"+bloodgroup+"</td><td>"+city+"</td></tr>");
	}	
	out.print("</table>");
	out.print("</h3>");
}
catch(Exception ex) {
  out.println("Error2-!!!!!!" + ex);
}					

%>
</center>
</body>
</html>
