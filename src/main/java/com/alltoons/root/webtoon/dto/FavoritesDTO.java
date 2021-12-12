package com.alltoons.root.webtoon.dto;

public class FavoritesDTO {
	public String userEmail;
	public int webtoonNum;
	public boolean favofites;
	public boolean interest;
	
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
	public boolean isFavofites() {
		return favofites;
	}
	public void setFavofites(boolean favofites) {
		this.favofites = favofites;
	}
	public boolean isInterest() {
		return interest;
	}
	public void setInterest(boolean interest) {
		this.interest = interest;
	}
}
