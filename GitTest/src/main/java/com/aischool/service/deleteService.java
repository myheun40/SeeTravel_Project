package com.aischool.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aischool.model.WebMember;
import com.aischool.model.WebMemberDAO;

@WebServlet("/deleteService")
public class deleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에서 로그인한 사용자의 이메일을 가져옴
		HttpSession session = request.getSession();
		WebMember member = (WebMember) session.getAttribute("logindata");
		
		if (member == null) {
		// 로그인되지 않은 상태라면 로그인 페이지로 리다이렉트
			response.sendRedirect("mainPage.jsp");
            return;
		}
		String email = member.getEmail();

		//요청에서 비밀번호를 가져옴
		String pw = request.getParameter("pw");	

		
		WebMemberDAO dao = new WebMemberDAO();
		
		int cnt = dao.memberDelete(email, pw);
		
		
		if (cnt > 0 ) {
			session.invalidate();
			response.sendRedirect("main.jsp");
		}else {
			request.setAttribute("errorMsg", "비밀번호를 다시 입력하세요.");
            request.getRequestDispatcher("Mypage.jsp").forward(request, response);
		}
		
	}

}
