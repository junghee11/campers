package com.javalec.ex.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;

public class CAddCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mem_id = request.getParameter("user_id");
		String item_idx = request.getParameter("item_idx");
		String amount = request.getParameter("amount");
		
		myDao dao = myDao.getInstance();
		dao.insertCart(mem_id, item_idx, amount);
	}

}
