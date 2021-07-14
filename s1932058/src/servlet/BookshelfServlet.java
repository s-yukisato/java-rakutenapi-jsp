package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ManageDAO;
import model.Manage;

/**
 * Servlet implementation class BookshelfServlet
 */
@WebServlet("/BookshelfServlet")
public class BookshelfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookshelfServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		selectAll(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/bookshelf.jsp");
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
		if(request.getParameter("Action").equals("update")) {
			/** データベースにフォーム内容を登録する */
			String id = request.getParameter("id");
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
			delete(id);
			insert(id, title, author, publisher, price, imageUrl, comment, evaluation, state, purchaseStore, purchaseDate);
		}else if (request.getParameter("Action").equals("delete")) {
			String id = request.getParameter("id");
			delete(id);
		}
		doGet(request, response);
	}

	/** DAOを呼び出す */
	void selectAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ManageDAO md = new ManageDAO();
		List<Manage> list = md.findAll();
		request.setAttribute("list", list);
	}

	void insert(String id, String title, String author, String publisher, int price, String imageUrl, String comment,
			int evaluation, String state, String purchaseStore, String purchaseDate) {
		ManageDAO md = new ManageDAO();
		md.insert(id, title, author, publisher, price, imageUrl, comment, evaluation, state, purchaseStore, purchaseDate);
	}

	void delete(String id) throws ServletException {
		ManageDAO md = new ManageDAO();
		md.delete(id);
	}

}
