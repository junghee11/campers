package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.myDao;
import com.javalec.ex.dto.memberDto;

public class MFindMember implements RCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String mem_id = request.getParameter("id");
		
		System.out.println(name+phone+mem_id);
		
		myDao dao = myDao.getInstance();
		memberDto dto = null;
		
		if(mem_id == null) {
			dto = dao.findId(name, phone);
			request.setAttribute("id", dto.getId());
		} else if(phone == null) {
			dto = dao.findPw(name, mem_id);
			request.setAttribute("pw", dto.getPw());
		}
	}

}
