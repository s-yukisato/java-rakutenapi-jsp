package access;

import com.fasterxml.jackson.databind.JsonNode;

public class Test {

	public static void main(String[] args) throws Exception {
		Access ac = new Access();
		JsonNode result = ac.getResult("https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404?format=json&keyword=python&booksGenreId=000&elements=title%2Cauthor%2ClargeImageUrl&formatVersion=2&hits=10&applicationId=");
		System.out.print(result.get("Items").get(0).get("title"));
	}
}