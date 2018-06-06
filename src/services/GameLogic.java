package services;

import java.sql.SQLException;

import DAO.ImageDAOImplementation;
import model.Game;
import model.Word;

public class GameLogic {

	ImageDAOImplementation imageDAO = new ImageDAOImplementation();

	public void doLogic(Game game, String letter) throws SQLException {

		Word word = game.getWord();

		boolean letterExist = doesLetterExistInWord(word, letter);

		if (letterExist) {

			String newPlaceholder = game.getSolutionPlaceholder();
			String nova = updatePlaceholder(newPlaceholder, game.getWord(), letter);
			game.setSolutionPlaceholder(nova);

			game.setUsedLetters(game.getUsedLetters() + " " + letter);
			game.setCorrect(game.getCorrect() + correctLetters(newPlaceholder, game.getWord(), letter));

			System.out.println(game.toString());

		} else {

			game.setMisses(game.getMisses() + 1);
			game.setScore(game.getScore() + substractPoints(game.getMisses()));
			game.setImagePath(imageDAO.getImagePath(game.getMisses()));
			game.setUsedLetters(game.getUsedLetters() + " " + letter);
		}
	}

	public boolean isLetterUsed(String letter, Game game) {

		String usedLetters = game.getUsedLetters();

		for (int i = 0; i < usedLetters.length(); i++) {
			if (usedLetters.charAt(i) == letter.charAt(0)) {
				return true;
			}
		}
		return false;
	}

	private int substractPoints(int misses) {
		int points = 0;

		switch (misses) {
		case 1:
			points = -20;
			break;
		case 2:
			points = -20;
			break;
		case 3:
			points = -20;
			break;
		case 4:
			points = -10;
			break;
		case 5:
			points = -10;
			break;
		case 6:
			points = -10;
			break;
		case 7:
			points = -10;
			break;
		}
		return points;
	}

	private String updatePlaceholder(String newPlaceholder, Word word, String letter) {
		String digestWord = "";

		for (int i = 0; i < newPlaceholder.length(); i++) {

			if (word.getWord().charAt(i) == letter.charAt(0)) {

				digestWord += word.getWord().charAt(i);

			} else {
				if (newPlaceholder.charAt(i) == '-') {
					digestWord += "-";
				} else {
					digestWord += newPlaceholder.charAt(i);
				}
			}
		}

		return digestWord;
	}

	public boolean doesLetterExistInWord(Word word, String letter) {

		for (int i = 0; i < word.getWord().length(); i++) {
			if (word.getWord().charAt(i) == letter.charAt(0)) {
				return true;
			}
		}
		return false;
	}

	private int correctLetters(String newPlaceholder, Word word, String letter) {

		int counter = 0;

		for (int i = 0; i < newPlaceholder.length(); i++) {

			if (word.getWord().charAt(i) == letter.charAt(0)) {

				counter++;
			}
		}

		return counter;
	}

	public String getSolutionPlaceholder(Word word) {

		String solutionPlaceholder = "";

		for (int i = 0; i < word.getWord().length(); i++) {
			solutionPlaceholder = solutionPlaceholder + "-";
		}

		return solutionPlaceholder;
	}

}
