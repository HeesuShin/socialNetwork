package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.member.dto.MemberDTO;
import com.post.dto.PostDTO;
import com.socialService.util.Constant;

public class MemberDao {
	
	JdbcTemplate template;
	
	public MemberDao() {
		this.template = Constant.template;
	}
	
	public void memberAdd(final String id, final String pw, final String iname) {
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "insert into member(member_number, member_id, member_password, member_date, member_name, member_out) values(member_seq.nextval, ?, ?, sysdate, ?, 'N')";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, iname);
				return pstmt;
			}
		});
	}
	
	public MemberDTO memberIDCheck(final String id) {
		
		MemberDTO member = new MemberDTO();
		String query = "select * from member where member_id = '" + id + "'";
		//String query = "select count(*) from member where member_id = '" + id +"'";
		try {
			member = template.queryForObject(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
			//int a = template.queryForObject(query, new BeanPropertyRowMapper<Integer>(Integer.class));
		} catch(NullPointerException e) {
			member.setMember_id("");
			//int a=0;
		} catch(EmptyResultDataAccessException e){
			member.setMember_id("");
			//int a=0;
		}
		return member;
		//return a;
	}
	
	public MemberDTO memberGetbyID(final String id) {
		
		String query = "select * from member where member_id = '" + id + "'";
		return template.queryForObject(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	public MemberDTO memberGetbyMemberNumber(final int memberNum) {
		
		String query = "select * from member where member_number = '" + memberNum + "'";
		return template.queryForObject(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	public void memberModify(final String name, final String gender, final String intro, final String path, final String id) {
		this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "update member set member_name = ?, member_gender = ?, member_intro = ?, member_profile_pic = ? where member_id = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, name);
				pstmt.setString(2, gender);
				pstmt.setString(3, intro);
				pstmt.setString(4, path);
				pstmt.setString(5, id);
				return pstmt;
			}
		});
		
	}
	
	public void postNumUpdate(final int memberNum) {
		this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "update member set member_post_number = (member_post_number + 1) where member_number = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, memberNum);
				return pstmt;
			}
		});
		
	}
	
	public ArrayList<MemberDTO> memberSearch(final String search){
		String query = "select d1.* from (select * from member where member_id like '%" + search + "%' or member_name like '%" + search + "%') d1 where d1.member_out = 'N'";
		return (ArrayList<MemberDTO>)template.query(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	public int follow(final int follower, final int following){
		return this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "insert into follow(member_number, follow_number) values(?,?)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, following);
				pstmt.setInt(2, follower);
				return pstmt;
			}
		});
	}
	
	public int followCancel(final int follower, final int following){
		return this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query ="delete from follow where member_number = ? and follow_number = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, following);
				pstmt.setInt(2, follower);
				return pstmt;
			}
		});
	}
	
	public int followCheck(final int follower, final int following){
		String query ="select count(*) from follow where member_number = "+following +" and follow_number = "+follower;			
		return template.queryForObject(query, Integer.class);
	}
	
	public void followNumberUpdate(final int follower, final int following) {
		//³» db¿¡¼­ ÆÈ·ÎÀ® ¾÷µ¥ÀÌÆ®
		this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "update member set member_following_number = (select count(*) from follow where member_number =?) where member_number = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, following);
				pstmt.setInt(2, following);
				return pstmt;
			}
		});
		
		//»ó´ë db¿¡¼­ ÆÈ·Î¿ì ¾÷µ¥ÀÌÆ®
		this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "update member set member_follower_number = (select count(*) from follow where follow_number =?) where member_number = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, follower);
				pstmt.setInt(2, follower);
				return pstmt;
			}
		});
		System.out.println("¿Ï·á µÇ¾ú³ª??????/ ¾î¤Ã¾î¾î¾î¾î³Ê¤Ã¤±¤·¤¤·Õ¤¤·Õ¤±³Ê¤¿·Õ¤±´Ï·Õ´Ó¤·³à¤Á·Õ¤±³à¤Á¤Ó¤Ç¤½¤·´Ï¤Á");
		
	}
	
	public int memberDelete(final int memberNum){
		return this.template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query ="update member set member_out = 'Y' where member_number = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, memberNum);
				return pstmt;
			}
		});
	}
	
	
}
