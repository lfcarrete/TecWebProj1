<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*,br.edu.insper.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UFT-8">
		<title>Lista Tasks</title>
		<style>
			body {
				background-color:#dddddd;
			}
			
			table {
				border-collapse: collapse;
				width: 100%;
			}
			
			
			tr:hover {background-color:#f5f5f5;}
		</style>
	</head>
	<body>
	
	<h1 align="center">Lista de Tasks</h1>
	
		<table style="border-collapse: collapse; width: 100%; margin-bottom:50px;">
	  		
	  		
			<tr>
				<td style="font-size:150%; font-weight: bold;"> Tasks </td>
				<td style="font-size:150%; font-weight: bold;"> Data de Criação </td>
			</tr>
		
			
			<c:forEach var="task" items="${tasks}">
			 	<tr>
			 		<td style="padding: 8px; text-align: left; border-bottom: 1px solid #000000;">${task.task}</td>
			 		<td style="padding: 8px; text-align: left; border-bottom: 1px solid #000000;">${task.date.getTime()}</td>
			 		
			 		<td style="padding: 8px; text-align: left; border-bottom: 1px solid #000000;">
				 		<form action='Atualiza'>
				 			<input type='hidden' name='id' value=${task.id}>
							<input type='submit' value="Atualiza Task">
						</form>
					</td>
					<td style="padding: 8px; text-align: left; border-bottom: 1px solid #000000;">
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