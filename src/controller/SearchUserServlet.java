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

/**
 * Servlet implementation class SearchUserServlet
 */
@WebServlet("/search")
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAOImplementation userDAO = new UserDAOImplementation();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchString = request.getParameter("search");
		
		ArrayList<User> searchResult = null;
		try {
			searchResult = userDAO.searchForUsers(searchString);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.getSession().setAttribute("searchResult", searchResult);

		RequestDispatcher success = request.getRequestDispatcher("jsp/deleteUser.jsp");
		success.forward(request, response);
	}

}
