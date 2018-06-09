package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Category;

public class WordCategoryDAOImplementation implements WordCategoryDAOInterface {

	Connection connection = DBConnection.getConnectionToDatabase();
	WordDAOImplementation wordDAO = new WordDAOImplementation();

	@Override
	public ArrayList<Category> getWordCategories() throws SQLException {

		ArrayList<Category> categories = new ArrayList<>();

		String query = "SELECT * FROM wordcategory";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				if (wordDAO.getWords(rs.getInt("CategoryID")).size() != 0) {
					Category category = new Category(rs.getInt("CategoryID"), rs.getString("Word"));
					categories.add(category);
				}
			}

		}

		return categories;
	}
	
	@Override
	public ArrayList<Category> getAllWordCategories() throws SQLException {

		ArrayList<Category> categories = new ArrayList<>();

		String query = "SELECT * FROM wordcategory";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
					Category category = new Category(rs.getInt("CategoryID"), rs.getString("Word"));
					categories.add(category);
			}

		}

		return categories;
	}

	@Override
	public Category getCategoryByName(String categoryString) throws SQLException {

		Category category = new Category();

		String query = "SELECT * FROM wordcategory WHERE Word = '" + categoryString + "'";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				category = new Category(rs.getInt("CategoryID"), rs.getString("Word"));
			}

		}
		return category;
	}
}
