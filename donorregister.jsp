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


}
catch(Exception ex) {
  System.out.println(ex);
}




String fn = request.getParameter("firstname");
String ln = request.getParameter("lastname");
String gender= request.getParameter("gender");
String dob = request.getParameter("dob");
String bg =  request.getParameter("bg");
int wt = Integer.parseInt(request.getParameter("weight"));
String addr = request.getParameter("address");
String city = request.getParameter("city");
String user = request.getParameter("username");
String pass = request.getParameter("password");
String secquestion = request.getParameter("securityquestion");
String secqueans = request.getParameter("securityqueans");

rs=stmt.executeQuery("select username from donors");

	int flag=1;
	while(rs.next())
	{
		String retrived_user = rs.getString("username");
		if(user.equals(retrived_user))
		{	
			flag=0; 
			break; 
		}
	}
out.print("<br><br>");

if(flag==0)
{
	out.print("<h2>Username already taken....choose another</h2>");
	out.print("<h3><a href='donorregister.html'>Click Here</a> to go back on register page</h3>");
}
else
{
			int y = stmt.executeUpdate("insert into donors values('"+fn+"','"+ln+"','"+gender+"','"+dob+"','"+bg+"','"+wt+"','"+addr+"','"+city+"','"+user+"','"+pass+"','"+secquestion+"','"+secqueans+"');");
if(y>=1)
{
	out.print("<h1>Registration Successfully</h1>");
	out.print("<h3><a href='donorlogin.html'>Click Here</a> to go on login page</h3>");
}
else
{	
	out.print("<h1>Something went wrong...</h1>");
	out.print("<h3><a href='donorregistration.html'>Click Here</a> to go back on register page</h3>");
}
}



%>
</center>
</body>
</html>
