package com.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;

public class MemberSearchAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String search = (String)request.getParameter("search");
		MemberDao memberDao = new MemberDao();
		
		List<MemberDTO> searchResult = memberDao.memberSearch(search);
		for(int i=0; i<searchResult.size(); i++) {
			System.out.println(searchResult.get(i).getMember_id());
		}
		model.addAttribute("searchResult", searchResult);
	}

}
