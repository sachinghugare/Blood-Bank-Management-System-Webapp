<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>
<html>
<head>
<link href="logo.css" rel="stylesheet">
<style>
.hl{
margin-left : 21%;
margin-top : 1%;
font-size : 15px;
}

a{
margin : 35px;
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
				<a href="donorlogin.html">Donor Login</a>
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

			String pass = null;
			String securityqueans = null;
			String fn=null;

			String user = request.getParameter("user");
			String ans = request.getParameter("ans");
	
			rs = stmt.executeQuery("select * from donors where username='"+user+"';");
			while(rs.next())
			{
				securityqueans = rs.getString("securityqueans");
				pass = rs.getString("password");
				fn = rs.getString("firstname");
				break;
			}
			out.print("<br><br><br>");
			if(ans.equals(securityqueans))
			{
				out.print("<h1>Hi "+fn+",</h1><br>");
				out.print("<h2>Your Password is </h2>");
				out.print("<h2>"+pass+"</h2>");		
			}
			else
			{
				out.print("<h1>Invalid Answer....!!!<br>Please Enter valid answer.<h1>");
				out.print("<button onClick='goBack()'>Go Back</button></h3>");
			}
		


%>
<script>
function goBack(){
window.history.back();
}
</script>


</body>
</html>
