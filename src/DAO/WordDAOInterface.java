package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Word;

public interface WordDAOInterface {

	public ArrayList<Word> getWords() throws SQLException;
	
	public ArrayList<Word> getWords(int categoryID) throws SQLException;

	public void addWord(String word, int categoryID) throws SQLException;
	
	public Word getRandomWord() throws SQLException;
	
}
