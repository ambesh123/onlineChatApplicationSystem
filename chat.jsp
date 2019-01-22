<!DOCTYPE html>
<html>
<head>
	<title>CHAT</title>
	<style type="text/css">
		
	#home{
		position: fixed;
		right: 10px;
		font-size: 20px;
	}
	</style>
</head>
<body>
<%
	if(session.getAttribute("uname") == null){
			response.sendRedirect("index.jsp");
		}
	session.setAttribute("reciever" , request.getParameter("hid"));
%>
	<a href = "dashboard.jsp" id = "home">HOME</a>

	<iframe class="msgbox" src="chat1.jsp" height="550" width="100%"></iframe>
	<br>
 	 <iframe class="typebox" src="chat2.jsp" height="120" width="100%"></iframe>
</body>
</html>