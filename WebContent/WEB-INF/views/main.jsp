<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*,br.edu.insper.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UFT-8">
		<title>Exemplo de JSP</title>
	</head>
	<body>
	<h1>Lista de Tasks</h1>
		<table border='1'>
			<tr>
				<td> Tasks </td>
			</tr>
		
			
			<c:forEach var="task" items="${tasks}">
			 	<tr>
			 		<td>${task.task}</td>
			 		<td>
				 		<form action='Atualiza'>
				 			<input type='hidden' name='id' value=${task.id}>
							<input type='submit' value="Atualiza Task">
						</form>
					</td>
					<td>
				 		<form action='Remove' method='post'>
				 			<input type='hidden' name='id' value=${task.id}>
							<input type='submit' value="Remove Task">
						</form>
					</td>
			 	</tr>
			</c:forEach>
		</table>
		<form action='Cria'>
			<input type='submit' value="Cria Task">
		</form>
		
	</body>
</html>