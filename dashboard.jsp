<html>
<head>
	<title>Welcome <%=session.getAttribute("uname")%></title>
	<style>
		#logout{
			border: 5px solid red;
			background-color: tomato;
			position: fixed;
			padding: 6px;
			right: 5px;
			bottom: 15px;
		}
		#inbox{
			border: 5px solid green;
			background-color: #009999;
			float: right;
			padding: 10px;
			font-size: 30px;
		}
		.srchusr{
			position: fixed;
			top : 30px;
			right: 10px;
		}
		.search{
			background-color: #8384FF;
		}
	</style>
</head>
<body bgcolor = "AA8899">
	<%!
		String pbr(int x){
			String res = "";
			while(x-- > 0){
				res = res + "<br>";
			}
			return res;
		}
	%>
	<%
		String uname = ""+session.getAttribute("uname");
		if(uname.length() == 0 || uname == "null"){
			response.sendRedirect("index.html");
		}
	%>
	<%@ page import = "java.sql.*" %>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root"
				,"44221100");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from users where uname = '"+uname+"'");
		rs.next();
		
	%>
	<% try{
		out.println("<center>"
			+pbr(6)+"<h2> Welcome "+ rs.getString(3) + "</h2></center>"
			+ pbr(6) + "<h3><u>Details</u> <br> <br>Username : " +
			 rs.getString(1) + "<br>Name : " +
			 rs.getString(3)+ "<br>Email : " +
			 rs.getString(4) +"</h3>");
		}
		catch(Exception e){
			out.println("Error Occured");
		}
	%>
	<form action = "searchuser.jsp" class = "srchusr">
		<input type = "text" name = "searcheduser">
		<input type = "submit" value = "Search User" class = "search">
	</form>
	<a href="messages.jsp" id = "inbox">MY INBOX</a>
	<a href="logout.jsp" id = "logout">LOG OUT </a>
</body>
</html>