<html>
<head>

	<link rel = "stylesheet" href = "css/sendbox.css" type = "text/css" >
	<script>
         
      </script>
</head>
<body>
	<table>
	<%@ page import = "java.sql.*" %>
	<%
	String uname = "" + session.getAttribute("uname");
	String other;
	String table = "" + session.getAttribute("table");
	if(session.getAttribute("table") == null){
		other = "" + session.getAttribute("reciever");
		session.removeAttribute("reciever");
		if(uname.compareTo(other) > 0){
			table = uname + other;
		}
		else{
			table = other + uname;
		}
		session.setAttribute("table" , table);
	}

	Connection con;
	Statement stmt;
	ResultSet rs;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
		,"44221100");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select * from "+table);
		while(rs.next()){
			out.print("<tr><th>"+rs.getString(1)+" : </th><td>"+rs.getString(2)+" </td></tr>");
		}
		con.close();
	}
	catch(Exception e){
		out.println("There are now messages yet!<br> Start Sending a message");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
			,"44221100");
			stmt = con.createStatement();
			stmt.execute("create table "+table+" ( sender varchar(20) , msg varchar(200) );");
			stmt.execute("insert into m"+session.getAttribute("reciever")+" values ('"+session.getAttribute("uname")+"');");
			con.close();
		}
		catch(Exception ex){
			out.println(" Some Error Occured : " + e + "<br>" + ex);
		}
	}
	%>
	</table>
</body>
</html>