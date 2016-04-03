package co.edureka.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edureka.quiz.DatabaseConnectionFactory;
import co.edureka.quiz.Exam;
import co.edureka.quiz.QuizQuestion;

/**
 * Servlet implementation class ExamController
 */
@WebServlet("/exam")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean finish=false;
		
		HttpSession session=request.getSession();	
		String id = (String)session.getAttribute("id");
		String userName = (String)session.getAttribute("user");
		 String selectedExam = "";
		 String started = "";
		try
		{
			if(session.getAttribute("currentExam")==null)
		  {  session=request.getSession(); 	
		      selectedExam=(String)request.getSession().getAttribute("exam"); 
		     System.out.println("Setting Exam "+selectedExam);
			 Exam newExam=new Exam(selectedExam);		  
			 session.setAttribute("currentExam",newExam);
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss a");
				Date date = new Date();
				 started=dateFormat.format(date);
			  session.setAttribute("started",started);
		  }
		
		}catch(Exception e){e.printStackTrace();}
		
        Exam exam=(Exam)request.getSession().getAttribute("currentExam");		
        
        if(exam.currentQuestion==0){	
			exam.setQuestion(exam.currentQuestion);
		    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
			session.setAttribute("quest",q);
        }
			
			String action=request.getParameter("action");
			
			String radio=request.getParameter("answer");
			int selectedRadio=-1;
			exam.selections.put(exam.currentQuestion, selectedRadio);
			if("1".equals(radio))
			{
				selectedRadio=1;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("2".equals(radio))
			{
				selectedRadio=2;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("3".equals(radio))
			{
				selectedRadio=3;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("4".equals(radio))
			{
				selectedRadio=4;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			
						
			if("Next".equals(action)){
				exam.currentQuestion++;
				exam.setQuestion(exam.currentQuestion);
			    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
			  	session.setAttribute("quest",q);
			}
			else if("Previous".equals(action))
			{   System.out.println("You clicked Previous Button");
				exam.currentQuestion--;
				exam.setQuestion(exam.currentQuestion);
			    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
				session.setAttribute("quest",q);
			}
			else if("Finish Exam".equals(action))
			{   finish=true;
			    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss a");
				Date date = new Date();
				 started=dateFormat.format(date);
				int result=exam.calculateResult(exam,id,userName);
				selectedExam=(String)request.getSession().getAttribute("exam");
				insertExamResult(id,userName,selectedExam,result,started,10);
				
				request.setAttribute("result",result);
				request.getSession().setAttribute("currentExam",null);
				request.getRequestDispatcher("/WEB-INF/jsps/result.jsp").forward(request,response);
				
			}
						
		if(finish!=true){
		request.getRequestDispatcher("/WEB-INF/jsps/exam.jsp").forward(request,response);
		}
		
	}

	private void insertExamResult(String id, String userName,
			String selectedExam, int result, String started, int noOfQos) {
		String results = result >= 5 ? "pass":"fail";
		
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
		 Statement st=con.createStatement();
		 String sql = "INSERT INTO result(uid,exam_type,start_time,no_of_qos,corrent_ans,status,studentName) values ('"+id+"','"+selectedExam+"','"+started+"','"+10+"','"+result+"','"+results+"','"+userName+"')";
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
     	}
	
		
	}


