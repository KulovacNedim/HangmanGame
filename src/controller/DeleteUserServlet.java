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

import DAO.UserDAOImplementation;
import model.User;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAOImplementation userDAO = new UserDAOImplementation();

		ArrayList<User> searchResult = null;

		try {
			searchResult = userDAO.searchForUsers("");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("searchResult", searchResult);
		RequestDispatcher forward = request.getRequestDispatcher("jsp/deleteUser.jsp");
		forward.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userID = Integer.valueOf(request.getParameter("userID"));

		UserDAOImplementation userDAO = new UserDAOImplementation();

		try {
			userDAO.deleteUser(userID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String userDelSuccess = "User deleted.";
		request.setAttribute("userDelSuccess", userDelSuccess);

		RequestDispatcher success = request.getRequestDispatcher("jsp/deleteUser.jsp");
		success.forward(request, response);
	}
}
