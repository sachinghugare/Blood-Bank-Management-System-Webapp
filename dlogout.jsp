<%
	HttpSession sessionn = request.getSession();
	sessionn.removeAttribute("user");
	sessionn.removeAttribute("username");
	sessionn.invalidate();

	response.sendRedirect("donorlogin.html");
%>
