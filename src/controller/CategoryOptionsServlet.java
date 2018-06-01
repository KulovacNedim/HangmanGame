package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.WordCategoryDAOImplementation;
import model.User;


@WebServlet("/categoryOptionsServlet")
public class CategoryOptionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		WordDAOImplementation wordDAO = new WordDAOImplementation();
		WordCategoryDAOImplementation categoryDAO = new WordCategoryDAOImplementation();
		
		User user = (User)req.getSession().getAttribute("user");

//		categoryDAO.getWordCategories();
		
		try {
			req.getSession().setAttribute("categories", categoryDAO.getWordCategories());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Nema kategorija");
		}
		//instancirati Game i setovati i proslijediti gameplayu
		
//		Word word = null;
//		try {
//			word = wordDAO.getRandomWord();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			System.out.println("nisam uhvatio rijec");
//			e.printStackTrace();
//		}
//		Game game = new Game();
//		game.setUser(user);
//		game.setScore(100);
////		game.setWord(word);
//		game.setMisses(0);
//		String solutionPlaceholder = "";
//		for (int i = 0; i < game.getWord().getWord().length(); i++) {
//			solutionPlaceholder = solutionPlaceholder + "- ";
//		}
		
//		game.setSolutionPlaceholder(solutionPlaceholder);
//		
//		game.setUsedLetters("");
//		
//		req.getSession().setAttribute("game", game);
		
		RequestDispatcher success = req.getRequestDispatcher("jsp/categoryOptions.jsp");
		success.forward(req, resp);
	}

}
