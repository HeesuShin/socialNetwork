package com.reply.dto;

public class ReplyDTO {
	private int reply_number;
	private int reply_post_number;
	private int reply_member_number;
	private String reply_text;
	private char reply_del;
	
	public int getReply_number() {
		return reply_number;
	}
	public void setReply_number(int reply_number) {
		this.reply_number = reply_number;
	}
	public int getReply_post_number() {
		return reply_post_number;
	}
	public void setReply_post_number(int reply_post_number) {
		this.reply_post_number = reply_post_number;
	}
	public int getReply_member_number() {
		return reply_member_number;
	}
	public void setReply_member_number(int reply_member_number) {
		this.reply_member_number = reply_member_number;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public char getReply_del() {
		return reply_del;
	}
	public void setReply_del(char reply_del) {
		this.reply_del = reply_del;
	}
	
}
