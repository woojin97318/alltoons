package com.alltoons.root.webtoon.dto;

public class FavoritesDTO {
	public String userEmail;
	public int webtoonNum;
	public char favofites;
	public char interest;
	
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
	public char getFavofites() {
		return favofites;
	}
	public void setFavofites(char favofites) {
		this.favofites = favofites;
	}
	public char getInterest() {
		return interest;
	}
	public void setInterest(char interest) {
		this.interest = interest;
	}
	
}
