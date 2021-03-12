package SalEats;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.beans.binding.StringBinding;


/**
 * Servlet implementation class FavoritesServlet
 */
@WebServlet("/FavoritesServlet")
public class FavoritesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		
		PrintWriter out = response.getWriter();
		
		String alpha = request.getParameter("alpha");
		String ralpha = request.getParameter("ralpha");
		String rate = request.getParameter("rate");
		String rrate = request.getParameter("rrate");
		String recent = request.getParameter("recent");
		String rrecent = request.getParameter("rrecent");
		System.out.println(alpha+ralpha+rate+rrate+recent+rrecent);
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String number = request.getParameter("number");
		String cuisine = request.getParameter("cuisine");
		String price = request.getParameter("price");
		String rating = request.getParameter("rating");
		String username = request.getParameter("username");
		
		String imageurl = request.getParameter("imageurl");
		String url = request.getParameter("url");
		
		String rid = request.getParameter("restaurantid");
	
		
		System.out.println(name+" "+address+" "+rid+" "+imageurl+" " + url+" "+number+" "+url+" "+rating);
		
		
		if(Database.existingRestaurant(name)) { //if restaurants already exists in the database
			request.setAttribute("exists", "Restaurant already exists");
			int uid = Database.getUID(username);
			Database.removeRestaurant(rid,uid);
			out.println(false);
			
		}
		else {
			request.setAttribute("exists", "0");
			int uid = Database.getUID(username);
			Database.addRestaurant(name, imageurl, url, address, number, cuisine, price, rating,rid, uid);
			out.println(true);
			
		}
		
		//RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		//dispatch.forward(request, response);
	}

}
