package com.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;

public class MemberDeleteAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		int memberNum=0;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		memberNum = (Integer) session.getAttribute("memberNum");
		MemberDao dao = new MemberDao();
		dao.memberDelete(memberNum);
	}

}
