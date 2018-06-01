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

import DAO.CategoryDAOImplementation;
import DAO.WordCategoryDAOImplementation;
import DAO.WordDAOImplementation;
import model.Category;

/**
 * Servlet implementation class AddWordServlet
 */
@WebServlet("/addWord")
public class AddWordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		RequestDispatcher forward = request.getRequestDispatcher("jsp/addWord.jsp");
		forward.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("word");
		int categoryID = Integer.valueOf(request.getParameter("categoryID"));


		try {
//			if (regValidation.isUserNameAvailable(username)) {

				
			WordDAOImplementation wordDAO = new WordDAOImplementation();
					
			wordDAO.addWord(word, categoryID);
					
			String wordRegSuccess = "New word registered.";
			request.setAttribute("wordRegSuccess", wordRegSuccess);

			RequestDispatcher success = request.getRequestDispatcher("jsp/addWord.jsp");
			success.forward(request, response);

			

//			} else {
//
//				String errorMessage = "User name you entered already exist, please choose another one!";
//				request.setAttribute("errorMessage", errorMessage);
//
//				request.setAttribute("password", password);
//
//				RequestDispatcher failure = request.getRequestDispatcher("jsp/addUser.jsp");
//				failure.forward(request, response);
//
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
