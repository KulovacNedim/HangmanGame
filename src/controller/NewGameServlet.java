package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ImageDAOImplementation;
import DAO.WordCategoryDAOImplementation;
import DAO.WordDAOImplementation;
import model.Category;
import model.Game;
import model.User;
import model.Word;
import services.GameLogic;

public class NewGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		WordDAOImplementation wordDAO = new WordDAOImplementation();
		WordCategoryDAOImplementation wordCategoryDAO = new WordCategoryDAOImplementation();
		ImageDAOImplementation imageDAO = new ImageDAOImplementation();
		GameLogic gameLogic = new GameLogic();

		User user = (User) req.getSession().getAttribute("user");

		String categoryString = req.getParameter("categoryString");

		if (categoryString == null) {
			String categoryErrorMessage = "Please check one of categories first anda then click PLAY button.";
			req.setAttribute("categoryErrorMessage", categoryErrorMessage);

			RequestDispatcher failure = req.getRequestDispatcher("jsp/categoryOptions.jsp");
			failure.forward(req, resp);

		} else {

			Category categoryObj = new Category();

			try {
				categoryObj = wordCategoryDAO.getCategoryByName(categoryString);

			} catch (SQLException e) {
				e.printStackTrace();
			}

			Word word = null;

			try {
				word = wordDAO.getRandomWord(categoryObj.getCategoryID());
			} catch (SQLException e) {
				e.printStackTrace();
			}

			Game game = new Game();
			game.setUser(user);
			game.setScore(100);
			game.setWord(word);
			game.setCategory(categoryObj);
			game.setCorrect(gameLogic.getInitCorrects(word));
			game.setMisses(0);
			game.setSolutionPlaceholder(gameLogic.getSolutionPlaceholder(game.getWord()));
			game.setUsedLetters("");
			try {
				game.setImagePath(imageDAO.getImagePath(game.getMisses()));
			} catch (SQLException e) {
				e.printStackTrace();
			}

			req.getSession().setAttribute("game", game);

			RequestDispatcher success = req.getRequestDispatcher("jsp/game.jsp");
			success.forward(req, resp);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
