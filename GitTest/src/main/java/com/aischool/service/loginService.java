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


@WebServlet("/loginService")
public class loginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		WebMember member = new WebMember();
		member.setEmail(email);
		member.setPw(pw);
		
		WebMemberDAO dao = new WebMemberDAO();	
		WebMember member2 = dao.memberLogin(member);
		if(member2 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logindata", member2);
			response.sendRedirect("main.jsp");
			System.out.println("로그인 성공");
		}else {
			request.setAttribute("errorMsg", "이메일 또는 비밀번호를 다시 입력해주세요.");
            request.getRequestDispatcher("login.jsp").forward(request, response); //회원정보수정페이지로 
		}
		
	}

}
