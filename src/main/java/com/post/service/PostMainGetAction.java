package com.post.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;
import com.picture.dao.PictureDao;
import com.picture.dto.PictureDTO;
import com.post.dao.PostDao;
import com.post.dto.PostDTO;
import com.reply.dao.ReplyDao;
import com.reply.dto.ReplyDTO;

public class PostMainGetAction implements PostService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int stage = 0;
		if(request.getParameter("stage") == null) {
			stage = 1;
		} else {
			stage = Integer.parseInt(request.getParameter("stage"));
		}
		// 로그인중인 사용자가 작성한 글 목록을 불러오는 부분
		PostDao postDao = new PostDao();
		
		//기본session의 정보랑 콘트롤러에서 보내준 stage값을 받은것 stage는 의식의 흐름으로 만든 페이지 갯수
		List<PostDTO> post = postDao.postGet((Integer)session.getAttribute("memberNum"), stage);
		System.out.println(post.size());
		// post 목록을 model에 추가
		model.addAttribute("post", post);
		System.out.println(1);
		
		MemberDao memberDao = new MemberDao();
		List<MemberDTO> member = new ArrayList<MemberDTO>();
		
		MemberDTO temp = new MemberDTO();
		
		// picture, reply 목록을 post별로 검색하여 model에 추가하는 부분
		for(int i=0; i<post.size(); i++) {
			// picture를 추가
			PictureDao picDao = new PictureDao();
			List<PictureDTO> picture = picDao.pictureGet(post.get(i).getPost_number());
			model.addAttribute("picture"+post.get(i).getPost_number(), picture);
			// reply를 추가
			ReplyDao replyDao = new ReplyDao();
			List<ReplyDTO> reply = replyDao.replyGet(post.get(i).getPost_number());
			model.addAttribute("reply"+post.get(i).getPost_number(), reply);
			
			List<String> replyName = new ArrayList<String>();
			for(int j=0; j<reply.size(); j++) {
				temp = memberDao.memberGetbyMemberNumber(reply.get(j).getReply_member_number());
				replyName.add(j, temp.getMember_name());
			}
			model.addAttribute("replyName"+post.get(i).getPost_number(), replyName);
			model.addAttribute("replySize"+post.get(i).getPost_number(), reply.size());
			member.add(i, memberDao.memberGetbyMemberNumber(post.get(i).getPost_member_number()));
		}
		for(int i=0; i<post.size(); i++) {
			System.out.println(post.get(i).getPost_number());
		}
		model.addAttribute("member", member);
	}

}
