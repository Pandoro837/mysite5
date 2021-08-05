package com.javaex.vo;

public class GalleryVo {

	private int galleryNo;
	private int userNo;
	private String userName;
	private String filePath;
	private String orgName;
	private String saveName;
	private String content;
	private long size;
	
	public GalleryVo() {
		
	}
	public GalleryVo(String filePath, String orgName, String saveName, long size) {
		super();
		this.filePath = filePath;
		this.orgName = orgName;
		this.saveName = saveName;
		this.size = size;
	}
	
	public int getGalleryNo() {
		return galleryNo;
	}
	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	
	@Override
	public String toString() {
		return "GalleryVo [galleryNo=" + galleryNo + ", userNo=" + userNo + ", userName=" + userName + ", filePath="
				+ filePath + ", orgName=" + orgName + ", saveName=" + saveName + ", content=" + content + ", size="
				+ size + "]";
	}
	
	
}
