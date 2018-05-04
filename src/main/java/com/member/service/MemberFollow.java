package com.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberFollowerDTO;
import com.member.dto.MemberFollowingDTO;

public class MemberFollow implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		// name="num" value = ${member.member_number} �⺻������ ����ִ�.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		HttpSession session = request.getSession();
		
		System.out.println("����?/");
		int check =0;
		int memberNum =0;
		int memberOtherNum =0;
		MemberDao dao = new MemberDao();
		ArrayList<MemberFollowerDTO> werdto = new ArrayList<MemberFollowerDTO>();
		ArrayList<MemberFollowingDTO> winggdto = new ArrayList<MemberFollowingDTO>();
		
		//������ member_number
		memberOtherNum = Integer.parseInt(request.getParameter("num"));
		System.out.println(memberOtherNum);
		//���� member_number
		memberNum = (Integer) session.getAttribute("memberNum");
		System.out.println(memberNum);
		try{
			PrintWriter out = response.getWriter();
			if(dao.follow(memberOtherNum, memberNum) == 1 ){
				dao.followNumberUpdate(memberOtherNum, memberNum);
				out.print(1);
			}else{
				out.print(0);
			}
		}catch(Exception e){
		}

	}

}
