package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;

public class RReplyCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String review_idx = request.getParameter("review_idx");
		String rName = request.getParameter("rName");
		String rTitle = request.getParameter("rTitle");
		String rContent = request.getParameter("rContent");
		
		String rGroup = request.getParameter("rGroup");
		String rStep = request.getParameter("rStep");
		String rIndent = request.getParameter("rIndent");
		
		myDao dao = myDao.getInstance();
		dao.reply(review_idx, rName, rTitle, rContent, rStep, rGroup, rIndent);
	}

}
