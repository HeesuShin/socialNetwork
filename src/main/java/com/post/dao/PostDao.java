package com.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.post.dto.PostDTO;
import com.socialService.util.Constant;

public class PostDao {
	
	JdbcTemplate template;

	public PostDao() {
		this.template = Constant.template;
	}
	
	public ArrayList<PostDTO> postGet(final int memberNumber, final int stage){
		String query = "select d2.post_number, d2.post_member_number, d2.post_text, d2.post_tag_info, d2.post_like, d2.post_like_list, d2.post_region_number, d2.post_del, to_char(d2.post_date, 'YYYY-MM-DD') as post_date from (select rownum as rnum, d1.* from (select * from ((select p1.* from post p1, (select * from follow where member_number = '" + memberNumber + "') aa where aa.follow_number = post_member_number) union (select * from post where post_member_number = '" + memberNumber + "')) order by post_date desc) d1) d2 where d2.rnum >= " + ((stage-1)*5+1) + " and d2.rnum <=" + stage*5;
		return (ArrayList<PostDTO>)template.query(query, new BeanPropertyRowMapper<PostDTO>(PostDTO.class));
	}
	
	public ArrayList<PostDTO> myPostGet(final int memberNumber, final int stage) {
		String query = "select d2.post_number, d2.post_member_number, d2.post_text, d2.post_tag_info, d2.post_like, d2.post_like_list, d2.post_region_number, d2.post_del, to_char(d2.post_date, 'YYYY-MM-DD') as post_date from (select rownum as rnum, d1.* from (select * from post where post_member_number = '" + memberNumber + "' order by post_date desc) d1) d2 where d2.rnum >='" + ((stage-1)*6+1) + "' and d2.rnum <='" + stage*6 + "'";
		return (ArrayList<PostDTO>)template.query(query, new BeanPropertyRowMapper<PostDTO>(PostDTO.class));
	}
	
	public void postAdd(final int memberNum, final String text) {
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "insert into post(post_number, post_member_number, post_text, post_tag_info, post_like_list, post_region_number, post_date) values(post_seq.nextval, ?, ?, '', '', 0, sysdate)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, memberNum);
				pstmt.setString(2, text);
				return pstmt;
			}
		});
	}
	
	public int getCurrentPostNum(final int memberNum) {
		String query = "select max(post_number) from post where post_member_number = '" + memberNum + "'";
		return this.template.queryForObject(query, Integer.class);
	}
	
	public ArrayList<PostDTO> getPostbyPostnum(final int postNum) {
		String query = "select post_number, post_member_number, post_text, post_tag_info, post_like, post_like_list, post_region_number, post_del, to_char(post_date, 'YYYY-MM-DD') as post_date from post where post_number = '" + postNum + "'";
		return (ArrayList<PostDTO>)this.template.query(query, new BeanPropertyRowMapper<PostDTO>(PostDTO.class));
	}
	
}
