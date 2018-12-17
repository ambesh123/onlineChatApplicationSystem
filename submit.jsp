<html>
<head><title> Decider</title></head>
<body bgcolor = "AA8899">
	<%@ page import = "java.sql.*" %>
	<%@ page import = "javax.sql.*" %>
	<%
		String uname = request.getParameter("uname");
		uname = uname.toLowerCase();
		String pwd  = request.getParameter("pwd");
		boolean access = false;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root"
				,"44221100");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from users where uname = '"+uname+"'");
			while(rs.next()){
				if(pwd.equals(rs.getString(2)))access = true;
			}
			con.close();
			if(access){
				session.setAttribute("uname",uname);
				response.sendRedirect("dashboard.jsp");
			}
			else{
				out.println("UNAUTHORIZED ACCESS ATTEMPT");
			}
		}
		catch(Exception e){
			out.println("Some Error Occured<br>"+e);
		}
	%>
</body>
</html>