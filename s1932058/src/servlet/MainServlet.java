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
import model.Items;
import model.Result;

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
		Access ac = new Access();
		Items items = new Items();
		List<Result> list = new ArrayList<>();
		JsonNode result = ac.getResult("https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404?format=json&keyword=python&booksGenreId=000&elements=title%2Cauthor%2ClargeImageUrl&formatVersion=2&hits=10&applicationId=");
		for(int i = 0; i<10; i++) {
			String title = result.get("Items").get(i).get("title").asText();
			String author = result.get("Items").get(i).get("author").asText();
			String imageUrl = result.get("Items").get(i).get("largeImageUrl").asText();
			Result re = new Result(title, author, imageUrl);
			System.out.println(re);
			list.add(re);
		}
		System.out.println(list);
		items.setItems(list);
		System.out.println(items);
		System.out.println(items.getItems().size());
		request.setAttribute("result", items);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
