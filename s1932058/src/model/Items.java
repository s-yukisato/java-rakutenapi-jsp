package model;

import java.util.ArrayList;
import java.util.List;

public class Items {
	private List<BookData> items = new ArrayList<>();

	public Items() {};
	public Items(List<BookData> items) {
		super();
		this.items = items;
	}
	public List<BookData> getItems() {
		return items;
	}
	public void setItems(List<BookData> items) {
		this.items = items;
	}


}
