<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UFT-8">
<title>Login</title>
<style>
			body {
				background-color:#dddddd;
			}
			h1 {
				text-align:center;
			}
			form{
				text-align:center;
			}
			input{
				
				margin: 20px;
			}
		</style>
</head>
<body>
	<h1>Cadastro</h1>
	<form action='Cadastro' method='post'>
		<input type="text" name='user' placeholder='Username' required><br>
		<input type="password" name='password' placeholder="password" required><br>
		<input type='submit' value='Criar Conta'>
	</form>
</body>
</html>