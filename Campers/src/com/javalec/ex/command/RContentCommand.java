package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.reviewDto;

public class RContentCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String review_idx = request.getParameter("review_idx");
		myDao dao = myDao.getInstance();
		reviewDto dto = dao.contentView(review_idx);
		
		request.setAttribute("content_view", dto);
		request.setAttribute("writerCheck", dto.getrName());
	}
}
