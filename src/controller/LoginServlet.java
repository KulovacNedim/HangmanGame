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
import javax.servlet.http.HttpSession;

import DAO.ImageDAOImplementation;
import DAO.UserDAOImplementation;
import model.Game;
import model.User;
import validation.HashValidation;
//import validation.LoginValidation;
import validation.LoginValidation;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		LoginValidation loginValidation = new LoginValidation();
		HashValidation hashValidation = new HashValidation();
		UserDAOImplementation userDAO = new UserDAOImplementation();
		ImageDAOImplementation imageDAO = new ImageDAOImplementation();
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try {
			if (loginValidation.validationLogin(username, hashValidation.getHash(password))) {
		
				HttpSession session = req.getSession();
				
				User user = userDAO.getUserByUserNameAndPass(username, hashValidation.getHash(password));
				
				//
				
				
				session.setAttribute("user", user);
				Game game = new Game();
				game.setMisses(6);
				game.setImagePath(imageDAO.getImagePath(game.getMisses()));
				System.out.println("test : " +game.getImagePath());
				session.setAttribute("game", game);
				
//				session.setAttribute("allContacts", allContacts);
//				session.setAttribute("searchCriteria", "firstName");
//				req.getSession().setAttribute("checked", "checked");
				
				RequestDispatcher success = req.getRequestDispatcher("jsp/welcome.jsp");
				success.forward(req, resp);

			} else {

				String loginErrorMessage = "Wrong username/password combination! Please try again.";
				req.setAttribute("loginErrorMessage", loginErrorMessage);

				req.setAttribute("username", username);

				RequestDispatcher failure = req.getRequestDispatcher("jsp/login.jsp");
				failure.forward(req, resp);;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("jsp/login.jsp").forward(req, resp);
	}
}
