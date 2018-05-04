package com.post.dto;

public class PostDTO {
	private int post_number;
	private int post_member_number;
	private String post_text;
	private String post_tag_info;
	private int post_like;
	private String post_like_list;
	private int post_region_number;
	private char post_del;
	private String post_date;
	
	
	public int getPost_number() {
		return post_number;
	}
	public void setPost_number(int post_number) {
		this.post_number = post_number;
	}
	public int getPost_member_number() {
		return post_member_number;
	}
	public void setPost_member_number(int post_member_number) {
		this.post_member_number = post_member_number;
	}
	public String getPost_text() {
		return post_text;
	}
	public void setPost_text(String post_text) {
		this.post_text = post_text;
	}
	public String getPost_tag_info() {
		return post_tag_info;
	}
	public void setPost_tag_info(String post_tag_info) {
		this.post_tag_info = post_tag_info;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public String getPost_like_list() {
		return post_like_list;
	}
	public void setPost_like_list(String post_like_list) {
		this.post_like_list = post_like_list;
	}
	public int getPost_region_number() {
		return post_region_number;
	}
	public void setPost_region_number(int post_region_number) {
		this.post_region_number = post_region_number;
	}
	public char getPost_del() {
		return post_del;
	}
	public void setPost_del(char post_del) {
		this.post_del = post_del;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
}
