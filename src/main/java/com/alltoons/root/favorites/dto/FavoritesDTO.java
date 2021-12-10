package com.alltoons.root.favorites.dto;

public class FavoritesDTO {
	private String userEmail;
	private int webtoonNum;
	private char favorites;
	private char interest;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getWebtoonNum() {
		return webtoonNum;
	}
	public void setWebtoonNum(int webtoonNum) {
		this.webtoonNum = webtoonNum;
	}
	public char getFavorites() {
		return favorites;
	}
	public void setFavorites(char favorites) {
		this.favorites = favorites;
	}
	public char getInterest() {
		return interest;
	}
	public void setInterest(char interest) {
		this.interest = interest;
	}
}
