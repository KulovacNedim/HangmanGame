package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import model.Word;

public class WordDAOImplementation implements WordDAOInterface {

	Connection connection = DBConnection.getConnectionToDatabase();

	@Override
	public ArrayList<Word> getWords() throws SQLException {

		ArrayList<Word> words = new ArrayList<>();

		String query = "SELECT * FROM words";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				Word word = new Word(rs.getString("Word"), rs.getInt("CategoryID"));
				words.add(word);
			}
		}

		return words;
	}

	@Override
	public ArrayList<Word> getWords(int categoryID) throws SQLException {

		ArrayList<Word> words = new ArrayList<>();

		String query = "SELECT * FROM words WHERE CategoryID = " + categoryID;

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				Word word = new Word(rs.getString("Word"), rs.getInt("CategoryID"));
				words.add(word);
			}
		}

		return words;
	}

	@Override
	public void addWord(String word, int categoryID) throws SQLException {

		String query = "INSERT INTO words(Word, CategoryID) VALUES (?, ?)";

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.setString(1, word.toUpperCase());
			statement.setInt(2, categoryID);

			statement.executeUpdate();
		}

	}

	@Override
	public Word getRandomWord() throws SQLException {

		ArrayList<Word> words = getWords();

		Random rand = new Random();
		Word word = null;
		try {
			int random = rand.nextInt(words.size());
			word = words.get(random);
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			System.out.println("jah IllegalArgumentException");
		}

		return word;
	}

	public Word getRandomWord(int categoryID) throws SQLException {

		ArrayList<Word> words = getWords(categoryID);

		Random rand = new Random();
		Word word = null;
		try {
			int random = rand.nextInt(words.size());
			word = words.get(random);
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			System.out.println("jah IllegalArgumentException");
		}

		return word;
	}

}
