package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.User;
import validation.HashValidation;

public class UserDAOImplementation implements UserDAOInterface {

	Connection connection = DBConnection.getConnectionToDatabase();
	HashValidation hashValidation = new HashValidation();

	@Override
	public ArrayList<User> getUsers() throws SQLException {

		ArrayList<User> users = new ArrayList<>();

		String query = "SELECT * FROM users";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				User user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
						rs.getBoolean("Admin"));
				users.add(user);
			}
		}

		return users;
	}
	
	@Override
	public ArrayList<User> searchForUsers(String searchString) throws SQLException {

		ArrayList<User> users = new ArrayList<>();

		String query = "SELECT * FROM users WHERE UserName LIKE '%" + searchString + "%'";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {
				User user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
						rs.getBoolean("Admin"));
				users.add(user);
			}
		}

		return users;
	}

	@Override
	public User getUser(int userID) throws SQLException {

		User user = null;

		String query = "SELECT * FROM users WHERE UserID = ?";

		ResultSet rs = null;

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.setInt(1, userID);

			rs = statement.executeQuery();

			if (rs.next()) {

				user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
						rs.getBoolean("Admin"));

				rs.close();
			}
		}

		return user;
	}

	@Override
	public User getUserByUserNameAndPass(String userName, String password) throws SQLException {

		User user = null;

		String query = "SELECT * FROM users WHERE UserName = '" + userName + "' AND Password = '" + password + "'";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			while (rs.next()) {

				user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
						rs.getBoolean("Admin"));
			}
		}

		return user;
		//s
//		User user = null;
//
//		String query = "SELECT * FROM users WHERE UserName = '" + userName + "' AND Password = '" + password + "'";
//
//		ResultSet rs = null;
//
//		try (Statement statement = connection.createStatement();) {
//
//			rs = statement.executeQuery(query);
//
//			while (rs.next()) {
//
//				user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
//						rs.getBoolean("Admin"));
//
//				
//			}
//		}
//		rs.close();
//		return user;
	}
	
	@Override
	public User getContactByUserName(String userName) throws SQLException {

		User user = null;

		String query = "SELECT * FROM users WHERE UserName = '" + userName + "'";

		ResultSet rs = null;

		try (Statement statement = connection.createStatement();) {

			rs = statement.executeQuery(query);

			if (rs.next()) {

				user = new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),
						rs.getBoolean("Admin"));

				rs.close();
			}
		}

		return user;
	}

	@Override
	public void addUser(String userName, String password) throws SQLException {

		String query = "INSERT INTO users(UserName, Password) VALUES (?, ?)";

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.setString(1, userName);
			statement.setString(2, password);

			statement.executeUpdate();
		}
	}

	@Override
	public void deleteUser(String username) throws SQLException {

		String query = "DELETE FROM users WHERE UserName = '" + username + "';";

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.executeUpdate();
		}
	}
	
	@Override
	public void deleteUser(int userID) throws SQLException {

		String query = "DELETE FROM users WHERE UserID = '" + userID + "';";

		try (PreparedStatement statement = connection.prepareStatement(query);) {

			statement.executeUpdate();
		}
	}
}
