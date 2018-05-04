package com.picture.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;
import com.picture.dao.PictureDao;
import com.picture.dto.PictureDTO;
import com.post.dao.PostDao;
import com.post.dto.PostDTO;
import com.reply.dao.ReplyDao;
import com.reply.dto.ReplyDTO;

public class ProfilePictureGetAction implements PictureService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int postNumber = Integer.parseInt(request.getParameter("postNum"));

		List<PictureDTO> picture = new ArrayList<PictureDTO>();
		List<ReplyDTO> reply = new ArrayList<ReplyDTO>();
		List<PostDTO> post = new ArrayList<PostDTO>();
		
		PictureDao picDao = new PictureDao();
		picture = picDao.pictureGet(postNumber);
		
		ReplyDao replyDao = new ReplyDao();
		reply = replyDao.replyGet(postNumber);
		
		PostDao postDao = new PostDao();
		post = postDao.getPostbyPostnum(postNumber);
		
		List<String> replyName = new ArrayList<String>();
		MemberDTO member = new MemberDTO();
		MemberDao memberDao = new MemberDao();
		
		for(int i=0; i<reply.size(); i++) {
			member = memberDao.memberGetbyMemberNumber(reply.get(i).getReply_member_number());
			replyName.add(i, member.getMember_name());
		}
		
		model.addAttribute("picture", picture);
		model.addAttribute("reply", reply);
		model.addAttribute("post", post);
		model.addAttribute("replyName", replyName);
		model.addAttribute("replySize", reply.size());
		
	}

}