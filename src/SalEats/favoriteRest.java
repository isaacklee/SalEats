package SalEats;

import java.util.Comparator;

public class favoriteRest {
	private String name;
	private String imageurl;
	private String url;
	private String address;
	private int restaurantID;	
	private String rating;
	private String price;
	
	
	public int getRestaurantID() {
		return restaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCuisine() {
		return cuisine;
	}
	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	private String number;
	private String cuisine;
	
	
	
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRID() {
		return restaurantID;
	}
	public void setRID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	
	public static Comparator<favoriteRest> ratingComparator = new Comparator<favoriteRest>() {

		@Override
		public int compare(favoriteRest o1, favoriteRest o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getRating();
			String restaurant2 = o2.getRating();
			
			return restaurant2.compareTo(restaurant1);
		}
	};
	public static Comparator<favoriteRest> reverseRatingComparator = new Comparator<favoriteRest>() {

		@Override
		public int compare(favoriteRest o1, favoriteRest o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getRating();
			String restaurant2 = o2.getRating();
			
			return restaurant1.compareTo(restaurant2);
		}
	};

	public static Comparator<favoriteRest> alphaComparator = new Comparator<favoriteRest>() {

		@Override
		public int compare(favoriteRest o1, favoriteRest o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getName();
			String restaurant2 = o2.getName();
			
			return restaurant1.compareTo(restaurant2);
		}
	};
	public static Comparator<favoriteRest> reverseAlphaComparator = new Comparator<favoriteRest>() {

		@Override
		public int compare(favoriteRest o1, favoriteRest o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getName();
			String restaurant2 = o2.getName();
			
			return restaurant2.compareTo(restaurant1);
		}
	};
	
	
	
	
	
}
