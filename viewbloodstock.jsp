<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>
<html>
<head>
<link href="logo.css" rel="stylesheet">
<style>
.hl{
margin-left : 28%;
margin-top : 1%;
font-size : 20px;
}

table,th,td{
border : 1px solid black;
border-collapse :  collapse;
font-size : 30px;
margin-top : 50px;
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
				<h3><a href="homepage.html">Home Page</a>
				<a href="adminpage.html">Back</a></h3>
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

			rs = stmt.executeQuery("select * from bloodstock");
			
			out.print("<h1>Blood Availability</h1>");
			out.print("<table><tr><th> Location </th><th>Blood Group</th><th>Unit</th></tr>");
			while(rs.next())
			{
				String loc = rs.getString("location");
				String bg = rs.getString("bloodgroup");
				int qnt = rs.getInt("quantity");
				out.print("<tr align='center'><td>"+loc+"</td><td>"+bg+"</td><td>"+qnt+" unit<td></tr>");
			}
%>
</center>
</body>
</html>
