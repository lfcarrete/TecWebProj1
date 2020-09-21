package br.edu.insper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DAO dao;
		try {
			dao = new DAO();
			
			String localUser = request.getParameter("user");
			String localPassword = request.getParameter("password");
			boolean confirm = false;
			List<User> users = dao.getUsers();
			
			
			for(User user : users) {
				System.out.println(user.getUser().equals(localUser));
				System.out.println(user.getPassword().equals(localPassword));
				if(user.getUser().equals(localUser) && user.getPassword().equals(localPassword)) {
				confirm = true;
				System.out.println("Usuario Confirmado");
				}
			}
			 
			
			if(confirm) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("Lista");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
				dispatcher.forward(request, response);
			}
			
			
			dao.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
