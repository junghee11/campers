package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;

public class RModifyReview implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String review_idx = request.getParameter("review_idx");
		String rContent = request.getParameter("rContent");
		
		myDao dao = myDao.getInstance();
		dao.modifyReview(review_idx, rContent);
	}

}
