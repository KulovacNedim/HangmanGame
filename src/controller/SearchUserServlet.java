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

@WebServlet("/search")
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImplementation userDAO = new UserDAOImplementation();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchString = request.getParameter("search");
		
		ArrayList<User> searchResult = null;
		
		try {
			searchResult = userDAO.searchForUsers(searchString);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		request.getSession().setAttribute("searchResult", searchResult);

		RequestDispatcher success = request.getRequestDispatcher("jsp/deleteUser.jsp");
		success.forward(request, response);
	}
}
