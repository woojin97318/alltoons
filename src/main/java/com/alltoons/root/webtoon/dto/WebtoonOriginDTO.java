package com.alltoons.root.webtoon.dto;

public class WebtoonOriginDTO {
	public int webtoonNum;
	public String originalPlatform;
	public String originalPlatformKor;
	public String webtoonOriginalLink;

	public String getOriginalPlatformKor() {
		return originalPlatformKor;
	}

	public void setOriginalPlatformKor(String originalPlatformKor) {
		this.originalPlatformKor = originalPlatformKor;
	}

	public int getWebtoonNum() {
		return webtoonNum;
	}

	public void setWebtoonNum(int webtoonNum) {
		this.webtoonNum = webtoonNum;
	}

	public String getOriginalPlatform() {
		return originalPlatform;
	}

	public void setOriginalPlatform(String originalPlatform) {
		this.originalPlatform = originalPlatform;
	}

	public String getWebtoonOriginalLink() {
		return webtoonOriginalLink;
	}

	public void setWebtoonOriginalLink(String webtoonOriginalLink) {
		this.webtoonOriginalLink = webtoonOriginalLink;
	}
}
