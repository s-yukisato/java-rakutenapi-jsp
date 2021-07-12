package model;

import java.util.ArrayList;
import java.util.List;

public class Items {
	private List<Result> items = new ArrayList<>();

	public Items() {};
	public Items(List<Result> items) {
		super();
		this.items = items;
	}
	public List<Result> getItems() {
		return items;
	}
	public void setItems(List<Result> items) {
		this.items = items;
	}


}
