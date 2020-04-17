<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<head>
<body bgcolor = lightblue>
</body>
</html>

<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try {
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
}
catch(Exception e){
  out.print(e);
}
			stmt = conn.createStatement();

	String user = request.getParameter("username");
	String pass = request.getParameter("password");


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

if(flag==0)
{

	rs = stmt.executeQuery("select password from donors where username = '"+user+"';");

	rs.next();	
	if(pass.equals(rs.getString("password")))
	{
		HttpSession sessionn = request.getSession();
		sessionn.setAttribute("username",user);	

		response.sendRedirect("donorlogin.jsp");
	}
	else
	{
%>
		<script>
		alert("Invalid password...!!!");
		window.location="donorlogin.html";
	</script>
	
<%	
	}
}
else
{
%>
	<script>
		alert("Username Doesn't Exist...!!!");
		window.location="donorlogin.html";
	</script>
<%
}
%>

