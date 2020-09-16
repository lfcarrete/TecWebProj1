<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Exemplo de JSP</title>
	</head>
	<body>
	<h1>Lista de Tasks</h1>
		<%@ page import="java.util.*,br.edu.insper.* %>
		<table border='1'>
			<tr>
				<td> Tasks </td>
			</tr>
		<%DAO dao = new DAO();
			List<Task> tasks = dao.getLista();
			for (Task task : tasks){ %>
			 	<tr>
			 		<td><%=task.getTask() %></td>
			 		<td>
				 		<form action='Atualiza'>
				 			<input type='hidden' name='id' value=<%=task.getId() %>>
				 			<%String taskResp = task.getTask() %>
				 			<input type='hidden' name='task' value=<%=taskResp %>>
							<input type='submit' value="Atualiza Task">
						</form>
					</td>
					<td>
				 		<form action='Remove' method='post'>
				 			<input type='hidden' name='id' value=<%=task.getId() %>>
							<input type='submit' value="Remove Task">
						</form>
					</td>
			 	</tr>
		<%} %>
		</table>
		<form action='Cria'>
			<input type='submit' value="Cria Task">
		</form>
		
	</body>
</html>