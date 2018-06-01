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
import DAO.UserDAOImplementation;
import validation.HashValidation;
import validation.RegisterValidation;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/addCategory")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher forward = request.getRequestDispatcher("jsp/addCategory.jsp");
		forward.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String categoryname = request.getParameter("categoryname");


		try {
//			if (regValidation.isUserNameAvailable(username)) {

				
			CategoryDAOImplementation categoryDAO = new CategoryDAOImplementation();
					
			categoryDAO.insertCategory(categoryname);
					
			String categRegSuccess = "New category registered.";
			request.setAttribute("categRegSuccess", categRegSuccess);

			RequestDispatcher success = request.getRequestDispatcher("jsp/addCategory.jsp");
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
