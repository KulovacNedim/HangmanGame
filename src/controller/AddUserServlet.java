package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAOImplementation;
import validation.HashValidation;
import validation.RegisterValidation;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher forward = request.getRequestDispatcher("jsp/addUser.jsp");
		forward.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		RegisterValidation regValidation = new RegisterValidation();
		HashValidation hashValidation = new HashValidation();

		try {
			if (regValidation.isUserNameAvailable(username)) {

				if (regValidation.isValidPassword(password)) {

					UserDAOImplementation userDAO = new UserDAOImplementation();

					userDAO.addUser(username, hashValidation.getHash(password));

					String registerSuccess = "New user registered.";
					request.setAttribute("registerSuccess", registerSuccess);

					RequestDispatcher success = request.getRequestDispatcher("jsp/adminFunctionsUtil.jsp");
					success.forward(request, response);

				} else {

					String passErrorMessage = "Password must be at least 8 characters long and cannot begin or end wirt black (space) character.";
					request.setAttribute("passErrorMessage", passErrorMessage);

					request.setAttribute("username", username);

					RequestDispatcher failure = request.getRequestDispatcher("jsp/addUser.jsp");
					failure.forward(request, response);
				}

			} else {

				String errorMessage = "User name you entered already exist, please choose another one!";
				request.setAttribute("errorMessage", errorMessage);

				request.setAttribute("password", password);

				RequestDispatcher failure = request.getRequestDispatcher("jsp/addUser.jsp");
				failure.forward(request, response);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
