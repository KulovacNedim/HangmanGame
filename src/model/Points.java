package model;

public class Points {

	int userID;
	int points;
	
	public Points(int userID, int points) {
		super();
		this.userID = userID;
		this.points = points;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	@Override
	public String toString() {
		return "Points [userID=" + userID + ", points=" + points + "]";
	}
	
}
