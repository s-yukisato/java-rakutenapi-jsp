package model;

public class Result {
	private String title;
	private String author;
	private String imageUrl;

	public Result() {};
	public Result(String title, String author, String imageUrl) {
		super();
		this.title = title;
		this.author = author;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
