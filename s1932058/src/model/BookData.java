package model;

public class BookData {
	private String title;
	private String author;
	private String publisherName;
	private String itemPrice;
	private String salesDate;
	private String reviewAverage;
	private String imageUrl;

	public BookData() {};

	public BookData(String title, String author, String imageUrl) {
		super();
		this.title = title;
		this.author = author;
		this.imageUrl = imageUrl;
	}

	public BookData(String title, String author, String publisherName, String itemPrice, String salesDate,
			String reviewAverage, String imageUrl) {
		super();
		this.title = title;
		this.author = author;
		this.publisherName = publisherName;
		this.itemPrice = itemPrice;
		this.salesDate = salesDate;
		this.reviewAverage = reviewAverage;
		this.imageUrl = imageUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	public String getReviewAverage() {
		return reviewAverage;
	}

	public void setReviewAverage(String reviewAverage) {
		this.reviewAverage = reviewAverage;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
