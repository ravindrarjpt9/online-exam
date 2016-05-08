package co.edureka.quiz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;

import co.edureka.quiz.CreateDOM;

@WebServlet(urlPatterns = { "/login", "/register", "/takeExam", "/logout" ,"/feedback","/contact"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String applicationContextPath = request.getContextPath();

		if (request.getRequestURI().equals(applicationContextPath + "/")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/login")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/login.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/feedback")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/feedback.jsp");
			dispatcher.forward(request, response);
		}  else if (request.getRequestURI().equals(
				applicationContextPath + "/contact")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/contact.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/register")) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/register.jsp");
			dispatcher.forward(request, response);
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/takeExam")) {
			request.getSession().setAttribute("currentExam", null);
			request.getSession().setAttribute("totalNumberOfQuizQuestions",null);
			request.getSession().setAttribute("quizDuration",null);
			request.getSession().setAttribute("min",null);
			request.getSession().setAttribute("sec",null);

			String exam = request.getParameter("test");
			request.getSession().setAttribute("exam", exam);

			System.out.println(request.getSession().getAttribute("user"));
			
			if (request.getSession().getAttribute("user") == null) {
				request.getRequestDispatcher("/login").forward(request,
						response);
				
			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/WEB-INF/jsps/quizDetails.jsp");
				Document document=null;
				try{
				document=CreateDOM.getDOM(exam);
				
				//request.getSession().setAttribute("totalNumberOfQuizQuestions",document.getElementsByTagName("totalQuizQuestions").item(0).getTextContent());
				//request.getSession().setAttribute("quizDuration",document.getElementsByTagName("quizDuration").item(0).getTextContent());
				//request.getSession().setAttribute("min",document.getElementsByTagName("quizDuration").item(0).getTextContent());
				//request.getSession().setAttribute("sec",0);
				request.getSession().setAttribute("totalNumberOfQuizQuestions","10");
				request.getSession().setAttribute("quizDuration","10");
				request.getSession().setAttribute("min","2");
				request.getSession().setAttribute("sec",0);

				System.out.println("Minutes "+request.getSession().getAttribute("min")+"---------------- sec   "+request.getSession().getAttribute("sec"));
				}				
				catch(Exception e){e.printStackTrace();}
				dispatcher.forward(request, response);
			}
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/logout")) {
			request.getSession().invalidate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			dispatcher.forward(request, response);
		}

	}

}
