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

a{
margin : 15px;
}

table,th,td{
border : 1px solid black;
border-collapse :  collapse;
font-size : 23px;
padding : 5px;
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
				<a href="adminpage.html">Back</a></h4>
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
}
catch(SQLException ex) {
  System.out.println("Error2-!!!!!!" + ex);
}

			stmt = conn.createStatement();

			rs = stmt.executeQuery("select * from seekers");

out.print("<h3>");
	out.print("<h1>Seeker Information</h1>");
	out.print("<h1><table><tr><th>First Name</th><th>Last Name</th><th>City</th><th>Blood Received Location</th><th>Blood Group</th><th>Blood Quantity</th><th>Date</th></tr></h1>");

	while(rs.next())
	{
		String fname = rs.getString("firstname");
		String lname =rs.getString("lastname");
		String city = rs.getString("city");
		String loc = rs.getString("bslocation");
		String bg = rs.getString("bsbloodgroup");
		int qnt = rs.getInt("bsquantity");
		String dt = rs.getString("bsdate");
		out.print("<tr align='center'><td>"+fname+"</td><td>"+lname+"</td><td>"+city+"</td><td>"+loc+"</td><td>"+bg+"</td><td>"+qnt+"</td><td>"+dt+"</td></tr>");

	}	
	out.print("</table>");
	out.print("</h3>");
			

%>
</center>
</body>
</html>
