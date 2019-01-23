<!DOCTYPE html>
<html>
<head>
	<title>CHAT</title>
	<link rel = "stylesheet" href = "css/sendbox.css" type = "text/css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script >

		function saveMessage(){
			$.get(
					"savemessage.jsp" ,
					{
						msg : document.getElementById("msg").value
					} ,
					function(res , stat){
							document.getElementById("msg").value = "";
					}
				);
		}

		var cnt = 0;

		$(document).ready(
				function(){
					$(".typebox").keypress(
							function(e){
								if(e.keyCode == 13)saveMessage();
							}
						)
				}
			);

		$(document).ready(
				setInterval(
				 function(){
					$.get(
						"getMessageCount.jsp" ,

						function(res , stat){
							if(parseInt(res) != cnt){
								cnt = parseInt(res);
								$.get(
								"getLastMessage.jsp" ,
								function(res , stat){
									$(".board table").append(res);
								}
								);
							}
						}
						)
				}
				 , 500
				)
				
				
			);
	</script>


</head>
<body>
<%
	if(session.getAttribute("uname") == null){
			response.sendRedirect("index.jsp");
		}
	String uname = session.getAttribute("uname") + "";
	String other = request.getParameter("hid");
	String tname = "";
	if(uname.compareTo(other) > 0){
		tname = uname + other;
	}
	else{
		tname = other + uname;
	}
	session.setAttribute("table" , tname);
%>
	<a href = "dashboard.jsp" id = "home">HOME</a>

<div class = "board" style="height: 600px; width: 80%">
	<table>
		
	</table>
</div>

		<input type = "text" id = "msg" class = "typebox">
		<button class = "sendbutton" onclick="saveMessage()">Send</button>

</body>
</html>