package com.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;

public class MemberGetAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		String id = null;
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		MemberDao dao = new MemberDao();
		MemberDTO dto = new MemberDTO();
		
		id = (String) session.getAttribute("id");
		try{
			dto = dao.memberGetbyID(id);
		}catch(Exception e){
			
		}
		model.addAttribute("member", dto);

	}

}
