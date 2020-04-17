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

#t{
	margin-top: 10%;
}

a{
margin : 15px;
}

h2{
margin-top : 9%;
font-size : 35px;
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
	

	 		String name1 =request.getParameter("user_name");

			rs=stmt.executeQuery("select * from donors where username='"+name1+"';");
			String bg=null;
			String city=null;

			while(rs.next())
			{
			bg=rs.getString("bloodgroup");
			city=rs.getString("city");
			}
	
				int y =stmt.executeUpdate("insert into donorbloodhistory values('"+name1+"','"+bg+"',1,curdate());");	
				
				rs = stmt.executeQuery("select * from bloodstock;");
				int flag=1;
			
				String loc = null;
				String bloodgroup = null;

				while(rs.next())
				{
					loc = rs.getString("location");
					bloodgroup = rs.getString("bloodgroup");
					if(loc.equalsIgnoreCase(city)&&bloodgroup.equalsIgnoreCase(bg))
					{
						flag=0;	
						break;
					}
				}

				if(flag==1)
				{
					stmt.executeUpdate("insert into bloodstock values('"+bg+"',1,'"+city+"');");
				}
				else
				{
					rs=stmt.executeQuery("select * from bloodstock where location='"+loc+"' and bloodgroup='"+bloodgroup+"';");
					int rqnt=0;				
					while(rs.next())
					{
						rqnt = rs.getInt("quantity");		
					
					rqnt = rqnt + 1;			
					int x =stmt.executeUpdate("update bloodstock set quantity='"+rqnt+"' where location='"+city+"' and bloodgroup='"+bloodgroup+"';");
					break;
					}
				}

%>

		<script>
		alert("Thanks for Donating Blood...!!!");
		window.location="donorlogin.jsp";
	</script>


</center>
</body>
</html>








