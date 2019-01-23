<html>
<head><title>LOGIN Page</title></head>
<body bgcolor = "AA8899">
	<%
		String uname = "" + session.getAttribute("uname");
		if(session.getAttribute("uname") != null){response.sendRedirect("dashboard.jsp");}
	%>
	<%!
		String pbr(int x){
			String res = "";
			while(x-- > 0){
				res = res + "<br>";
			}
			return res;
		}
	%>
	<center>
		<%=pbr(12) %>
		<form action = "submit.jsp" method = "post">
			Username : <input type = "text" name = "uname"> <%=pbr(2)%>
			Password : <input type = "password" name = "pwd"> <%=pbr(3)%>
			<input type = "submit" value = "LOG IN">
		</form>
		<%= pbr(10) %>
		Don't have an account?<br> <a href="signup.jsp">creat one now </a>
	</center>
</body>
</html>