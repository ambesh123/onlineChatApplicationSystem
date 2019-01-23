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
		if(session.getAttribute("uname") == null){
			response.sendRedirect("index.jsp");
		}
		String su = request.getParameter("searcheduser");
		out.println("<h2>Searched KeyWord : " + su + "<br><h2>");
%>
<form name = "hidden" action = "chat.jsp">
<input type = "text" name = "hid">
</form>
<ol>
<%@ page import = "java.sql.*" %>
<% session.removeAttribute("table");
	try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root"
				,"44221100");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from users");
				while(rs.next()){
					String tu = rs.getString(3);
					String tun = rs.getString(1);
					if(tu.length() >= su.length()){
						if(su.equalsIgnoreCase(tu.substring(0,su.length()))){
							out.println("<li><a href = 'javascript:fsubmit(\""+tun+"\")'>"+tu+" ("+tun+") </li></a>");
						}
					}
				}
				con.close();
			}

			catch(Exception e){
			out.println("Some Error Occured!!" + e);
			}
		
%>
</ol>
</body>
</html>