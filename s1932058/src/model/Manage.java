package model;

public class Manage {
	/**  書籍識別番号 */
	private String id;
	/**  タイトル */
	private String title;
	/**  著者 */
	private String author;
	/**  出版社 */
	private String publisher;
	/**  値段 */
	private int price;
	/**  画像のリンク */
	private String imageUrl;
	/**  コメント */
	private String comment;
	/**  評価 */
	private int evaluation;
	/**  状態 */
	private String state;
	/**  購入店舗名 */
	private String purchaseStore;
	/**  購入日 */
	private String purchaseDate;
	/**
	 * 登録した本の一覧表示用
	 * @param id
	 * @param title
	 * @param imageUrl
	 */
	public Manage(String id, String title, String imageUrl) {
		super();
		this.id = id;
		this.title = title;
		this.imageUrl = imageUrl;
	}
	/**
	 * 初回登録用
	 * @param id
	 * @param title
	 * @param author
	 * @param publisher
	 * @param price
	 * @param imageUrl
	 * @param comment
	 * @param evaluation
	 * @param state
	 * @param purchaseStore
	 * @param purchaseDate
	 */
	public Manage(String id, String title, String author, String publisher, int price, String imageUrl, String comment,
			int evaluation, String state, String purchaseStore, String purchaseDate) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.imageUrl = imageUrl;
		this.comment = comment;
		this.evaluation = evaluation;
		this.state = state;
		this.purchaseStore = purchaseStore;
		this.purchaseDate = purchaseDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPurchaseStore() {
		return purchaseStore;
	}
	public void setPurchaseStore(String purchaseStore) {
		this.purchaseStore = purchaseStore;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

}
