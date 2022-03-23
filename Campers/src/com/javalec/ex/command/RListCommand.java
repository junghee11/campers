package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.reviewDto;

public class RListCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		myDao dao = myDao.getInstance();
		ArrayList<reviewDto> dtos = dao.list();
		request.setAttribute("list", dtos);
	}

}
