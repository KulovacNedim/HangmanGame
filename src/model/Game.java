package model;

public class Game {

	private User user;
	private int score;
	private Word word;
	private Category category;
	private int misses;
	private int correct;
	private String solutionPlaceholder;
	private String usedLetters;
	private String imagePath;
	private static int wins;
	private static int lost;
	private static int generalScore;
	
	public Game() {
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Word getWord() {
		return word;
	}

	public void setWord(Word word) {
		this.word = word;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getMisses() {
		return misses;
	}

	public void setMisses(int misses) {
		this.misses = misses;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public String getSolutionPlaceholder() {
		return solutionPlaceholder;
	}

	public void setSolutionPlaceholder(String solutionPlaceholder) {
		this.solutionPlaceholder = solutionPlaceholder;
	}

	public String getUsedLetters() {
		return usedLetters;
	}

	public void setUsedLetters(String usedLetters) {
		this.usedLetters = usedLetters;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public static int getWins() {
		return wins;
	}

	public static void setWins(int wins) {
		Game.wins = wins;
	}

	public static int getLost() {
		return lost;
	}

	public static void setLost(int lost) {
		Game.lost = lost;
	}

	public static int getGeneralScore() {
		return generalScore;
	}

	public static void setGeneralScore(int generalScore) {
		Game.generalScore = generalScore;
	}

	@Override
	public String toString() {
		return "Game [user=" + user + ", score=" + score + ", word=" + word + ", category=" + category + ", misses="
				+ misses + ", correct=" + correct + ", solutionPlaceholder=" + solutionPlaceholder + ", usedLetters="
				+ usedLetters + ", imagePath=" + imagePath + "]";
	}

	
	
}
