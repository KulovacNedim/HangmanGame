package services;

import java.sql.SQLException;
import DAO.ImageDAOImplementation;
import DAO.WordDAOImplementation;
import model.Game;
import model.Word;

public class GameLogic {

	ImageDAOImplementation imageDAO = new ImageDAOImplementation();
	WordDAOImplementation wordDAO = new WordDAOImplementation();

	public void doLogic(Game game, String letter) throws SQLException {

		Word word = game.getWord();

		boolean letterExist = doesLetterExistInWord(word, letter);

		if (letterExist) {

			String newPlaceholder = game.getSolutionPlaceholder();
			String updatedPlaceholder = updatePlaceholder(newPlaceholder, game.getWord(), letter);
			game.setSolutionPlaceholder(updatedPlaceholder);

			game.setUsedLetters(game.getUsedLetters() + " " + letter);
			game.setCorrect(game.getCorrect() + correctLetters(game.getWord(), letter));

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
		String digestedWord = "";

		for (int i = 0; i < newPlaceholder.length(); i++) {

			if (word.getWord().charAt(i) == letter.charAt(0)) {

				digestedWord += word.getWord().charAt(i);

			} else if (word.getWord().charAt(i) == " ".charAt(0)) {
				digestedWord += " ";

			} else if (newPlaceholder.charAt(i) == '-') {
				digestedWord += "-";

			} else {
				digestedWord += newPlaceholder.charAt(i);
			}

		}

		return digestedWord;
	}

	public boolean doesLetterExistInWord(Word word, String letter) {

		for (int i = 0; i < word.getWord().length(); i++) {
			if (word.getWord().charAt(i) == letter.charAt(0)) {
				return true;
			}
		}
		return false;
	}

	private int correctLetters(Word word, String letter) {

		int counter = 0;

		for (int i = 0; i < word.getWord().length(); i++) {

			if (word.getWord().charAt(i) == letter.charAt(0)) {

				counter++;
			}
		}

		return counter;
	}

	public String getSolutionPlaceholder(Word word) {

		String solutionPlaceholder = "";

		for (int i = 0; i < word.getWord().length(); i++) {
			if (word.getWord().charAt(i) == " ".charAt(0)) {

				solutionPlaceholder += " ";
			} else {

				solutionPlaceholder += "-";
			}
		}

		return solutionPlaceholder;
	}

	public int getInitCorrects(Word word) {

		int counter = 0;

		for (int i = 0; i < word.getWord().length(); i++) {
			if (word.getWord().charAt(i) == " ".charAt(0)) {
				counter++;
			}
		}
		return counter;
	}

	public int numberOfDifferentLetters(Word word) {

		    return (int)word.getWord().chars()
		            .distinct()
		            .count();
	}

}
