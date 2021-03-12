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

public class Yelp {
	
	/*Client ID
	YwgQs4T763kGCw7DtgIAoA

	API Key
	0nmBFsYUgDTAGsjqtkKQpWdWTJ2xyukwGlF6_Fq_El_YvY5G
	DFmB449VJx-dSUCjMdeVUQgLtZtYtiWRm5tXB9beHOnQN4vqERQCJdDQV4A9pIn17A5BwnolTO9-XnYx
	*/
	public static void main(String[] args) {
		String apiKey = "0nmBFsYUgDTAGsjqtkKQpWdWTJ2xyukwGlF6_Fq_El_YvY5GDFmB449VJx-dSUCjMdeVUQgLtZtYtiWRm5tXB9beHOnQN4vqERQCJdDQV4A9pIn17A5BwnolTO9-XnYx";
		String url = "https://api.yelp.com/v3/businesses/search";
		//String param = "term=momota&location=Los Angeles City";
		//String param = "term=momota&latitude=34&longitude=-118";
		String param = null;
		String term ="term";
		String name="ramen";
		
		String location ="location";
		String city="Los Angeles City";
		
		String Latitude ="latitude";
		String Longitude="longitude";
		
		String latitude = "34";
		String longitude = "-118";
		
	
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
		
	/*public static class ParameterStringBuilder {
	    public static String getParamsString(Map<String, String> params) 
	      throws UnsupportedEncodingException{
	        StringBuilder result = new StringBuilder();
	 
	        for (Map.Entry<String, String> entry : params.entrySet()) {
	          result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
	          result.append("=");
	          result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
	          result.append("&");
	        }
	 
	        String resultString = result.toString();
	        return resultString.length() > 0
	          ? resultString.substring(0, resultString.length() - 1)
	          : resultString;
	    }
	}*/
	
}

		

