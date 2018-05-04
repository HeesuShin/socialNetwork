package com.picture.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.picture.dao.PictureDao;

public class PictureAddAction implements PictureService {

	@Override
	public void action(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		PictureDao dao = new PictureDao();
		try {
			dao.setPostNumForPicture((Integer)request.getAttribute("DetailNum"), (String)request.getAttribute("path"),"a", (Integer)request.getAttribute("postNum"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
