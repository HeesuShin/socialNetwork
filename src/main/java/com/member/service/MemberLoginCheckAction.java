package com.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;

public class MemberLoginCheckAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		int check = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDao dao = new MemberDao();
		
		try {
			MemberDTO member = dao.memberGetbyID(id);
			System.out.println(member.getMember_password());
			if(member.getMember_out() == 'N'){
				if(member.getMember_password().equals(pw)) {
					check = 1;
				} else {
					check = 2;
				}
			}else{
				check = 0;
			}
			
		} catch(EmptyResultDataAccessException e) {
			e.printStackTrace();
			check = -1;
		}
		try{
			PrintWriter out = response.getWriter();
			if(check==2){
				out.println("<script type='text/javascript'>");
				out.println("alert('비밀번호가 틀렸습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
			} else if(check==-1 || check == 0){
				out.println("<script type='text/javascript'>");
				out.println("alert('없는 아이디 입니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
			}
		}catch(IOException e){
			e.printStackTrace();
		}catch(EmptyResultDataAccessException e) {
				e.printStackTrace();
		}
		
		model.addAttribute("check", check);
	}

}
