package SalEats;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javafx.beans.binding.StringBinding;


public class Database {
	static ArrayList<favoriteRest> arr = new ArrayList<favoriteRest>();
	
	
	public static Connection connect() {
		Connection connection = null;

		try {								
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root&password=iklee&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC");

			
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		
		return connection;
	}	
	
	public static void addUser(String username, String email, String password) {
		
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void addRestaurant(String name, String imageurl, String url, String address, String number, String cuisine, String price, String rating, String rid, int uid) {
		
		try {
			arr.clear();
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("INSERT INTO restaurants (name, imageurl, url, address, number, cuisine, price, rating, rid, userID) VALUES (?, ?,?,?, ?, ?, ?, ?,?,?)");
			ps.setString(1, name);
			ps.setString(2, imageurl);
			ps.setString(3, url);
			ps.setString(4, address);
			ps.setString(5, number);
			ps.setString(6, cuisine);
			ps.setString(7, price);
			ps.setString(8, rating);
			ps.setString(9, rid);
			ps.setInt(10, uid);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void removeRestaurant(String rid, int uid) {
		
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("DELETE FROM restaurants WHERE rid=? AND userID=?");
			ps.setString(1, rid);
			ps.setInt(2, uid);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static int getUID(String username) {
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int UID = rs.getInt("userID");
				ps.close();
				rs.close();
				return UID;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public static int getRID(String name) {
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM restaurants WHERE name=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int RID = rs.getInt("restaurantID");
				ps.close();
				rs.close();
				return RID;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static Boolean existingUser(String username) {
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM users WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static Boolean existingRestaurant(String name) {
		try {
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM restaurants WHERE name=?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static ArrayList<favoriteRest> getElement(int uid) {
		
		
		try {
			
			Connection connection = Database.connect();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM restaurants WHERE userID=?");
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			int i=0;
			while(rs.next()) {
				favoriteRest fRest = new favoriteRest();
				String name = rs.getString("name");
				String imageurl = rs.getString("imageurl");
				String url = rs.getString("url");
				String address = rs.getString("address");
				int restaurantID = rs.getInt("restaurantID");
				
				String rating = rs.getString("rating");
				String price = rs.getString("price");
				String number = rs.getString("number");
				String cuisine = rs.getString("cuisine");
				
				fRest.setCuisine(cuisine);
				fRest.setRating(rating);
				fRest.setRestaurantID(restaurantID);
				fRest.setName(name);
				fRest.setImageurl(imageurl);
				fRest.setUrl(url);
				fRest.setAddress(address);
				fRest.setPrice(price);
				fRest.setNumber(number);
				
				arr.add(fRest);
				System.out.println(arr.get(i).getName()+"   "+i);
				//return RID;
				i++;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	/*public static ArrayList<favoriteRest> sortAlpha(ArrayList<favoriteRest> arr){
		return arr;
	}*/
	
}
