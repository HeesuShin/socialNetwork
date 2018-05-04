package com.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;

public class MemberJoinAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String iname = request.getParameter("iname");
		
		MemberDao dao = new MemberDao();
		dao.memberAdd(id, pw, iname);
		
	}

}
