package com.member.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private int member_number;
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_gender;
	private String member_date;
	private String member_profile_pic;
	private String member_intro;
	private int member_post_number;
	private int member_follower_number;
	private int member_following_number;
	private char member_out;
	
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getMember_number() {
		return member_number;
	}
	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_date() {
		return member_date;
	}
	public void setMember_date(String member_date) {
		this.member_date = member_date;
	}
	public String getMember_profile_pic() {
		return member_profile_pic;
	}
	public void setMember_profile_pic(String member_profile_pic) {
		this.member_profile_pic = member_profile_pic;
	}
	public String getMember_intro() {
		return member_intro;
	}
	public void setMember_intro(String member_intro) {
		this.member_intro = member_intro;
	}
	public int getMember_post_number() {
		return member_post_number;
	}
	public void setMember_post_number(int member_post_number) {
		this.member_post_number = member_post_number;
	}
	public int getMember_follower_number() {
		return member_follower_number;
	}
	public void setMember_follower_number(int member_follower_number) {
		this.member_follower_number = member_follower_number;
	}
	public int getMember_following_number() {
		return member_following_number;
	}
	public void setMember_following_number(int member_following_number) {
		this.member_following_number = member_following_number;
	}
	public char getMember_out() {
		return member_out;
	}
	public void setMember_out(char member_out) {
		this.member_out = member_out;
	}
	
	
}
