package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;

import access.Access;
import dao.ManageDAO;
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
		Access api = new Access();
		Items items = new Items();
		List<BookData> list = new ArrayList<>();
		JsonNode result;
		/** post searchの場合の処理 */
		if(request.getParameter("searchKeyword") != null && !request.getParameter("searchKeyword").equals("")) {
			String search = request.getParameter("searchKeyword");
			// パラメータ
			String keyword = "keyword=" + search;
			String element = "elements=title%2Cauthor%2CsalesDate%2CpublisherName%2CitemPrice%2CreviewAverage%2ClargeImageUrl";
			result = api.getResult(keyword, element);
			request.setAttribute("mode", "search");
		} else {
			// パラメータ
			String keyword = "keyword=%E6%9C%AC";
			String sort = "&sort=sales";
			String element = "elements=title%2Cauthor%2CsalesDate%2CpublisherName%2CitemPrice%2CreviewAverage%2ClargeImageUrl";
			result = api.getResult(keyword, sort, element);
			request.setAttribute("mode", "ranking");
		}

		for(int i = 0; i<30; i++) {
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
		/** 文字化けを避ける */
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		/** post内容によって処理を分ける */
		if(request.getParameter("Action").equals("search")) {
			doGet(request, response);
		}else if (request.getParameter("Action").equals("register")) {
			/** データベースにフォーム内容を登録する */
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			int price = Integer.parseInt(request.getParameter("price"));
			String comment = request.getParameter("comment");
			String state = request.getParameter("state");
			int evaluation = Integer.parseInt(request.getParameter("evaluation"));
			String purchaseStore = request.getParameter("purchaseStore");
			String purchaseDate = request.getParameter("purchaseDate");
			String imageUrl = request.getParameter("imageUrl");
			insert(title, author, publisher, price, imageUrl, comment, evaluation, state, purchaseStore, purchaseDate);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registerResult.jsp");
			dispatcher.forward(request, response);
		}
	}


	void insert(String title, String author, String publisher, int price, String imageUrl, String comment,
			int evaluation, String state, String purchaseStore, String purchaseDate) {
		ManageDAO md = new ManageDAO();
		String id = UUID.randomUUID().toString();
		md.insert(id, title, author, publisher, price, imageUrl, comment, evaluation, state, purchaseStore, purchaseDate);
	}

}
