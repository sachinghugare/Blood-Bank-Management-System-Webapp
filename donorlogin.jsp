<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<head>
<link rel="stylesheet" href="logo.css">
<style>

.hl{
margin-left : auto;
margin-right : 70px;
font-size : 30px;
margin-top : 2%;

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
				<button class="btn waves-effect waves-light"><a class="l" href="dlogout.jsp">Logout</a></h3>
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

if(session.getAttribute("username")==null)
{
	response.sendRedirect("donorlogin.html");
}
else
{
		String user = (String)session.getAttribute("username");

		rs=stmt.executeQuery("select firstname from donors where username = '"+user+"';");
		rs.next();
		String name	 = rs.getString("firstname");
		out.print("<h1>Welcome "+name+",</h1>");

		rs = stmt.executeQuery("select * from donorbloodhistory where username = '"+user+"';");
		out.print("<br><h3>Your Donate History</h3><h1><table><tr><th>Blood Quantity</th><th>Donate Date</th></tr></h1>");

		while(rs.next())
		{
			int quantity = rs.getInt("bloodquantity");
			String dt = rs.getString("donatedate");	
			out.print("<tr align='center'><td>"+quantity+" unit = 350ml</td><td>"+dt+"</td></tr>");
		}
		out.print("</table>");
		out.print("<form action='donateblood.jsp' method='POST'>");

		out.print("<br><input type='hidden' value='"+user+"' name='user_name'>");

		out.print("<br><input type='submit' value='Donate-Blood'></form><br><br>");
		
	}
%>
</center>
</body>
</html>
