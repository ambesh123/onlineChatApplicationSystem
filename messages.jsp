<html>
<head>
	<link rel = "stylesheet" href = "css/list2.css" type = "text/css" >
	<script >
		function fsubmit(x){
			document.hidden.hid.value = x;
			document.hidden.submit();
		}
	</script>
</head>
<body onload = "document.hidden.style.display = 'none'">

<%
		String tbl = "m" + session.getAttribute("uname");
%>
<form name = "hidden" action = "chat.jsp">
<input type = "text" name = "hid">
</form>
<ol>
<%@ page import = "java.sql.*" %>
<%  session.removeAttribute("table");
	try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
				,"44221100");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from "+tbl);
				while(rs.next()){
					String sender = rs.getString(1);
					out.println("<li><a href = 'javascript:fsubmit(\""+sender+"\")'>"+sender+" </li></a>");
					
				}
				con.close();
			}

			catch(Exception e){
			out.println("Some Error Occured!!<br><br>" + e);
			}
		
%>
</ol>
</body>
</html>