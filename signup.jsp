<html>
<head>
	<title>Create Account</title>
	<script>
		function validate(){
			for(var i = 0; i< document.forms[0].length; i++)if(document.forms[0].elements[i].value.length == 0){
				alert("Fill form correctly"); return false;
			}
			return true;
		}
	</script>
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
	<center>
		<%=pbr(12) %>
		<form action = "create.jsp" method = "post" onsubmit = "return validate()">
			<table>
			<tr><td>Username  </td> <td><input type = "text" name = "uname"></td></tr> 
			<tr><td>Full Name  </td> <td><input type = "text" name = "name"> </td></tr> 
			<tr><td>E-mail   </td> <td><input type = "email" name = "email"> </td></tr> 
			<tr><td>Password  </td> <td><input type = "password" name = "pwd"></td></tr>
			<!--<tr><td>Upload Pic </td><td><input type = "file" name = "pic"></td></tr> -->
			</table>
			<%= pbr(3) %>
			<input type = "submit" value = "Sign Up">
		</form>
		<%= pbr(10) %>
		Already have an account?<br> <a href="index.jsp">Log in </a>
	</center>
</body>
</html>