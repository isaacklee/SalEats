package SalEats;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchResultServlet")
public class searchResultServlet extends HttpServlet{
	
	public static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "/searchresult.jsp";
		String name = request.getParameter("name");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String button = request.getParameter("button");
		Boolean error = false;
		System.out.println("name = "+name+" lat =  "+latitude+" long =  "+longitude+" button  =  "+button);
		
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
			connectYelp(name, latitude, longitude, button);
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}
	public void connectYelp(String restname, String lati, String longi, String radiobutton ) {
		String apiKey = "0nmBFsYUgDTAGsjqtkKQpWdWTJ2xyukwGlF6_Fq_El_YvY5GDFmB449VJx-dSUCjMdeVUQgLtZtYtiWRm5tXB9beHOnQN4vqERQCJdDQV4A9pIn17A5BwnolTO9-XnYx";
		String url = "https://api.yelp.com/v3/businesses/search";
		//String param = "term=momota&location=Los Angeles City";
		//String param = "term=momota&latitude=34&longitude=-118";
		String param = null;
		String term ="term";
		String name=restname;
		
		String location ="location";
		String city="Los Angeles City";
		
		String Latitude ="latitude";
		String Longitude="longitude";
		
		String button = radiobutton;
		
		String latitude = lati;
		String longitude = longi;
		
	
		try {
			name= URLEncoder.encode(name,"UTF-8");
			//city= URLEncoder.encode(name,"UTF-8");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		URL url1;
		
		Map<String, String> parameters = new HashMap<>();
		//parameters.put("term", "Momota Ramen House");
		parameters.put(term, name);
		//parameters.put("location", "Los Angeles City");
		parameters.put(Latitude, latitude);
		parameters.put(Longitude, longitude);
		
		try {
			url1 = new URL(url+"?"+term+"="+name+"&"+Latitude+"="+latitude+"&"+Longitude+"="+longitude);
			HttpURLConnection con = (HttpURLConnection) url1.openConnection();
		
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer "+apiKey);
			

			con.setDoOutput(true);
			
			int status = con.getResponseCode();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer content = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				content.append(inputLine);
			}
			in.close();
			System.out.println(content);
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}