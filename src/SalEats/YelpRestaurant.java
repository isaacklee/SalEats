package SalEats;
import java.io.Serializable;
import java.util.Comparator;

import javafx.beans.binding.StringBinding;


public class YelpRestaurant implements Serializable{
	
	private String name;
	private String image;
	private String url;
	private String category;
	private String rating;
	private String price;
	private String address;
	private Long reviewcount;
	private String distance;
	private String number;
	private String id;
	private String restaurantid;
	
	public String getRID() {
		return restaurantid;
	}
	public void setRID(String restaurantid) {
		this.restaurantid = restaurantid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number=number;
	}
	public Long getReviewCount() {
		return reviewcount;
	}
	public void setReviewCount(Long reviewcount) {
		this.reviewcount = reviewcount;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price=price;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating=rating;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image=image;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url=url;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category=category;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public static Comparator<YelpRestaurant> ratingComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getRating();
			String restaurant2 = o2.getRating();
			
			return restaurant2.compareTo(restaurant1);
		}
	};
	public static Comparator<YelpRestaurant> reverseRatingComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getRating();
			String restaurant2 = o2.getRating();
			
			return restaurant1.compareTo(restaurant2);
		}
	};
	public static Comparator<YelpRestaurant> distanceComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getDistance();
			String restaurant2 = o2.getDistance();
			return restaurant1.compareTo(restaurant2);
		}
	};
	public static Comparator<YelpRestaurant> reviewComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			Long restaurant1 = o1.getReviewCount();
			Long restaurant2 = o2.getReviewCount();
			
			return restaurant2.compareTo(restaurant1);
		}
	};
	public static Comparator<YelpRestaurant> alphaComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getName();
			String restaurant2 = o2.getName();
			
			return restaurant1.compareTo(restaurant2);
		}
	};
	public static Comparator<YelpRestaurant> reverseAlphaComparator = new Comparator<YelpRestaurant>() {

		@Override
		public int compare(YelpRestaurant o1, YelpRestaurant o2) {
			// TODO Auto-generated method stub
			String restaurant1 = o1.getName();
			String restaurant2 = o2.getName();
			
			return restaurant2.compareTo(restaurant1);
		}
	};
	
	
}
