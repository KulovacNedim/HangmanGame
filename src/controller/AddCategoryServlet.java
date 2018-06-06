package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAOImplementation;

@WebServlet("/addCategory")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher forward = request.getRequestDispatcher("jsp/addCategory.jsp");
		forward.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String categoryname = request.getParameter("categoryname");

		try {

			CategoryDAOImplementation categoryDAO = new CategoryDAOImplementation();

			categoryDAO.insertCategory(categoryname);

			String categRegSuccess = "New category registered.";
			request.setAttribute("categRegSuccess", categRegSuccess);

			RequestDispatcher success = request.getRequestDispatcher("jsp/addCategory.jsp");
			success.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
