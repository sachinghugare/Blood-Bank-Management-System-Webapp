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

			String user = request.getParameter("user");
			String securityquestion=null;
		
			rs = stmt.executeQuery("select * from donors where username='"+user+"';");
			while(rs.next())
			{
				securityquestion = rs.getString("securityquestion");
				break;
			}

			out.print("<br><br><br><br>");
			out.print("<form action='secqueans.jsp' method='post	'>");
			out.print("<h2>'"+securityquestion+"'<h2>");	
			out.print("<br><input type='text' placeholder='Enter your answer' name='ans'>");
			out.print("<input type='hidden' value='"+user+"' name='user'><br><br>");
			out.print("<input type='submit' value='Get Password'>");
			out.print("</form>");
%>
</body>
</html>
