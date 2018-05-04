package com.member.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.ui.Model;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;
import com.picture.dao.PictureDao;
import com.picture.dto.PictureDTO;
import com.post.dao.PostDao;
import com.post.dto.PostDTO;

public class MemberProfileAction implements MemberService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();

		int stage = 0;
		if(request.getParameter("stage") == null) {
			stage = 1;
		} else {
			stage = Integer.parseInt(request.getParameter("stage"));
		}
		System.out.println(stage);
		
		String id = (String) session.getAttribute("id");
		String otherId = null;
		
		otherId = request.getParameter("memberId");
		
		MemberDao Mdao = new MemberDao();
		MemberDTO Mdto = new MemberDTO();
		PostDao Pdao = new PostDao();
		ArrayList<PostDTO> Pdto = new ArrayList<PostDTO>();
		
		// 다른 사람의 프로필로 들어갈려고 할 때 이용하는 정보
		
		if(otherId != null){
			
			try {
				Mdto = Mdao.memberGetbyID(otherId);
				
				// id에 가지고있는 post정보를 모두다 가져오는 소스
				Pdto = Pdao.myPostGet(Mdto.getMember_number(), stage);
			} catch(EmptyResultDataAccessException e) {
			}
			
			//picture 목록을  post별로 검색하여 model에 추가하는 부분 새로 추가
			for(int i =0; i<Pdto.size(); i++){
				PictureDao picDao = new PictureDao();
				PictureDTO picture = picDao.profilePictureGet(Pdto.get(i).getPost_number());
				model.addAttribute("picture"+Pdto.get(i).getPost_number(), picture);
				System.out.println(Pdto.get(i).getPost_number());

//				ReplyDao replyDao = new ReplyDao();
//				List<ReplyDTO> reply = replyDao.replyGet(Pdto.get(i).getPost_number());
//				model.addAttribute("reply"+Pdto.get(i).getPost_number(), reply);
			}
			
			//서비스로 간다. 사용자 의 정보를 가지고
			model.addAttribute("member", Mdto); 
			
			// id에 가지고있는 post정보를 모두다 가져오는 소스를 가지고 서비스로 간다.
			model.addAttribute("post", Pdto);
		}else{
			
			try {
				Mdto = Mdao.memberGetbyID(id);
				
				// id에 가지고있는 post정보를 모두다 가져오는 소스
				Pdto = Pdao.myPostGet(Mdto.getMember_number(), stage);
			} catch(EmptyResultDataAccessException e) {
			}
			
			//picture 목록을  post별로 검색하여 model에 추가하는 부분 새로 추가
			for(int i =0; i<Pdto.size(); i++){
				PictureDao picDao = new PictureDao();
				PictureDTO picture = picDao.profilePictureGet(Pdto.get(i).getPost_number());
				System.out.println(picture.getPicture_path());
				model.addAttribute("picture"+Pdto.get(i).getPost_number(), picture);
			}
			
			//서비스로 간다. 사용자 의 정보를 가지고
			model.addAttribute("member", Mdto); 
			
			// id에 가지고있는 post정보를 모두다 가져오는 소스를 가지고 서비스로 간다.
			model.addAttribute("post", Pdto);
		}
		
	}

}