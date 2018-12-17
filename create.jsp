<html>
<head><title>Redirecting...</title></head>
<body bgcolor = "AA8899">
	<%@ page import = "java.sql.*" %>
	<%@ page import = "javax.sql.*" %>
	<%
		String uname = request.getParameter("uname");
		uname = uname.toLowerCase();
		String pwd  = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		boolean access = false;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root"
				,"44221100");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from users where uname = '"+uname+"';");
			if(rs.next()){
				out.println("<h2>User Already Exists!<h2><h3>Choose another username </h3>");
				throw new Exception("User Already Exists");
			}
			stmt.executeUpdate("insert into users values (" + "'"+uname+"' , '"+pwd+"' , '"+name+"' , '"+email+"');");
			con.close();
			try
			{
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
				,"44221100");
				stmt = con.createStatement();
				stmt.execute("create table m"+uname+" (sender varchar(20));");
			}
			catch(Exception e){throw e;}
			out.println("<h2>Account Created Successfully!!!<h2><br><br><a href = \"index.jsp\">Goto Login Page</a>");
		}
		catch(Exception e){
			if(!e.toString().contains("User Already Exists"))out.println("Some Error Occured<br>Try again later");
		}
	%>
</body>
</html>