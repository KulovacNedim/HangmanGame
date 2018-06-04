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
import DAO.PointsDAOImplementation;
import DAO.WordCategoryDAOImplementation;
import DAO.WordDAOImplementation;
import model.Game;

@WebServlet("/game")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		WordDAOImplementation wordDAO = new WordDAOImplementation();
		WordCategoryDAOImplementation wordCategoryDAO = new WordCategoryDAOImplementation();
		GameLogic gameLogic = new GameLogic();
		PointsDAOImplementation pointsDAO = new PointsDAOImplementation();
		ImageDAOImplementation imageDAO = new ImageDAOImplementation();

		Game game = (Game) req.getSession().getAttribute("game");
		String letter = req.getParameter("letter");

		//
		if (letter.length() == 0) {
			String emptyInputErrorMessage = "Please enter letter or word first, and then submit.";
			req.setAttribute("emptyInputErrorMessage", emptyInputErrorMessage);

			RequestDispatcher failure = req.getRequestDispatcher("jsp/game.jsp");
			failure.forward(req, resp);
		} else {

			if (letter.length() > 1 && game.getWord().getWord().equals(letter)) {
				// pobjedio, 100p, pohrani
//				game.setScore(100);
				Game.setGeneralScore(Game.getGeneralScore() + game.getScore());

				game.setMisses(7);
				try {
					game.setImagePath(imageDAO.getImagePath(game.getMisses()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// preusmjeri
				req.getSession().setAttribute("game", game);

				RequestDispatcher success = req.getRequestDispatcher("jsp/won.jsp");
				success.forward(req, resp);
			}
			else if (letter.length() > 1 && !game.getWord().getWord().equals(letter)) {
				//izgubio
				//snimi general score
//				try {
//					pointsDAO.saveScore(game.getUser().getUserID(), Game.getGeneralScore());
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				Game.setGeneralScore(0);
				game.setMisses(6);
				try {
					game.setImagePath(imageDAO.getImagePath(game.getMisses()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//preusmjeri
				
				req.getSession().setAttribute("game", game);

				RequestDispatcher success = req.getRequestDispatcher("jsp/lostGame.jsp");
				success.forward(req, resp);
			}

			else if (game.getCorrect() == game.getWord().getWord().length() - 1) {
				// pobjeda
				// snimi rezultat - tj pohrani
				Game.setGeneralScore(Game.getGeneralScore() + game.getScore());

				game.setMisses(7);
				try {
					game.setImagePath(imageDAO.getImagePath(game.getMisses()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// preusmjeri
				req.getSession().setAttribute("game", game);

				RequestDispatcher success = req.getRequestDispatcher("jsp/won.jsp");
				success.forward(req, resp);
				

			} 
			else if (game.getMisses() == 5) {
				//izgubio
				//snimi general score
//				try {
//					pointsDAO.saveScore(game.getUser().getUserID(), Game.getGeneralScore());
//					Game.setGeneralScore(0);
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				
//				Game.setGeneralScore(0);
				game.setMisses(6);
				try {
					game.setImagePath(imageDAO.getImagePath(game.getMisses()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//preusmjeri
				
				req.getSession().setAttribute("game", game);

				RequestDispatcher success = req.getRequestDispatcher("jsp/lostGame.jsp");
				success.forward(req, resp);
				
			}
			else if (gameLogic.isLetterUsed(letter, game)) {
				String letterUsedErrorMessage = "You are alredy asked for letter " + letter.toUpperCase();
				req.setAttribute("letterUsedErrorMessage", letterUsedErrorMessage);

				RequestDispatcher failure = req.getRequestDispatcher("jsp/game.jsp");
				failure.forward(req, resp);
			} else {

				try {
					gameLogic.doLogic(game, letter);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				req.getSession().setAttribute("game", game);

				RequestDispatcher success = req.getRequestDispatcher("jsp/game.jsp");
				success.forward(req, resp);
			}
		}
	}
}
