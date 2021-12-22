package com.alltoons.root.webtoon.dto;

public class WebtoonPlatformDTO {
	public int webtoonNum;
	public String platformName;
	public String platformNameKor;
	public String webtoonLink;

	public String getPlatformNameKor() {
		return platformNameKor;
	}

	public void setPlatformNameKor(String platformNameKor) {
		this.platformNameKor = platformNameKor;
	}


	public int getWebtoonNum() {
		return webtoonNum;
	}

	public void setWebtoonNum(int webtoonNum) {
		this.webtoonNum = webtoonNum;
	}

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	public String getWebtoonLink() {
		return webtoonLink;
	}

	public void setWebtoonLink(String webtoonLink) {
		this.webtoonLink = webtoonLink;
	}
}
