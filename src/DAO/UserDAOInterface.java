package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import model.User;

public interface UserDAOInterface {

	public ArrayList<User> getUsers() throws SQLException;
	
	public ArrayList<User> searchForUsers(String searchString) throws SQLException;

	public User getUser(int userID) throws SQLException;
	
	public User getUserByUserNameAndPass(String nickName, String password) throws SQLException;
	
	public User getContactByUserName(String userName) throws SQLException;
	
	public void addUser(String userName, String password) throws SQLException;

	public void deleteUser(String username) throws SQLException;
	
	public void deleteUser(int userID) throws SQLException;

}
