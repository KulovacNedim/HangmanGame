package model;

public class Word {

	private String word;
	private int category;
	
	public Word(String word, int category) {
		this.word = word;
		this.category = category;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Words [word=" + word + ", category=" + category + "]";
	}
	
}