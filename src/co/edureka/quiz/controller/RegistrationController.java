package co.edureka.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.edureka.quiz.DatabaseConnectionFactory;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/checkRegister")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
		 Statement st=con.createStatement();
		 String sql = "INSERT INTO users(username,password,email) values ('"+username+"','"+password+"','"+email+"')";
		 		System.out.println(sql);
		 st.executeUpdate(sql);
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
			}
		try
		{
		 con.close();	
		}catch(SQLException se){
			System.out.println("Error : While Closing Connection");
			
		}
        request.setAttribute("newUser",username);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsps/regSuccess.jsp");
		dispatcher.forward(request, response);		
	}
	
	
	

}
