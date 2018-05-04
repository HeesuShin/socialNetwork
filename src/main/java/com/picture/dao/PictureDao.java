package com.picture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.picture.dto.PictureDTO;
import com.post.dto.PostDTO;
import com.socialService.util.Constant;

public class PictureDao {
	
	JdbcTemplate template;

	public PictureDao() {
		this.template = Constant.template;
	}
	
	public void setPostNumForPicture(final int picNum, final String path, final String decription, final int postNum){
		this.template.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				String query ="insert into picture(picture_number, picture_path, picture_description, picture_post_number) values (?, ?, ?, ?)";
				//insert into picture(picture_number, picture_path, picture_description, picture_post_number) values (picture_seq.nextval,?,?, (select max(post_number) from post where post_member_number=?));
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, picNum);
				pstmt.setString(2, path);
				pstmt.setString(3, decription);
				pstmt.setInt(4, postNum);
				return pstmt;
			}
		});
	}
	
	public ArrayList<PictureDTO> pictureGet(final int postNumber){
		String query = "select * from picture where picture_post_number = '"+ postNumber +"' order by picture_number asc";
		return (ArrayList<PictureDTO>)template.query(query, new BeanPropertyRowMapper<PictureDTO>(PictureDTO.class));
	}
	public PictureDTO profilePictureGet(final int postNumber) {
		String query = "select * from picture where picture_path like '" + postNumber + "_0%'";
		return template.queryForObject(query, new BeanPropertyRowMapper<PictureDTO>(PictureDTO.class));
	}

}
