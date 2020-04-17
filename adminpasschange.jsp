<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<body bgcolor="lightblue">
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

	String cp = request.getParameter("currentpassword");
	String np = request.getParameter("newpassword");

	rs=stmt.executeQuery("select password from adminlogin");

	rs.next();
	String currpass = rs.getString("password");

	if(cp.equals(currpass))
	{
		int y = stmt.executeUpdate("update adminlogin set password='"+np+"' where username='admin';");
		if(y>0)
		{
				out.print("<h2>Password Change Successfully...!!!</h2>");
				out.print("<h4><a href='adminpasschange.html'>Click Here</a> to Back to Password Change Page</h4>");
		}
		else
		{
				out.print("<h2>Something went wrong...!!!</h2>");
				out.print("<h4><a href='adminpage.html'>Click Here</a> to go on Admin Home Page</h4>");
		}
	}
	else
	{
		out.print("<h2>Invalid Current Password</h2>");
		out.print("<h4><a href='adminpasschange.html'>Click Here</a> to Back to Password Change Page</h4>");
	}
%>

</center>
</body>
</html>
