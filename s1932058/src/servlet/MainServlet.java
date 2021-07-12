package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import access.Access;
import model.BookData;
import model.Items;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404"
				+ "?format=json&keyword=%E6%9C%AC&booksGenreId=000&sort=sales&hits=30"
				+ "&formatVersion=2&elements=title%2Cauthor%2CsalesDate%2CpublisherName%2CitemPrice%2CreviewAverage%2ClargeImageUrl"
				+ "&applicationId=1062302241302135134";
		Access api = new Access();
		Items items = new Items();
		List<BookData> list = new ArrayList<>();
		JsonNode result = api.getResult(url);
		for(int i = 0; i<10; i++) {
			String title = result.get("Items").get(i).get("title").asText();
			String author = result.get("Items").get(i).get("author").asText();
			String publisherName = result.get("Items").get(i).get("publisherName").asText();
			String itemPrice = result.get("Items").get(i).get("itemPrice").asText();
			String salesDate = result.get("Items").get(i).get("salesDate").asText();
			String reviewAverage = result.get("Items").get(i).get("reviewAverage").asText();
			String imageUrl = result.get("Items").get(i).get("largeImageUrl").asText();
			BookData re = new BookData(title, author, publisherName, itemPrice, salesDate, reviewAverage, imageUrl);
			list.add(re);
		}
		items.setItems(list);
		request.setAttribute("result", items);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registerResult.jsp");
		dispatcher.forward(request, response);
	}

}
