package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.cartDto;
import com.javalec.ex.dto.itemDto;
import com.javalec.ex.dto.jjimDto;
import com.javalec.ex.dto.reviewDto;

public class RMypageCommand implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		String a = (String)request.getAttribute("id"); 
		System.out.println(a);
		
		myDao dao = myDao.getInstance();
		ArrayList<reviewDto> rdto = dao.myreview(id);
		ArrayList<cartDto> cdto = dao.mycart(id);
		ArrayList<itemDto> jdto = dao.myjjim(id);
		int total = dao.ttl;
		
		request.setAttribute("myreview", rdto);
		request.setAttribute("mycart", cdto);
		request.setAttribute("myjjim", jdto);
		request.setAttribute("total", total);
	}

}
