package SalEats;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.catalina.valves.rewrite.Substitution.StaticElement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javafx.beans.binding.StringBinding;


public class YelpParse {
	YelpRestaurant yelpR;
	YelpRestaurant_List yelpRL= new YelpRestaurant_List();
	ArrayList<YelpRestaurant>data = new ArrayList<YelpRestaurant>();
	private String term;
	private String name;
	private String menu;
	private String latitude;
	private String longitude;
	private String Latitude ="latitude";
	private String Longitude="longitude";
	private String display_address;
	private String display_phone;
	private String image_url;
	private String yelpurl;
	private String price;
	private String rating;
	
	private String apiKey;
	String url;
	String button;

	StringBuffer content;
	
	
	public YelpParse(String name, String latitude, String longitude, String button) {
		this.name=name;
		this.latitude=latitude;
		this.longitude=longitude;
		this.button= button;
		apiKey = "0nmBFsYUgDTAGsjqtkKQpWdWTJ2xyukwGlF6_Fq_El_YvY5GDFmB449VJx-dSUCjMdeVUQgLtZtYtiWRm5tXB9beHOnQN4vqERQCJdDQV4A9pIn17A5BwnolTO9-XnYx";
		url = "https://api.yelp.com/v3/businesses/search";
		//String param = "term=momota&location=Los Angeles City";
		//String param = "term=momota&latitude=34&longitude=-118";
		String param = null;
		term ="term";
		try {
			this.name = URLEncoder.encode(name.stripLeading(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Latitude ="latitude";
		Longitude="longitude";
		
	}
	public ArrayList<YelpRestaurant> parse() {
		URL url1;
		
		Map<String, String> parameters = new HashMap<>();
		//parameters.put("term", "Momota Ramen House");
		parameters.put(term, name);
		//parameters.put("location", "Los Angeles City");
		parameters.put(Latitude, latitude);
		parameters.put(Longitude, longitude);
		
		try {
			url1 = new URL(url+"?"+"sort_by="+button+"&"+term+"="+name+"&"+Latitude+"="+latitude+"&"+Longitude+"="+longitude);
			HttpURLConnection con = (HttpURLConnection) url1.openConnection();
		
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer "+apiKey);
			

			con.setDoOutput(true);
			
			//int status = con.getResponseCode();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			content = new StringBuffer();
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
		
		
		JSONParser parser = new JSONParser();
		Object object = null;
		JSONObject jsonObject=null;
		
		try {
			object = (JSONObject) parser.parse(content.toString());
			jsonObject = (JSONObject) object;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray jsonArray = (JSONArray) jsonObject.get("businesses");
		
		for(int i=0; i<jsonArray.size();i++) {	
			object = jsonArray.get(i);
			
			jsonObject = (JSONObject) object;
			
			String id = (String)jsonObject.get("id");
			String name = (String) jsonObject.get("name");
			String imageurl=(String) jsonObject.get("image_url");
			
			String url3 = (String) jsonObject.get("url");
			String [] url2  = url3.split("\\?",2);
			String url = url2[0];
			
			Double rating = (Double) jsonObject.get("rating");
			String ratings = String.valueOf(rating);
			Long reviewcount = (Long)jsonObject.get("review_count");
			Double distances = (Double) jsonObject.get("distance");
			String distance = String.valueOf(distances);
			String price = (String) jsonObject.get("price");
			String number = (String) jsonObject.get("display_phone");
			
			String category="";
			JSONArray categories = (JSONArray)jsonObject.get("categories");
			for(int j=0; j<categories.size();j++) {
				object = categories.get(j);
				JSONObject jsonObject1 = (JSONObject)object;
				
				category += (String) jsonObject1.get("title")+" ";
			}
			
			object = jsonObject.get("location");
			jsonObject = (JSONObject) object;
			String address1="";
			String address2="";
			String address3="";
			
			
			
			if((jsonObject.get("address1")!=null)) {
				address1 = (String) jsonObject.get("address1");
			}
			if((jsonObject.get("address2")!=null)) {
				address2 = (String) jsonObject.get("address2");
			}
			if( jsonObject.get("address3")!=null) {
				address3 = (String) jsonObject.get("address3");
			}
			String city = (String) jsonObject.get("city");
			String zipcode = (String) jsonObject.get("zip_code");
			String state = (String) jsonObject.get("state");
			//String country = (String) jsonObject.get("country");
			String address = address1+" "+address2+" "+address3+" "+city+", "+state+" "+zipcode;
			
			
			if(!name.equals(null)) {
				yelpR=new YelpRestaurant();
				yelpR.setName(name);
				yelpR.setImage(imageurl);	
				yelpR.setUrl(url);
				yelpR.setRating(ratings);
				yelpR.setPrice(price);
				yelpR.setAddress(address);
				yelpR.setReviewCount(reviewcount);
				yelpR.setDistance(distance);
				yelpR.setNumber(number);
				yelpR.setCategory(category);
				yelpR.setId(id);
				//yelpRL.add(yelpR);
				data.add(yelpR);
			}	
		}
		
		/*if(button.equals("match")) {
			System.out.println("In yelpParse button = match");
			
			for(int i=data.size()-1;i>9;i--) {
				 data.remove(i);
			 }
		}
		else if(button.equals("rating")) {
			System.out.println("In yelpParse button = rating");
			Collections.sort(data, YelpRestaurant.ratingComparator);
			for(int i=data.size()-1;i>9;i--) {
				 data.remove(i);
			 }
		}
		else if(button.equals("review")) {
			System.out.println("In yelpParse button = review");
			Collections.sort(data, YelpRestaurant.reviewComparator);
			for(int i=data.size()-1;i>9;i--) {
				 data.remove(i);
			 }
		}
		else if(button.equals("distance")) {
			System.out.println("In yelpParse button = distance");
			Collections.sort(data, YelpRestaurant.distanceComparator);
			for(int i=data.size()-1;i>9;i--) {
				 data.remove(i);
			 }
		}*/
			
		return data;
	}
	

}
	

