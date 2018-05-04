package com.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;

public class MemberModifyAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		MemberDao dao = new MemberDao();
		try {
			dao.memberModify(new String(request.getParameter("iname").getBytes("8859_1"), "utf-8"), request.getParameter("gender"), new String(request.getParameter("intro").getBytes("8859_1"), "utf-8"), (String)request.getAttribute("path"), (String)session.getAttribute("id"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
