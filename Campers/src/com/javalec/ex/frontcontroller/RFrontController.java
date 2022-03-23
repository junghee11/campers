package com.javalec.ex.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.ex.command.CAddCommand;
import com.javalec.ex.command.JAddCommand;
import com.javalec.ex.command.MFindMember;
import com.javalec.ex.command.PContentCommand;
import com.javalec.ex.command.PListCommand;
import com.javalec.ex.command.RCommand;
import com.javalec.ex.command.RContentCommand;
import com.javalec.ex.command.RDeleteCommand;
import com.javalec.ex.command.RDeleteReview;
import com.javalec.ex.command.RListCommand;
import com.javalec.ex.command.RModifyReview;
import com.javalec.ex.command.RMypageCommand;
import com.javalec.ex.command.RReplyCommand;
import com.javalec.ex.command.RUpdateMember;
import com.javalec.ex.command.RWriteCommand;
import com.javalec.ex.dao.myDao;

/**
 * Servlet implementation class RFrontController
 */
@WebServlet("*.do")
public class RFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		RCommand command =null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			viewPage = "index.jsp";
		} else if(com.equals("/commandDelete.do")) {
			HttpSession session = request.getSession();
			command = new RDeleteCommand();
			command.execute(request, response);
			session.invalidate();
			viewPage = "index.jsp";
		} else if(com.equals("/modify.do")) {
			command = new RUpdateMember();
			command.execute(request, response);
			viewPage = "mypage.do";
		} else if(com.equals("/review_list.do")) {
			command = new RListCommand();
			command.execute(request, response);
			viewPage = "review_list.jsp";
		} else if(com.equals("/write.do")) {
			command = new RWriteCommand();
			command.execute(request, response);
			viewPage = "review_list.do";
		} else if(com.equals("/review_view.do")) {
			command = new RContentCommand();
			command.execute(request, response);
			viewPage = "review_view.jsp";
		} else if(com.equals("/reply.do")) {
			command = new RReplyCommand();
			command.execute(request, response);
			viewPage = "review_list.do";
		} else if(com.equals("/reply_view.do")) {
			command = new RContentCommand();
			command.execute(request, response);
			viewPage = "reply_view.jsp";
		} else if(com.equals("/mypage.do")) {
			command = new RMypageCommand();
			command.execute(request, response);
			viewPage = "mypage.jsp";
		} 	else if(com.equals("/modify_review.do")) {
			command = new RModifyReview();
			command.execute(request, response);
			viewPage = "review_list.do";
		} else if(com.equals("/delete_review.do")) {
			command = new RDeleteReview();
			command.execute(request, response);
			viewPage = "review_list.do";
		} else if(com.equals("/shop_list.do")) {
			command = new PListCommand();
			command.execute(request, response);
			viewPage = "shop.jsp";
		} else if(com.equals("/item_detail.do")) {
			command = new PContentCommand();
			command.execute(request, response);
			viewPage = "item_detail.jsp";
		} else if(com.equals("/cart.do")) {
			command = new CAddCommand();
			command.execute(request, response);
			viewPage = "item_detail.do";
		} else if(com.equals("/like.do")) {
			command = new JAddCommand();
			command.execute(request, response);
			viewPage = "item_detail.do";
		} else if(com.equals("/find_member.do")) {
			command = new MFindMember();
			command.execute(request, response);
			viewPage = "showInfo.jsp";
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
