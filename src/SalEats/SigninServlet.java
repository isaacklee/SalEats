package SalEats;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javafx.beans.binding.StringBinding;



@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet{
	public static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String next = "/loginsignup.jsp";
		String gsignin = request.getParameter("googlesignin");
		System.out.println(gsignin);
		
		if(gsignin!=null) {
			System.out.println("entered");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			next = "/index.jsp";
		}
		else {
			
			if(username=="") {
				request.setAttribute("error1", "Enter username.");
				
			}
			
			if(password==""){
				request.setAttribute("error2", "Enter password.");
			}
			if(Users.authenticateUser(username, password)) {
				next = "/index.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
			}else {
				request.setAttribute("err3", "Invalid username or password entered.");
			}
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}
}