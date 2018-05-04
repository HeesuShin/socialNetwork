package com.reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.reply.dto.ReplyDTO;
import com.socialService.util.Constant;

public class ReplyDao {
	
	JdbcTemplate template;

	public ReplyDao() {
		this.template = Constant.template;
	}
	
	public ArrayList<ReplyDTO> replyGet(final int postNumber){
		String query = "select * from reply where reply_del = 'N' and reply_post_number = '" + postNumber + "' order by reply_date desc";
		return (ArrayList<ReplyDTO>)template.query(query, new BeanPropertyRowMapper<ReplyDTO>(ReplyDTO.class));
	}
	
	public int replyAdd(final int postNum, final int memberNum, final String text) {
		int addConfirm = this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "insert into reply(reply_number, reply_post_number, reply_member_number, reply_text, reply_del) values(reply_seq.nextval, ?, ?, ?, 'N')";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, postNum);
				pstmt.setInt(2, memberNum);
				pstmt.setString(3, text);
				return pstmt;
			}
		});
		int result = 0;
		if(addConfirm == 1) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
}
