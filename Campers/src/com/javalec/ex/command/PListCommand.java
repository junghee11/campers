package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.itemDto;

public class PListCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String category = request.getParameter("category");
		
		myDao dao = myDao.getInstance();
		ArrayList<itemDto> dtos = dao.itemList(category);
		request.setAttribute("itemlist", dtos);
	}

}
