package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;

public class RWriteCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String rName = request.getParameter("rName");
		String rTitle = request.getParameter("rTitle");
		String rContent = request.getParameter("rContent");
		
		myDao dao = myDao.getInstance();
		dao.writeReview(rName, rTitle, rContent);
	}

}
