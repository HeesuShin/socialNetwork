package com.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberFollowerDTO;
import com.member.dto.MemberFollowingDTO;

public class MemberFollowCheck implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		HttpSession session = request.getSession();
		
		int check =0;
		int memberNum =0;
		int memberOtherNum =0;
		MemberDao dao = new MemberDao();
		ArrayList<MemberFollowerDTO> werdto = new ArrayList<MemberFollowerDTO>();
		ArrayList<MemberFollowingDTO> winggdto = new ArrayList<MemberFollowingDTO>();
		
		//상대방의 member_number
		memberOtherNum = Integer.parseInt(request.getParameter("num"));
		//나의 member_number
		memberNum = (Integer) session.getAttribute("memberNum");
		try{
			check = dao.followCheck(memberOtherNum, memberNum);
			System.out.println(check);
			PrintWriter out = response.getWriter();
			if(check == 1 ){
				out.print("ok");
			}else{
				System.out.println(2);
				out.print("no");
			}
		}catch(EmptyResultDataAccessException e){
		}catch (IOException e) {
		}

	}

}
