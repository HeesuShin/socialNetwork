package com.socialService.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.member.dao.MemberDao;
import com.member.dto.MemberDTO;
import com.member.service.MemberDeleteAction;
import com.member.service.MemberFollow;
import com.member.service.MemberFollowCancel;
import com.member.service.MemberFollowCheck;
import com.member.service.MemberGetAction;
import com.member.service.MemberIDCheckAction;
import com.member.service.MemberJoinAction;
import com.member.service.MemberLoginCheckAction;
import com.member.service.MemberModifyAction;
import com.member.service.MemberProfileAction;
import com.member.service.MemberSearchAction;
import com.member.service.MemberService;
import com.picture.service.PictureAddAction;
import com.picture.service.PictureService;
import com.picture.service.ProfilePictureGetAction;
import com.post.service.PostAddAction;
import com.post.service.PostMainGetAction;
import com.post.service.PostReplyAddAction;
import com.post.service.PostService;
import com.socialService.util.Constant;

@Controller
public class SocialController {

	private JdbcTemplate template;
	MemberService memService = null;
	PostService postService = null;
	PictureService picService = null;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@RequestMapping("/index")
	public String firstPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("/join")
	public String joinPage() {
		return "join";
	}
	
	@RequestMapping("/joinOk")
	public String joinOk(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memService = new MemberJoinAction();
		memService.action(model);
		
		return  "index";
	}
	
	@RequestMapping("/checkID")
	@ResponseBody
	public void checkID(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		memService = new MemberIDCheckAction();
		
		memService.action(model);
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest) map.get("request");
		int check = (Integer)request.getAttribute("check");
		System.out.println(check);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/*@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
			memService = new MemberLoginCheckAction();
			memService.action(model);
		
		Map<String, Object> map = model.asMap();
		int check = (Integer)map.get("check");
		
//		if(check==1) {
			session.setAttribute("id", request.getParameter("id"));
			session.setAttribute("pw", request.getParameter("pw"));
			
			// memberNum을 session에 추가
			MemberDao dao = new MemberDao();
			MemberDTO member = dao.memberGetbyID(request.getParameter("id"));
			session.setAttribute("memberNum", member.getMember_number());
			
			// 첫 페이지의 게시물을 게시
			int stage = 1;
			request.setAttribute("stage", stage);
			model.addAttribute("request", request);
			
			postService = new PostMainGetAction();
			postService.action(model);
			
			return "main";
//		} else if(check==0) {
//			return "index";
//		} else {
//			return "index";
//		}
	}*/
	
	@RequestMapping("/profile")
	public String profile(HttpServletRequest request, HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		/*if(session.getAttribute("id") != null){
			model.addAttribute("request", request);
			memService = new MemberProfileAction();
			memService.action(model);
			return "profile";
		}else{
			return "index";
		}*/
		
		
		try{
	  		if(session.getAttribute("id") != null){
	  			model.addAttribute("request", request);
				memService = new MemberProfileAction();
				memService.action(model);
				return "profile";
	  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
	  			//chooseNum=3;
	  			PrintWriter out = response.getWriter();
	  			out.println("<script type='text/javascript'>");
				out.println("alert('세션이 없습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
	  			return "index";
	  		}else{
	  		}
	  	}catch(Exception e){
	  	}
		return "index";
	}
	
	@RequestMapping("/profileseemore")
	public String profileseemore(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		memService = new MemberProfileAction();
		memService.action(model);
		
		return "profileseemore";
		
	}
	@RequestMapping("/postdetailviewer")
	public String postDetailViewer(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		picService = new ProfilePictureGetAction();
		picService.action(model);
		return "postdetailviewer";
	}
	
	@RequestMapping("/pwModify")
	public String pwModify(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		
		/*if(session.getAttribute("id") != null){
			return "pwModify";
		}else{
			return "index";
		}*/
		
		
		try{
	  		if(session.getAttribute("id") != null){
	  			return "pwModify";
	  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
	  			//chooseNum=3;
	  			PrintWriter out = response.getWriter();
	  			out.println("<script type='text/javascript'>");
				out.println("alert('세션이 없습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
	  			return "index";
	  		}else{
	  		}
	  	}catch(Exception e){
	  	}
		return "index";
	}
	
	@RequestMapping("/profileModify")
	public String profileModify(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		
		/*if(session.getAttribute("id") != null){
			model.addAttribute("request", request);
			memService = new MemberGetAction();
			memService.action(model);
			return "profileModify";
		}else{
			return "index";
		}*/
		
		
		try{
	  		if(session.getAttribute("id") != null){
	  			model.addAttribute("request", request);
				memService = new MemberGetAction();
				memService.action(model);
				return "profileModify";
	  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
	  			//chooseNum=3;
	  			PrintWriter out = response.getWriter();
	  			out.println("<script type='text/javascript'>");
				out.println("alert('세션이 없습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
	  			return "index";
	  		}else{
	  		}
	  	}catch(Exception e){
	  	}
		return "index";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	

	
	@RequestMapping(value="/profileModifyOk", method=RequestMethod.POST)
	public String profileModifyOk(MultipartHttpServletRequest request, Model model) {
		MultipartFile uploadfile = request.getFile("uploadfile");
		if(uploadfile != null) {
			// fileName은 경로를 제외한 순수파일이름만을 가져온다.
			String fileName = uploadfile.getOriginalFilename(); 
			// root_path 파일이 저장될 절대 경로 workspace안에 위치한 프로젝트 파일위치
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String middle_path = "resources/ProfilePic/";
			String ext = ".jpg";
//			String ext = fileName.substring(fileName.indexOf("."), fileName.length());
			String newFileName = request.getParameter("memberNum") + ext;
			String fullName = root_path + middle_path + newFileName;
			try {
				File file = new File(fullName);
				//지정 위치에 파일 업로드 작업
				uploadfile.transferTo(file);
				request.setAttribute("path", newFileName);
				model.addAttribute("request", request);
				memService = new MemberModifyAction();
				memService.action(model);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:profile";
	}
	
	@RequestMapping("/postInsert")
	public String postInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		
		/*if(session.getAttribute("id") != null){
			return "postInsert";
		}else{
			return "index";
		}*/
		
		try{
	  		if(session.getAttribute("id") != null){
	  			return "postInsert";
	  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
	  			//chooseNum=3;
	  			PrintWriter out = response.getWriter();
	  			out.println("<script type='text/javascript'>");
				out.println("alert('세션이 없습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
	  			return "index";
	  		}else{
	  		}
	  	}catch(Exception e){
	  	}
		return "index";
	}
	
	@RequestMapping(value="/postInsertOK", method=RequestMethod.POST)
	public String postInsertOK(MultipartHttpServletRequest request, Model model) {
		List<MultipartFile> uploadfile = request.getFiles("pic");
		model.addAttribute("request", request);
		
		// post 작성 & member_post_number +1 해주는 코드 작성
		postService = new PostAddAction();
		postService.action(model);
		
		Map<String, Object> map = model.asMap();
		int postNum = (Integer) map.get("postNum");
		System.out.println(postNum);
		
		// 다중 파일 입출력 한개의post_number값으로 picture테이블에 각각의 path를 넣어주는 기능
		int i=0;
		for(i=0; i<uploadfile.size()-1; i++){
			try {
				System.out.println(new String(uploadfile.get(i).getOriginalFilename().getBytes("8859_1"), "utf-8"));
				String fileName = uploadfile.get(i).getOriginalFilename();
				String root_path = request.getSession().getServletContext().getRealPath("/");
				//위치 만들어야 함
				String middle_path = "resources/PostPic/";
				String ext =".jpg";
				String newFileName = postNum + "_" + i + ext;
				//String newFileNameDetail = postNum + "_" + i;
				System.out.println(newFileName);
				String fullName = root_path + middle_path + newFileName;
				
				File file = new File(fullName);
				uploadfile.get(i).transferTo(file);
				request.setAttribute("path", newFileName);
				request.setAttribute("postNum", postNum);
				request.setAttribute("DetailNum", i);
				model.addAttribute("request", request);

				picService = new PictureAddAction();
				picService.action(model);
				
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
		/*if(uploadfile != null && uploadfile.size() > 0){
			for(MultipartFile multipartFile : uploadfile){
				String fileName = multipartFile.getOriginalFilename();
				String root_path = request.getSession().getServletContext().getRealPath("/");
				//위치 만들어야 함
				String middle_path = "resources/PostPic/";
				String ext =".jpg";
				String newFileName = request.getParameter("memberNum") + ext;
				String fullName = root_path + middle_path + newFileName;
				try{
					File file = new File(fullName);
					multipartFile.transferTo(file);
					request.setAttribute("path", newFileName);
					model.addAttribute("request", request);
					pservice = new PostPictureSet();
					pservice.action(model);
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
		}*/

		int stage = 1;
		request.setAttribute("stage", stage);
		model.addAttribute("request", request);
		
		postService = new PostMainGetAction();
		postService.action(model);
		return "redirect:main";
	}
	
	/*@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") != null){
			int stage = 1;
			request.setAttribute("stage", stage);
			model.addAttribute("request", request);
			
			postService = new PostMainGetAction();
			postService.action(model);
			return "main";
		}else{
			
			return "index";
		}
		
	}*/
	
	@RequestMapping("/main")
	   public String main(HttpServletRequest request, HttpServletResponse response, Model model) {
			response.setContentType("text/html; charset=UTF-8");
			HttpSession session = request.getSession();
			String alpabet = null;
		
			try{
		  		if(session.getAttribute("id") != null && request.getParameter("id") == null){
		  			alpabet="a";
		  		}else if(session.getAttribute("id") == null && request.getParameter("id") != null){
		  			alpabet="b";
		  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
		  			//chooseNum=3;
		  			PrintWriter out = response.getWriter();
		  			out.println("<script type='text/javascript'>");
					out.println("alert('세션이 없습니다.');");
					out.println("location.href='index';");
					out.println("</script>");
					out.flush();
					return "index";
		  			
		  		}
		  	}catch(Exception e){
		  		
		  	}
			
	    
	      
	      if(alpabet == "a"){ // 정상 작동
	         int stage = 1;
	         System.out.println("정상작동");
	         System.out.println(request);
	         request.setAttribute("stage", stage);
	         model.addAttribute("request", request);
	         
	         postService = new PostMainGetAction();
	         postService.action(model);
	         return "main";
	      }else if(alpabet == "b"){ //처음 입장
	         model.addAttribute("request", request);
	         model.addAttribute("response", response);
	         
	         memService = new MemberLoginCheckAction();
	         memService.action(model);
	         
	         
	         Map<String, Object> map = model.asMap();
	         int check = (Integer)map.get("check");
	         System.out.println(check);
	         
	         if(check !=1){
	        	 return "index";
	         }
	         
	         session.setAttribute("id", request.getParameter("id"));
	         session.setAttribute("pw", request.getParameter("pw"));
	         
	         // memberNum을 session에 추가
	         MemberDao dao = new MemberDao();
	         MemberDTO member = dao.memberGetbyID(request.getParameter("id"));
	         session.setAttribute("memberNum", member.getMember_number());
	         session.setAttribute("memberName", member.getMember_name());
	         
	         // 첫 페이지의 게시물을 게시
	         int stage = 1;
	         System.out.println("처음 입장");
	         System.out.println(request);
	         request.setAttribute("stage", stage);
	         model.addAttribute("request", request);
	         
	         postService = new PostMainGetAction();
	         postService.action(model);
	         return "main";
	      }/*else if(chooseNum == 3){ //처음 입장후 프로필 간후 뒤로가기할때
	         model.addAttribute("request", request);
	         model.addAttribute("response", response);

	         // 첫 페이지의 게시물을 게시
	         int stage = 1;
	         System.out.println("이상한데서 들어왔다!");
	         System.out.println(request);
	         request.setAttribute("stage", stage);
	         model.addAttribute("request", request);
	         
	         postService = new PostMainGetAction();
	         postService.action(model);
	         return "main";
	      }*/else{
	      }
	      return "index";
	   }
	
	//창훈 test
	
	@RequestMapping("/mainseemore")
	public String mainseemore(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
			
		postService = new PostMainGetAction();
		postService.action(model);
		return "mainseemore";
		
	}
	
	//여까지
	
	
	@RequestMapping("/replyAdd")
	@ResponseBody
	public void replyAdd(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
		postService = new PostReplyAddAction();
		postService.action(model);
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		
		/*if(session.getAttribute("id") != null){
			model.addAttribute("request", request);
			
			memService = new MemberSearchAction();
			memService.action(model);
			return "search";
		}else{
			
			return "index";
		}*/
		
		try{
	  		if(session.getAttribute("id") != null){
	  			model.addAttribute("request", request);
				
				memService = new MemberSearchAction();
				memService.action(model);
				return "search";
	  		}else if(session.getAttribute("id") == null && request.getParameter("id") == null){
	  			//chooseNum=3;
	  			PrintWriter out = response.getWriter();
	  			out.println("<script type='text/javascript'>");
				out.println("alert('세션이 없습니다.');");
				out.println("location.href='index';");
				out.println("</script>");
				out.flush();
	  			return "index";
	  		}else{
	  		}
	  	}catch(Exception e){
	  	}
		return "index";
		
	}
	
	@RequestMapping("/memberFollow")
	public void memberFollow(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		System.out.println("컨트롤러 들어옴");
		memService = new MemberFollow();
		memService.action(model);
	}
	
	@RequestMapping("/memberFollowCancel")
	public void memberFollowCancel(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		memService = new MemberFollowCancel();
		memService.action(model);
	}
	
	@RequestMapping("/memberFollowCheck")
	public void memberFollowCheck(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		memService = new MemberFollowCheck();
		memService.action(model);
	}
	
	@RequestMapping("/memberDelete")
	public String memberDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		memService = new MemberDeleteAction();
		memService.action(model);
		return "redirect:logout";
	}
	
	
}
