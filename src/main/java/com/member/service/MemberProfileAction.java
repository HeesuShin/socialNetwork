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
		
		// �ٸ� ����� �����ʷ� ������ �� �� �̿��ϴ� ����
		
		if(otherId != null){
			
			try {
				Mdto = Mdao.memberGetbyID(otherId);
				
				// id�� �������ִ� post������ ��δ� �������� �ҽ�
				Pdto = Pdao.myPostGet(Mdto.getMember_number(), stage);
			} catch(EmptyResultDataAccessException e) {
			}
			
			//picture �����  post���� �˻��Ͽ� model�� �߰��ϴ� �κ� ���� �߰�
			for(int i =0; i<Pdto.size(); i++){
				PictureDao picDao = new PictureDao();
				PictureDTO picture = picDao.profilePictureGet(Pdto.get(i).getPost_number());
				model.addAttribute("picture"+Pdto.get(i).getPost_number(), picture);
				System.out.println(Pdto.get(i).getPost_number());

//				ReplyDao replyDao = new ReplyDao();
//				List<ReplyDTO> reply = replyDao.replyGet(Pdto.get(i).getPost_number());
//				model.addAttribute("reply"+Pdto.get(i).getPost_number(), reply);
			}
			
			//���񽺷� ����. ����� �� ������ ������
			model.addAttribute("member", Mdto); 
			
			// id�� �������ִ� post������ ��δ� �������� �ҽ��� ������ ���񽺷� ����.
			model.addAttribute("post", Pdto);
		}else{
			
			try {
				Mdto = Mdao.memberGetbyID(id);
				
				// id�� �������ִ� post������ ��δ� �������� �ҽ�
				Pdto = Pdao.myPostGet(Mdto.getMember_number(), stage);
			} catch(EmptyResultDataAccessException e) {
			}
			
			//picture �����  post���� �˻��Ͽ� model�� �߰��ϴ� �κ� ���� �߰�
			for(int i =0; i<Pdto.size(); i++){
				PictureDao picDao = new PictureDao();
				PictureDTO picture = picDao.profilePictureGet(Pdto.get(i).getPost_number());
				System.out.println(picture.getPicture_path());
				model.addAttribute("picture"+Pdto.get(i).getPost_number(), picture);
			}
			
			//���񽺷� ����. ����� �� ������ ������
			model.addAttribute("member", Mdto); 
			
			// id�� �������ִ� post������ ��δ� �������� �ҽ��� ������ ���񽺷� ����.
			model.addAttribute("post", Pdto);
		}
		
	}

}