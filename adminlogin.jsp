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

h4{
font-size : 30px;
margin-top : 10%;
}
</style>
</head>
<body bgcolor="skyblue">

<body bgcolor="lightblue">
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

<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from adminlogin");
	int flag=0;
	while(rs.next())
	{
		String ruser = rs.getString("username");
		String rpass = rs.getString("password");

		if(user.equals(ruser)&&pass.equals(rpass))
		{
			response.sendRedirect("adminpage.html");			
			flag=1;
		}
	}

	if(flag==0)
	{
%>
			<script>
		alert("Invalid username or password...!!!");
		window.location="adminlogin.html";
	</script>
<%	
		}
%>

</body>
</html>
