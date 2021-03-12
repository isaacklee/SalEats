package SalEats;

import java.util.ArrayList;

public class YelpRestaurant_List {
	private ArrayList <YelpRestaurant> data;

	public void add(YelpRestaurant r) {
		data.add(r);
	}
	public ArrayList<YelpRestaurant> getData() {
		return data;
	}

	public void setData(ArrayList<YelpRestaurant> data) {
		this.data = data;
	}
	public YelpRestaurant search(String name) {
		for(int i = 0; i<data.size();++i) {
			if(data.get(i).getName().equalsIgnoreCase(name)) {
				return data.get(i);
			}
		}
		return null;
	}
}
