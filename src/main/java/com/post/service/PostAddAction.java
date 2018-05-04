package com.post.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.post.dao.PostDao;
import com.post.dto.PostDTO;

public class PostAddAction implements PostService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		PostDao pdao = new PostDao();
		MemberDao mdao = new MemberDao();
		try {
			pdao.postAdd((Integer)session.getAttribute("memberNum"), new String(request.getParameter("content").getBytes("8859_1"), "utf-8"));
			
			mdao.postNumUpdate((Integer)session.getAttribute("memberNum"));
			
			int postNum = pdao.getCurrentPostNum((Integer)session.getAttribute("memberNum"));
			
			model.addAttribute("postNum", postNum);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
