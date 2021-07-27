package com.javaex.vo;

public class UserVo {

	private String id;
	private String password;
	private int no;
	private String name;
	private String gender;

	public UserVo() {
		super();
	}

	public UserVo(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", no=" + no + ", name=" + name + ", gender=" + gender
				+ "]";
	}

	

}
