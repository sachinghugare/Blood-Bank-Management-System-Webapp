<html>
<head>
	<title>Donor Login</title>

	<style>

body{
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: linear-gradient(to right, #33ccff 10%, #ff99cc 90%);
}

.hh1{
margin-bottom : 50px;
margin-top : 20px;
}



nav{
	width: 100%;
	height: 100px;
	display: flex;
}

.logoimage{
	width: 10%;
}


.logoimage img{
	height: 100%;
	width: 80%;
	padding-left: 25%;
	padding-top: 15%;
}
.logoname{
	width: 40%;
	line-height: 5px;
}

.logoname h1{
	padding-left: 10px;
	font-size: 45px;
}

.logoname h3{
	padding-left: 10px;
	font-size: 25px;
}

h3{
	margin : 0px;
	padding : 0px;
}

.form{
height : 600px;
width : 1000px;
margin-left : 15%;
padding : 20px;
}

label{
font-size : 25px;
margin : 20px;
}

input{
margin-bottom : 30px;
}

date{
	font-size  : 30px;
}

select{
margin-bottom : 30px;
width : 220px;
text-align : center;
}
select option{
text-align : center;	
}

.glabel{
	font-size : 20px;
}

.submitbutton{
	font-size : 30px;
	align  : center;
	width : 200px;
	margin-left : 300px;
	margin-top : 50px;
	border : 2px solid black;
	border-radius : 10px;
	background : #f14646;
	color : #24c6d6;
	padding : 5px 10px;
}

.ahaa{
	margin : 0px;
	padding : 0px;
	font-size : 20px;
	margin-left : 200px;
}

.hl{
margin-top : 3%;
margin-left : 30%;
font-size : 20px;
}
.sq{
margin-left : 15px;
width : 260px;
}

.sqa{
font-size : 20px;
margin-left : 20px;
}

	</style>
	</head>
<body>
	<header class='logo'>
		<nav>
			<div class='logoimage'>
				<img src='blood.png'>
			</div>
			<div class='logoname'>
				<h1>Blood Bank</h1>
				<h3>Management System</h3>
			</div>
			<div class='hl'>
				<h3><a href='homepage.html'>Home Page</a></h3>
			<div>
	</header>	
<%
	String loc = request.getParameter("loc");
	String bg = request.getParameter("bg");
	int qnt= Integer.parseInt(request.getParameter("qnt"));	
	int unit = Integer.parseInt(request.getParameter("unit"));
if(unit<=qnt)
{
out.print("<form class ='form' action='bloodrequestpage.jsp' method='post'>");
out.print("<h1 align='center' class='hh1'>Seekers Details</h1>");
out.print("<label>First Name&emsp;&ensp;: </label><input type='text' name='firstname' required>");
out.print("<label>Last Name &emsp;: </label><input type='text' name='lastname' required><br>");
out.print("<label>Gender &emsp;&emsp;&nbsp;&ensp;: </label>");
out.print("<input type='radio' name='gender' value='male' required> <label class='glabel'>Male</label>");
out.print("<input type='radio' name='gender' value='female' required><label class='glabel'>Female</label><br>");
out.print("<label>Address &emsp;&emsp;&ensp;: </label><input type='text' name='address' required>");
out.print("<label>City &emsp;&emsp;&ensp;&emsp;&emsp;: </label>");
out.print("<input type='text' name='city' required><br>");
out.print("<label>Date of Birth : <label><input type='date' name='dob' required>");
out.print("<label>&emsp;&emsp;&emsp;Mobile &emsp;&emsp;&emsp;: </label><input type='text' name='mobile' required><br>");

		out.print("<input type='hidden' value='"+loc+"' name='loc'>");
		out.print("<input type='hidden' value='"+bg+"' name='bg'>");
		out.print("<input type='hidden' value='"+qnt+"' name='qnt'>");
		out.print("<br><input type='hidden' value='"+unit+"' name='unit'>");
out.print("<center>");
out.print("<input type='submit' value='Get Blood'>");
out.print("</center>");
out.print("</form>");
}
else
{
	
		out.print("<center><h1>Sorry...!!!<br>Required unit of blood not available.</h1></center>");
}









%>
</body>
</html>
