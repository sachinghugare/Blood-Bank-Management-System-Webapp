<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<head>
<link href="logo.css" rel="stylesheet">
<title> Seeker </title>
<style>
.hl{
margin-left : 28%;
margin-top : 1%;
font-size : 20px;
}
body
{
	background-color : lightblue;
}
h3
{
	font-size: 30px;
}

.location
{
	margin-top : 100px;
	padding : 2px 5px 2px 3px;
	width : 250px;
	font-size : 25px;
	border-radius : 20px;
	text-align : center;
}
.blood_group, .loc
{
	margin-top : 50px;
	padding : 5px 10px 5px 10px;
	font-size : 20px;
	border-radius : 20px;
}

.submitbutton{
	margin-top : 50px;
	font-size : 25px;
	border-radius : 20px;
	padding : 5px 20px;
	background : pink;
}


</style>
</head>
<body>
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
<body>
<form class="frm" action="searchblood.jsp" method="post" >
Location:  <select class="loc" name ="loc" required>
<br><br><br>
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

		rs = stmt.executeQuery("select distinct(location) from bloodstock");


out.print("<br><br>");

out.print("<option value='' disabled selected>Select Location</option>");
String loc = null;
String loc1 = null;
while(rs.next())
{
loc1 = rs.getString("location");
out.print("<option value='"+loc1+"'>");
loc = rs.getString("location");
out.print(loc);
out.print("</option>");
}
out.print("</select>");
out.print("<br><br>");
%>
		




Blood Group:<select class="blood_group" name="bg" required>

<option value='' disabled selected>Select blood group</option>
<option value'A+'>A+  </option>
<option value='B+'>B+  </option>
<option value="O+">O+  </option>
<option value='AB+'>AB+</option>
<option value='A-'>A-  </option>
<option value='B-'>B-  </option>
<option value='O-'>O-  </option>
<option value='AB-'>AB-</option>
</select>
<br><br>


<input class="submitbutton" type="submit" value="Search Blood">

</form>
</center>
</body>
</html>
