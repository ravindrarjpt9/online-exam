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

@WebServlet("/checkFeedback")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String comment=request.getParameter("text");
		
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
		 Statement st=con.createStatement();
		 String sql = "INSERT INTO feedback(NAME,EMAIL,COMMENTS) values ('"+name+"','"+email+"','"+comment+"')";
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
        request.setAttribute("name",name);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsps/feedbackSuccess.jsp");
		dispatcher.forward(request, response);		
	}
	
	
	

}
