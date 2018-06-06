package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.WordCategoryDAOImplementation;
import DAO.WordDAOImplementation;
import model.Category;

@WebServlet("/addWord")
public class AddWordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		WordCategoryDAOImplementation wordDAO = new WordCategoryDAOImplementation();
		ArrayList<Category> categories = new ArrayList<>();
		try {
			categories = wordDAO.getWordCategories();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("categories", categories);
		RequestDispatcher forward = request.getRequestDispatcher("jsp/addWord.jsp");
		forward.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String word = request.getParameter("word");
		int categoryID = Integer.valueOf(request.getParameter("categoryID"));

		try {

			WordDAOImplementation wordDAO = new WordDAOImplementation();

			wordDAO.addWord(word, categoryID);

			String wordRegSuccess = "New word registered.";
			request.setAttribute("wordRegSuccess", wordRegSuccess);

			RequestDispatcher success = request.getRequestDispatcher("jsp/addWord.jsp");
			success.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
