package com.aischool.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.WebMember;
import com.aischool.model.WebMemberDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String id = request.getParameter("id");

		WebMember member = new WebMember(email, pw, name, id);
		
		WebMemberDAO dao = new WebMemberDAO();
		
		int cnt = dao.memberJoin(member);
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("mainPage.jsp");
			dis.forward(request, response);
		}else {
			response.sendRedirect("mainPage.jsp");
		}	
	}

}
