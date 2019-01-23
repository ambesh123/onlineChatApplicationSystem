<%@page import = "java.sql.*"%>
<%
	try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
			,"44221100");
			Statement stmt = con.createStatement();
			String sender = "" + session.getAttribute("uname");
			String msg = request.getParameter("msg");
			stmt.executeUpdate("insert into "+session.getAttribute("table")+" values ('"+sender+"' , '"+msg+"');");
			con.close();
			out.println(sender+" : "+msg);
		}
		catch(Exception ex){
			out.println(" Some Error Occured : "+ ex);
		}
%>