package SalEats;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet{
	
	public static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "/index.jsp";
		String name = request.getParameter("name");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String button = request.getParameter("button");
		String indicator =request.getParameter("resultpage");
		Boolean error = false;
		System.out.println("name = "+name+" lat =  "+latitude+" long =  "+longitude+" button  =  "+button);
		System.out.println("indicator = "+indicator);
		if(indicator.equals("result")) {
			next="/searchresult.jsp";
		}
		if(indicator.equals("index")) {
			next="/index.jsp";
		}
		if(name=="") {
			System.out.println("Entered1");
			request.setAttribute("error1", "Enter restaurant name.");
			error=true;
		}
		if(latitude=="") {
			System.out.println("Entered2");
			request.setAttribute("error2", "Enter latitude.");
			error=true;
		}
		if(longitude=="") {
			System.out.println("Entered3");
			request.setAttribute("error3", "Enter longitude.");
			error=true;
		}
		if(button==null) {
			System.out.println("Entered4");
			request.setAttribute("error4", "Pick from the options");
			error=true;
		}
		if(!error) {
			System.out.println("Entered");
			next="/searchresult.jsp";
			
			YelpParse yelpParse = new YelpParse(name,latitude,longitude, button);
			ArrayList<YelpRestaurant>data = yelpParse.parse();
			for(int i=0;i<data.size();i++) {
				request.setAttribute("image"+i,data.get(i).getImage());
				request.setAttribute("name"+i,data.get(i).getName());
				request.setAttribute("address"+i, data.get(i).getAddress());
				request.setAttribute("url"+i, data.get(i).getUrl());
				request.setAttribute("number"+i, data.get(i).getNumber());
				request.setAttribute("category"+i, data.get(i).getCategory());
				request.setAttribute("price"+i, data.get(i).getPrice());
				request.setAttribute("rating"+i, data.get(i).getRating());
				request.setAttribute("id"+i, data.get(i).getId());
			}
		
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}
	
	
}