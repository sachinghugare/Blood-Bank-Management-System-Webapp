<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>
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
margin-top : 50px;
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

			String location = request.getParameter("loc");
			String bloodgroup = request.getParameter("bg");

			
			rs=stmt.executeQuery("select * from bloodstock");
			out.print("<table><tr><th> </th></tr>");


	String loc=null;
	String bg=null;
	int qnt=0;

	out.print("<h3>");
	out.print("<table><tr><th> Location </th><th>Blood Group</th><th>Quantity</th></tr>");
		int flag=1;
		while(rs.next())
		{
			loc = rs.getString("location");
			 bg =  rs.getString("bloodgroup");
			qnt =  rs.getInt("quantity");
			if(location.equalsIgnoreCase(loc)&&bloodgroup.equalsIgnoreCase(bg))
			{
				
				out.print("<tr align='center'><td>"+loc+"</td><td>"+bg+"</td><td>"+qnt+" unit<td></tr>");
					out.print("</table>");
				flag=0;
				break;
			}
		}
		if(flag==1)
		{
				out.print("<tr align='center'><td> -----</td><td> -----</td><td> -----</td></tr>");
					out.print("</table>");
				out.print("<br><br><h2>Required blood not available</h2>");
		}
		else{
	out.print("</h3><br><br><br><br><br><br>");
	
	out.print("<form action='seekers.jsp' method='post'>");
%>
 Blood Units :<select class="unit" name="unit" required>

<option value='' disabled selected>Select Unit</option>
<option value'1'>1</option>
<option value'2'>2</option>
<option value'3'>3</option>
<option value'4'>4</option>
<option value'5'>5</option>

</select>
<%

		out.print("<br><input type='hidden' value='"+loc+"' name='loc'>");
		out.print("<br><input type='hidden' value='"+bg+"' name='bg'>");
		out.print("<br><input type='hidden' value='"+qnt+"' name='qnt'>");
	out.print("<input type='submit' value='Request'>");
	out.print("</form>");
	}

%>
</center>
</body>
</html>
