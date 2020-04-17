<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>
<html>
<head>
<link href="logo.css" rel="stylesheet">
<style>
.hl{
margin-left : 33%;
margin-top : 1%;
font-size : 20px;
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
}
catch(Exception e){
  out.print("Error1-!!!!!!" + e);
}
try {
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
}
catch(SQLException ex) {
  System.out.println("Error2-!!!!!!" + ex);
}

			stmt = conn.createStatement();

			out.print("<h1>Forget Password</h1>");
	
			out.print("<form action='asksecque.jsp' action='post'>");
			out.print("<br><br><br><br><input type='textbox' name='user' placeholder='Enter Username'>");
			out.print("<br><br><input type='submit' value='Next'>");
			out.print("</form>");
%>
</center>
</body>
</html>
