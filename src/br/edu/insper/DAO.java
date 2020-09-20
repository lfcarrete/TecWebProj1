package br.edu.insper;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class DAO {
	
	private Connection connection = null;
	
	public DAO () throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/meus_dados", "root", "288032");
	}
	
	public List<Task> getLista() throws SQLException{
		List<Task> tasks = new ArrayList<Task>();
		
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM tasks");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Task task = new Task();
			task.setId(rs.getInt("id"));
			task.setTask(rs.getString("task"));
			Calendar date = Calendar.getInstance();
			date.setTime(rs.getDate("criado"));
			task.setDate(date);
			tasks.add(task);
		}
		
		rs.close();
		stmt.close();
		
		return tasks;
	}
	
	public void adiciona (Task task) throws SQLException {
		String sql = "INSERT INTO tasks (task, criado) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, task.getTask());
		long millis=System.currentTimeMillis();
		java.sql.Date date=new java.sql.Date(millis);
		stmt.setDate(2,date);
		stmt.execute();
		stmt.close();
	}
	
	public void altera (Task task) throws SQLException {
		String sql = "UPDATE tasks SET " + "task=? WHERE id=?";
		
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, task.getTask());
		stmt.setInt(2, task.getId());
		stmt.execute();
		stmt.close();
	}
	
	public void remove(Integer id) throws SQLException {
		PreparedStatement stmt = connection.prepareStatement("DELETE FROM tasks WHERE id=?");
		
		stmt.setLong(1, id);
		stmt.execute();
		stmt.close();
	}
	
	public void close () throws SQLException {
		connection.close();
	}
	
	//login
	
}
