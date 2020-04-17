<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<head>
<link rel="stylesheet" href="logo.css">
<style>

.hl {
padding-left : 200px;
margin-left : 6%;
margin-top : 15px;	
}

.hl h3{
font-size : 20px;
margin-left : 50px;
}

.l{
margin-left : 50px;
}

table,th,td{
border : 1px solid black;
border-collapse :  collapse;
font-size : 20px;
padding : 10px;
}
</style>
</head>
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

<center>

<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try {
  	Class.forName("com.mysql.jdbc.Driver");
  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
	stmt = conn.createStatement();
	
	String fn = request.getParameter("firstname");
	String ln = request.getParameter("lastname");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("address");
	String city = request.getParameter("city");	
	String dob = request.getParameter("dob");
	String mob = request.getParameter("mobile");

	String loc = request.getParameter("loc");
	String bg = request.getParameter("bg");
	int qnt= Integer.parseInt(request.getParameter("qnt"));
	int unit = Integer.parseInt(request.getParameter("unit"));
		out.print("<br><br><br><br><br>");

		
			int x = stmt.executeUpdate("insert into seekers values('"+fn+"','"+ln+"','"+gender+"','"+addr+"','"+city+"','"+dob+"','"+mob+"','"+loc+"','"+bg+"','"+unit+"',curdate());");

			qnt = qnt - unit;			

			int y =stmt.executeUpdate("update bloodstock set quantity='"+qnt+"' where location='"+loc+"' and bloodgroup='"+bg+"';");			

			if(y>0)
			{	
				out.print("<h1>Requested Successfully....!!!<br>Collect blood at '"+loc+"' blood bank</h1>");
			}
			else
				out.print("<h1>Something went wrong</h1>");
		}

catch(Exception ex) {
	out.println("Error : " + ex);
}

%>
</body>
</html>
