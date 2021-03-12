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

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet{
	public static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		String checkbox = request.getParameter("checkbox");
		String next = "/loginsignup.jsp";
		boolean error = false;
		if(username == "" /*|| !Database.verifyUserNotExists(username)*/) {
			//user already exists
			request.setAttribute("usererror", "Enter username");
			error = true;
		}
		if(username!=""&&Database.existingUser(username)) {
			request.setAttribute("error3", "This username already exists");
			error=true;
		}
		/*if(!Database.verifyUserNotExists(username)) {
			request.setAttribute("error2", "Username already exists");
			error = true;
		}*/
		if(email == "") {
			request.setAttribute("emailerror", "Enter email");
			error = true;
		}
		if(password == "") {
			request.setAttribute("passworderror", "Enter password");
			error = true;
		}
		if(confirm_password=="") {
			request.setAttribute("confirmerror", "Enter password again");
		}
		
		if((password!="")&&(confirm_password!="")&&(!password.contentEquals(confirm_password))) {
			request.setAttribute("matcherror", "Password doesn't match");
			error = true;
		}
		if(checkbox==null) {
			request.setAttribute("checkboxerror", "Check the box" );
			error=true;
		}
		if(!error) {
			//String hashed_password = Users.generateHash(password);
			Database.addUser(username, email, password);
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			next = "/index.jsp";
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}
}