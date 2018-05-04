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
		// �α������� ����ڰ� �ۼ��� �� ����� �ҷ����� �κ�
		PostDao postDao = new PostDao();
		
		//�⺻session�� ������ ��Ʈ�ѷ����� ������ stage���� ������ stage�� �ǽ��� �帧���� ���� ������ ����
		List<PostDTO> post = postDao.postGet((Integer)session.getAttribute("memberNum"), stage);
		System.out.println(post.size());
		// post ����� model�� �߰�
		model.addAttribute("post", post);
		System.out.println(1);
		
		MemberDao memberDao = new MemberDao();
		List<MemberDTO> member = new ArrayList<MemberDTO>();
		
		MemberDTO temp = new MemberDTO();
		
		// picture, reply ����� post���� �˻��Ͽ� model�� �߰��ϴ� �κ�
		for(int i=0; i<post.size(); i++) {
			// picture�� �߰�
			PictureDao picDao = new PictureDao();
			List<PictureDTO> picture = picDao.pictureGet(post.get(i).getPost_number());
			model.addAttribute("picture"+post.get(i).getPost_number(), picture);
			// reply�� �߰�
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
