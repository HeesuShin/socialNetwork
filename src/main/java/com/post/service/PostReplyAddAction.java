package com.post.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.reply.dao.ReplyDao;

public class PostReplyAddAction implements PostService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		HttpSession session = request.getSession();
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		int memberNum = (Integer)session.getAttribute("memberNum");
		String text = (String)request.getParameter("text");
		
		ReplyDao replyDao = new ReplyDao();
		int result = replyDao.replyAdd(postNum, memberNum, text);
		System.out.println("service´Ü °á°ú : " + result);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
