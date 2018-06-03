package model;

public class Points {

	int userID;
	String name;
	int points;
	
	public Points(int userID, String name, int points) {
		super();
		this.userID = userID;
		this.name = name;
		this.points = points;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
	
	@Override
	public String toString() {
		return "Points [userID=" + userID + ", name=" + name + ", points=" + points + "]";
	}

}
