package com.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;

public class MemberIDCheckAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// DAO »ý¼º
		MemberDao dao = new MemberDao();
		MemberDTO dto = new MemberDTO();
		dto = dao.memberIDCheck(request.getParameter("id"));
		
		int check = 0;
		if(dto.getMember_id().isEmpty()) {
			check = 1;
		} else {
			check = 0;
		}
		
		request.setAttribute("check", check);
		model.addAttribute("request", request);
	}

}
