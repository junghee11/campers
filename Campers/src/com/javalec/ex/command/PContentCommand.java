package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.itemDto;

public class PContentCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String item_idx = request.getParameter("item_idx");
		myDao dao = myDao.getInstance();
		itemDto dto = dao.itemView(item_idx);
		request.setAttribute("item_view", dto);
	}

}
