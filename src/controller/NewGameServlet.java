package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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


@WebServlet("/newGame")
public class NewGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		WordDAOImplementation wordDAO = new WordDAOImplementation();
		WordCategoryDAOImplementation wordCategoryDAO = new WordCategoryDAOImplementation();
		ImageDAOImplementation imageDAO = new ImageDAOImplementation();
		
		User user = (User)req.getSession().getAttribute("user");

		//instancirati Game i setovati i proslijediti gameplayu
		
//		String category = (String)req.getSession().getAttribute("Search");
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		Word word = null;
		try {
			word = wordDAO.getRandomWord(categoryObj.getCategoryID());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("nisam uhvatio rijec");
			e.printStackTrace();
		}
		Game game = new Game();
		game.setUser(user);
		game.setScore(100);
		game.setWord(word);
		game.setCategory(categoryObj);
		game.setMisses(0);
		String solutionPlaceholder = "";
		for (int i = 0; i < game.getWord().getWord().length(); i++) {
			solutionPlaceholder = solutionPlaceholder + "-";
		}
		
		game.setSolutionPlaceholder(solutionPlaceholder);
		
		game.setUsedLetters("");
		game.setImagePath("images/1.png");
		
		req.getSession().setAttribute("game", game);
//		req.getSession().setAttribute("categoryString", categoryString);
		
		RequestDispatcher success = req.getRequestDispatcher("jsp/game.jsp");
		success.forward(req, resp);
	}
	}

	
}
